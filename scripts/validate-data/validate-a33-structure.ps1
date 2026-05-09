$WorkbookPath = Join-Path $PSScriptRoot "..\\..\\doc-ref\\A33.xlsx"
$MappingPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\mappings\\A33-workbook-mapping.md"

$errors = @()

if (-not (Test-Path $WorkbookPath)) {
  $errors += "No se encontro A33.xlsx en doc-ref."
}

if (-not (Test-Path $MappingPath)) {
  $errors += "No se encontro el mapping formal del workbook."
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output "OK: estructura minima de importacion A33 disponible."
