[CmdletBinding()]
param(
  [string]$WorkbookPath = $env:A33_WORKBOOK_PATH
)

$OutputDir = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\raw"

$TargetSheets = @(
  "CLIENTES",
  "REVOLUT",
  "DROP 1",
  "DROP 2",
  "SUMMER DROP",
  "A33 X NO ART",
  "DROP 3",
  "DROP 4",
  "DROP 5",
  "D1"
)

function Get-ExcelColumnIndex {
  param([string]$Reference)
  $letters = ($Reference -replace '\d','')
  $sum = 0
  foreach ($ch in $letters.ToCharArray()) {
    $sum = ($sum * 26) + ([int][char]::ToUpperInvariant($ch) - [int][char]'A' + 1)
  }
  return $sum
}

function Get-CellValue {
  param($Cell, $SharedStrings)

  if ($null -eq $Cell.v) {
    return ""
  }

  $value = [string]$Cell.v
  if ($Cell.t -eq "s") {
    $idx = [int]$value
    if ($idx -lt $SharedStrings.Count) {
      return [string]$SharedStrings[$idx]
    }
  }

  return $value
}

if ([string]::IsNullOrWhiteSpace($WorkbookPath)) {
  Write-Error "No se ha definido la ruta del workbook historico. Usa -WorkbookPath o la variable A33_WORKBOOK_PATH."
  exit 1
}

if (-not (Test-Path $WorkbookPath)) {
  Write-Error "No se encontro el workbook historico en la ruta indicada: $WorkbookPath"
  exit 1
}

New-Item -ItemType Directory -Force $OutputDir | Out-Null

Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($WorkbookPath)

try {
  [xml]$workbook = (New-Object IO.StreamReader(($zip.Entries | Where-Object FullName -eq "xl/workbook.xml").Open())).ReadToEnd()
  [xml]$relationships = (New-Object IO.StreamReader(($zip.Entries | Where-Object FullName -eq "xl/_rels/workbook.xml.rels").Open())).ReadToEnd()

  $sharedStrings = @()
  $sharedEntry = $zip.Entries | Where-Object FullName -eq "xl/sharedStrings.xml"
  if ($sharedEntry) {
    [xml]$sst = (New-Object IO.StreamReader($sharedEntry.Open())).ReadToEnd()
    foreach ($si in $sst.sst.si) {
      if ($si.t) {
        $sharedStrings += [string]$si.t
      } else {
        $sharedStrings += (($si.r | ForEach-Object { $_.t.'#text' }) -join '')
      }
    }
  }

  $relMap = @{}
  foreach ($rel in $relationships.Relationships.Relationship) {
    $relMap[$rel.Id] = $rel.Target
  }

  $rNs = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"

  foreach ($sheet in $workbook.workbook.sheets.sheet) {
    if ($TargetSheets -notcontains [string]$sheet.name) {
      continue
    }

    $rid = $sheet.GetAttribute("id", $rNs)
    $target = "xl/" + $relMap[$rid]
    [xml]$worksheet = (New-Object IO.StreamReader(($zip.Entries | Where-Object FullName -eq $target).Open())).ReadToEnd()

    $rows = @()
    $maxCols = 0

    foreach ($row in $worksheet.worksheet.sheetData.row) {
      $map = @{}
      foreach ($cell in $row.c) {
        $colIndex = Get-ExcelColumnIndex -Reference $cell.r
        $map[$colIndex] = Get-CellValue -Cell $cell -SharedStrings $sharedStrings
        if ($colIndex -gt $maxCols) {
          $maxCols = $colIndex
        }
      }
      $rows += ,$map
    }

    $csvRows = foreach ($row in $rows) {
      $obj = [ordered]@{}
      for ($i = 1; $i -le $maxCols; $i++) {
        $obj["col_$i"] = if ($row.ContainsKey($i)) { $row[$i] } else { "" }
      }
      [pscustomobject]$obj
    }

    $safeName = ([string]$sheet.name) -replace '[\\/:*?"<>| ]', '-'
    $outputPath = Join-Path $OutputDir "$safeName.csv"
    $csvRows | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8
    Write-Output "Exportada hoja: $($sheet.name) -> $outputPath"
  }
}
finally {
  $zip.Dispose()
}
