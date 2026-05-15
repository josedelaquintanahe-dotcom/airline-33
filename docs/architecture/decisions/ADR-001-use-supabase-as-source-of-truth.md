# ADR-001 - Usar Supabase como capa complementaria de datos propios

## Estado

Aprobado y actualizado

## Contexto

Airline 33 necesita datos propios para leads, CRM, eventos, metricas y reporting, pero en la primera fase el ecommerce inicial vive en `Shopify`.

## Decision

Usar `Supabase` como capa complementaria de datos propios y operacion ampliada, sin reemplazar el papel comercial inicial de `Shopify`.

## Consecuencias

- `Shopify` gobierna catalogo publicado, variantes, checkout, pagos, pedidos, clientes compradores y stock operativo inicial.
- `Supabase` guarda leads, CRM, eventos, metricas, reporting y resumentes operativos necesarios.
- `n8n` sincroniza eventos entre ambas capas cuando hace falta.

## Alternativas descartadas

- `Excel` como sistema principal
- `Airtable` como fuente transaccional
- duplicar el ecommerce completo dentro de `Supabase`
