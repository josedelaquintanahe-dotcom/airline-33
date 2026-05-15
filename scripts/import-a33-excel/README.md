# Import A33 Excel

## Objetivo

Preparar una importacion controlada desde un workbook historico local no versionado hacia tablas normalizadas en `Supabase`.

## Orden recomendado

1. validar estructura del workbook;
2. exportar hojas clave a CSV intermedio;
3. limpiar encabezados y bloques no tabulares;
4. importar maestros:
   - `drops`
   - `products`
   - `skus`
   - `customers`
5. importar costes y caja;
6. decidir si compensa reconstruir pedidos historicos.

## Regla de uso

El workbook historico no debe versionarse en el repo. Para ejecutar scripts, pasar su ruta por:

- parametro `-WorkbookPath`
- o variable de entorno `A33_WORKBOOK_PATH`

## Referencias

- `operations/excel/mappings/A33-workbook-mapping.md`
- `supabase/migrations/20260509_001_initial_schema.sql`
- `scripts/validate-data/validate-a33-structure.ps1`
