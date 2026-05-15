# A33 Workbook Mapping

Fuente:

- workbook historico local no versionado facilitado manualmente para auditoria o importacion controlada

Fecha de revision:

- 2026-05-09

## Objetivo

Traducir el workbook historico local a una estructura importable hacia `Supabase` sin asumir que el libro actual ya esta normalizado.

## Conclusion inicial

El workbook mezcla:

- historico de clientes y ventas;
- resumenes financieros;
- cuentas de caja;
- control de drops;
- costes por produccion;
- hojas auxiliares de compras y produccion.

No conviene importar hoja por hoja de forma ciega. Conviene separar por dominio.

## Mapeo recomendado por hoja

### `CLIENTES`

Uso:

- base principal para `customers`
- apoyo para `orders`, `order_items` y `drops`

### `REVOLUT`

Uso:

- base de conciliacion para `cash_movements`
- referencia de costes y cobros reales

### Hojas `DROP 1`, `DROP 2`, `SUMMER DROP`, `A33 X NO ART`, `DROP 3`, `DROP 4`, `DROP 5`

Uso:

- base para `drops`
- base para `products`
- apoyo para `skus`
- apoyo para historico de `order_items`

### `D1`

Uso:

- candidata para combinacion `products` + `skus` + `costs`

### `A33`, `A33 (NEW)`, `BASE`

Uso:

- reporting historico
- contraste de presupuesto vs ingresos y gastos

No recomendacion:

- no importar estas hojas a tablas transaccionales.

### Hojas numeradas `1`, `2`, `3`, `4`, `5`, y `NO ART`, `SM`

Uso:

- apoyo para costes de produccion por drop o proveedor
- reconstruccion de costes y cantidades

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
