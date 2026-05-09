$InputPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\raw\\CLIENTES.csv"
$OutputPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\customers-draft.csv"

if (-not (Test-Path $InputPath)) {
  Write-Error "Primero exporta la hoja CLIENTES con export-a33-key-sheets.ps1."
  exit 1
}

$rows = Import-Csv $InputPath
$out = @()

foreach ($row in $rows) {
  $name = $row.col_1
  if ([string]::IsNullOrWhiteSpace($name)) {
    continue
  }

  if ($name -in @("CLIENTES", "AGO")) {
    continue
  }

  if ($name -match "Etiquetas de fila|Suma de") {
    continue
  }

  $out += [pscustomobject]@{
    full_name = $name
    email = ""
    phone = ""
    instagram_handle = ""
    acquisition_channel = "historical_excel"
    customer_status = "buyer"
    notes = "Borrador generado desde hoja CLIENTES; requiere limpieza manual."
  }
}

$out |
  Sort-Object full_name -Unique |
  Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Output "Generado borrador de clientes: $OutputPath"
