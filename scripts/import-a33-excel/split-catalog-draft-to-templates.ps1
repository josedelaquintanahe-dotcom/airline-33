$InputPath = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports\\catalog-drop-draft.csv"
$ImportsDir = Join-Path $PSScriptRoot "..\\..\\operations\\excel\\imports"

if (-not (Test-Path $InputPath)) {
  Write-Error "No existe catalog-drop-draft.csv. Ejecuta antes build-drop-catalog-draft.ps1."
  exit 1
}

$rows = @(
  Import-Csv $InputPath | Where-Object { $_.product_name -notlike "System.Xml*" }
)

$drops = @(
  $rows |
    Select-Object @{n="code";e={$_.drop_code}},
                  @{n="name";e={$_.drop_code}},
                  @{n="status";e={"archived"}},
                  @{n="access_type";e={"public"}},
                  @{n="starts_at";e={""}},
                  @{n="ends_at";e={""}},
                  @{n="notes";e={"Borrador generado desde A33.xlsx"}} |
    Sort-Object code -Unique
)

$products = @(
  $rows |
    Select-Object @{n="drop_code";e={$_.drop_code}},
                  @{n="slug";e={$_.product_slug}},
                  @{n="name";e={$_.product_name}},
                  @{n="category";e={"unknown"}},
                  @{n="status";e={"archived"}},
                  @{n="retail_price";e={$_.price_eur}},
                  @{n="brand_season";e={""}},
                  @{n="notes";e={"Borrador generado desde hojas de drops"}} |
    Sort-Object drop_code,slug -Unique
)

$skus = @()
foreach ($row in $rows) {
  foreach ($size in @(
      @{ key = "qty_m"; label = "M" },
      @{ key = "qty_l"; label = "L" },
      @{ key = "qty_xl"; label = "XL" }
    )) {
    $qty = $row.($size.key)
    if ([string]::IsNullOrWhiteSpace($qty)) {
      continue
    }

    $qtyNumber = 0
    if (-not [int]::TryParse([string]$qty, [ref]$qtyNumber)) {
      continue
    }

    if ($qtyNumber -le 0) {
      continue
    }

    $skuCode = "{0}-{1}-{2}" -f (($row.drop_code -replace '[^A-Za-z0-9]+','').ToUpperInvariant()), (($row.product_slug -replace '[^A-Za-z0-9]+','').ToUpperInvariant()), $size.label

    $skus += [pscustomobject]@{
      drop_code = $row.drop_code
      product_slug = $row.product_slug
      sku_code = $skuCode
      size = $size.label
      color = ""
      retail_price = $row.price_eur
      cost_basis = ""
      status = "archived"
      notes = "Cantidad historica detectada en A33.xlsx: $qtyNumber"
    }
  }
}

$dropsPath = Join-Path $ImportsDir "drops-draft.csv"
$productsPath = Join-Path $ImportsDir "products-draft.csv"
$skusPath = Join-Path $ImportsDir "skus-draft.csv"

$drops | Export-Csv -Path $dropsPath -NoTypeInformation -Encoding UTF8
$products | Export-Csv -Path $productsPath -NoTypeInformation -Encoding UTF8
@($skus | Sort-Object drop_code,product_slug,size -Unique) | Export-Csv -Path $skusPath -NoTypeInformation -Encoding UTF8

Write-Output "Generados drops-draft.csv, products-draft.csv y skus-draft.csv"
