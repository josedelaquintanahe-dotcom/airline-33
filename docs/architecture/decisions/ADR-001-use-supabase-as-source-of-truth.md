# ADR-001 Use Supabase as Source of Truth

## Estado

Aprobado

## Contexto

AIRLINE 33 necesita una base central para operar productos, SKUs, stock, pedidos, costes, clientes, drops y reporting sin depender de Excel como sistema principal.

## Decision

Usar `Supabase` como fuente de verdad operativa del negocio.

## Consecuencias

- El modelo relacional vivira en PostgreSQL gestionado por Supabase.
- Excel y Sheets quedaran como historico, importacion y reporting.
- Las integraciones externas deberan sincronizarse contra datos gobernados por Supabase.
- Las migraciones y politicas de acceso deben quedar versionadas en el repo.

## Alternativas descartadas

- `Excel` como sistema operativo principal.
- `Airtable` como fuente de verdad transaccional.
- `Shopify` como nucleo de datos desde la fase inicial.
