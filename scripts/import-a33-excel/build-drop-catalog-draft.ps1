$RawDir = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\raw"
$OutputPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\catalog-drop-draft.csv"

$Sheets = @(
  @{ file = "DROP-1.csv"; code = "DROP 1" },
  @{ file = "DROP-2.csv"; code = "DROP 2" },
  @{ file = "SUMMER-DROP.csv"; code = "SUMMER DROP" },
  @{ file = "A33-X-NO-ART.csv"; code = "A33 X NO ART" },
  @{ file = "DROP-3.csv"; code = "DROP 3" },
  @{ file = "DROP-4.csv"; code = "DROP 4" },
  @{ file = "DROP-5.csv"; code = "DROP 5" }
)

$allRows = @()

foreach ($sheet in $Sheets) {
  $path = Join-Path $RawDir $sheet.file
  if (-not (Test-Path $path)) {
    continue
  }

  $rows = Import-Csv $path
  $stop = $false

  foreach ($row in $rows) {
    if ($stop) {
      break
    }

    $name = [string]$row.col_16
    $price = [string]$row.col_17
    $qtyM = [string]$row.col_18
    $qtyL = [string]$row.col_19
    $units = [string]$row.col_20
    $total = [string]$row.col_21

    if ($name -match "INGRESOS TOTALES FINALES|INGRESOS FINALES CON %") {
      $stop = $true
      continue
    }

    if ([string]::IsNullOrWhiteSpace($name)) {
      continue
    }

    if ($name -like "System.Xml*") {
      continue
    }

    if ($name -notmatch "[A-Za-z]") {
      continue
    }

    if ($name -match "INGRESOS|PRECIO|UNIDADES|TOTAL|COSTE") {
      continue
    }

    $priceNumber = 0
    $qtyMNumber = 0
    $qtyLNumber = 0
    $unitsNumber = 0
    $totalNumber = 0

    if (-not [decimal]::TryParse($price, [ref]$priceNumber)) {
      continue
    }

    if ($priceNumber -le 0) {
      continue
    }

    [void][int]::TryParse($qtyM, [ref]$qtyMNumber)
    [void][int]::TryParse($qtyL, [ref]$qtyLNumber)
    [void][int]::TryParse($units, [ref]$unitsNumber)
    [void][decimal]::TryParse($total, [ref]$totalNumber)

    $slug = ($name.ToLowerInvariant() -replace '[^a-z0-9]+', '-').Trim('-')

    $allRows += [pscustomobject]@{
      drop_code = $sheet.code
      product_name = $name
      product_slug = $slug
      price_eur = $priceNumber
      qty_m = $qtyMNumber
      qty_l = $qtyLNumber
      qty_xl = ""
      units_total = $unitsNumber
      revenue_total = $totalNumber
    }
  }
}

$allRows |
  Group-Object drop_code, product_slug |
  ForEach-Object { $_.Group | Select-Object -First 1 } |
  Sort-Object drop_code, product_slug |
  Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Output "Generado borrador de catalogo: $OutputPath"
