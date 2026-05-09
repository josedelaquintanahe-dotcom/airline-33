# Import A33 Excel

## Objetivo

Preparar una importacion controlada desde `doc-ref/A33.xlsx` hacia tablas normalizadas en `Supabase`.

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

## Referencias

- `operations/excel/mappings/A33-workbook-mapping.md`
- `supabase/migrations/20260509_001_initial_schema.sql`
- `scripts/validate-data/validate-a33-structure.ps1`
