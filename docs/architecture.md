# Arquitectura - Airline 33

## Objetivo

Construir un sistema simple, trazable y escalable para vender el primer drop sin perder control operativo.

## Arquitectura comercial inicial

`Instagram / Spotify / YouTube -> Shopify -> n8n -> Supabase -> reporting y operaciones`

## Reglas de arquitectura

- `Shopify` es la superficie comercial inicial.
- `Shopify` gobierna catalogo publicado, variantes, checkout, pagos, pedidos, clientes compradores y stock operativo inicial.
- `Supabase` guarda datos propios que Shopify no cubre como leads, CRM, eventos, metricas y reporting.
- `n8n` conecta sistemas y automatiza eventos repetitivos.
- La logica critica debe quedar documentada y auditable.
- No se implementa chatbot web.

## Capas

### Marca y canales

- `Instagram`
- `Spotify`
- `YouTube`

### Ecommerce

- `Shopify`

### Datos complementarios

- `Supabase`

### Automatizacion

- `n8n`

### Coordinacion tecnica

- `Codex`
- `Ruflo`
- `GitHub`

## Prioridad

Primero vender `Drop 001`. Despues ampliar automatizacion, reporting y sofisticacion operativa.
