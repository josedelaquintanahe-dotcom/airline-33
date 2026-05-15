[CmdletBinding()]
param(
  [string]$WorkbookPath = $env:A33_WORKBOOK_PATH
)

$MappingPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\mappings\\A33-workbook-mapping.md"

$errors = @()

if ([string]::IsNullOrWhiteSpace($WorkbookPath)) {
  $errors += "No se ha definido la ruta del workbook historico. Usa -WorkbookPath o la variable A33_WORKBOOK_PATH."
} elseif (-not (Test-Path $WorkbookPath)) {
  $errors += "No se encontro el workbook historico en la ruta indicada: $WorkbookPath"
}

if (-not (Test-Path $MappingPath)) {
  $errors += "No se encontro el mapping formal del workbook."
}

if ($errors.Count -gt 0) {
  $errors | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output "OK: estructura minima de importacion A33 disponible."
