# A33 Workbook Mapping

Fuente:

- [A33.xlsx](C:/Users/Manuel/PROJECTS/airline-33/doc-ref/A33.xlsx)

Fecha de revision:

- 2026-05-09

## Objetivo

Traducir el Excel historico `A33.xlsx` a una estructura importable hacia `Supabase` sin asumir que el libro actual ya esta normalizado.

## Conclusion inicial

El workbook mezcla:

- historico de clientes y ventas;
- resumenes financieros;
- cuentas de caja;
- control de drops;
- costes por produccion;
- y hojas auxiliares de compras/produccion.

No conviene importar hoja por hoja de forma ciega. Conviene separar por dominio.

## Mapeo recomendado por hoja

### `CLIENTES`

Uso:

- base principal para `customers`
- apoyo para `orders`, `order_items` y `drops`

Columnas visibles detectadas:

- `CLIENTE`
- `TALLA 2`
- `TALLA`
- `UNIDADES`
- `INGRESO`
- `DROP`

Mapeo propuesto:

| Excel | Destino |
| --- | --- |
| `CLIENTE` | `customers.full_name` |
| `TALLA` / `TALLA 2` | `order_items.metadata.size_raw` |
| `UNIDADES` | `order_items.quantity` |
| `INGRESO` | `orders.total_amount` o `order_items.line_total` segun granularidad final |
| `DROP` | `drops.code` y relacion con `orders` |

Riesgos:

- parece haber tablas dinamicas y bloques de resumen mezclados en la misma hoja;
- puede no haber una fila transaccional limpia por pedido.

### `REVOLUT`

Uso:

- base de conciliacion para `cash_movements`
- referencia de costes y cobros reales

Valores visibles detectados:

- referencias de drop
- descripcion libre de movimientos
- importes positivos y negativos
- saldo o `Current`

Mapeo propuesto:

| Excel | Destino |
| --- | --- |
| descripcion del movimiento | `cash_movements.notes` |
| importe | `cash_movements.amount` |
| tipo derivado por signo | `cash_movements.movement_type` |
| fecha si existe en filas posteriores | `cash_movements.occurred_at` |
| referencia a drop | `cash_movements.metadata.drop_code` |

Riesgos:

- la hoja parece mezclar conciliacion, saldo y notas de compras;
- hay que distinguir entradas por venta de salidas por compra.

### Hojas `DROP 1`, `DROP 2`, `SUMMER DROP`, `A33 X NO ART`, `DROP 3`, `DROP 4`, `DROP 5`

Uso:

- base para `drops`
- base para `products`
- apoyo para `skus`
- apoyo para historico de `order_items`

Patron detectado:

- nombre de producto o disenio
- `PRECIO`
- unidades por talla (`M`, `L`, a veces `XL`)
- `UNIDADES`
- `TOTAL`
- bloque de `INGRESOS FINALES` y otro de `INGRESOS`

Mapeo propuesto:

| Excel | Destino |
| --- | --- |
| nombre de hoja | `drops.code` |
| nombre de diseno | `products.name` |
| `PRECIO` | `products.retail_price` |
| `M` / `L` / `XL` | `skus.size` + volumen historico |
| `UNIDADES` | `order_items.quantity` agregado o `stock_movements` historicos si se reconstruye |
| `TOTAL` | `order_items.line_total` agregado o `drops` performance historica |

Riesgos:

- son hojas resumen, no pedidos individuales;
- sirven mejor para reconstruccion agregada que para importacion transaccional exacta.

### `D1`

Uso:

- candidata para combinacion `products` + `skus` + `costs`

Patron detectado:

- blanks por color
- coste unitario aparente
- tallas `M`, `L`, `XL`
- unidades
- total coste
- bloque paralelo de ingresos finales

Mapeo propuesto:

| Excel | Destino |
| --- | --- |
| color blank | `skus.color` o `products.metadata.blank_color` |
| coste unitario | `costs.amount` distribuido o `skus.cost_basis` |
| unidades por talla | `skus` + stock historico |
| total coste | `costs.amount` |

### `A33`, `A33 (NEW)`, `BASE`

Uso:

- reporting historico
- contraste de presupuesto vs ingresos/gastos

No recomendacion:

- no importar estas hojas a tablas transaccionales.

Destino recomendado:

- `operations/dashboards`
- vistas derivadas
- docs historicas

### Hojas numeradas `1`, `2`, `3`, `4`, `5`, y `NO ART`, `SM`

Uso:

- apoyo para costes de produccion por drop o proveedor
- reconstruccion de costes y cantidades

Patron detectado:

- precios en `$` y `€`
- `ENVIO`
- `TOTAL`
- `CANTIDAD`
- `FECHA`
- `COBRO`
- `INGRESOS`

Mapeo propuesto:

| Excel | Destino |
| --- | --- |
| coste total proveedor | `costs.amount` |
| `ENVIO` | `costs.cost_type = shipping` |
| `FECHA` | `costs.incurred_at` |
| `COBRO` | `cash_movements` o `costs.paid_at` |
| cantidades por talla | `skus` + `stock_movements` historicos |

## Estrategia de importacion recomendada

### Fase A

Importar con alta confianza:

- `customers`
- `drops`
- `products`
- `skus`

### Fase B

Importar con reglas derivadas:

- `costs`
- `cash_movements`

### Fase C

Reconstruccion historica si merece la pena:

- `orders`
- `order_items`
- `stock_movements`

## Regla practica

Si una hoja solo contiene resumenes agregados, debe ir a reporting historico y no a tablas transaccionales.

## Siguiente paso recomendado

Extraer encabezados y bloques limpios de estas hojas en CSV intermedio:

1. `CLIENTES`
2. `REVOLUT`
3. `DROP 1`
4. `DROP 2`
5. `SUMMER DROP`
6. `A33 X NO ART`
7. `DROP 3`
8. `DROP 4`
9. `DROP 5`
10. `D1`
