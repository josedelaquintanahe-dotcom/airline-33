# Arquitectura operativa - Airline 33

## Objetivo

Mantener una operacion simple para el relanzamiento y evitar que la infraestructura pese mas que el negocio.

## Regla central

- `Shopify` es la capa comercial inicial.
- `Supabase` conserva datos propios y complementarios.
- `n8n` automatiza eventos repetitivos.
- `Excel` y `Sheets` quedan para historico, importacion controlada y reporting puntual.

## Flujo base

1. La demanda nace en `Instagram`, `Spotify`, `YouTube` y la tienda.
2. `Shopify` gestiona producto publicado, checkout, pago, pedido y stock operativo inicial.
3. `n8n` recibe eventos y ejecuta alertas, reporting y sincronizaciones.
4. `Supabase` guarda leads, CRM, metricas, resumentes de pedidos y datos propios de operacion.

## Criterio

No construir un sistema mas complejo que el primer drop.
