# Base de Datos - Airline 33

## Regla principal

En la primera fase, `Shopify` es la fuente principal inicial para catalogo publicado, variantes, checkout, pagos, pedidos, clientes compradores y stock operativo.

`Supabase` no reemplaza a `Shopify` en esta fase. Funciona como base complementaria para datos propios y operacion ampliada.

## Que debe vivir en Supabase

- leads y waitlist
- CRM propio
- eventos de marketing y comunidad
- metricas de lanzamiento
- resumen de pedidos sincronizados
- snapshots de stock si hacen falta para reporting
- tracking operativo de incidencias, devoluciones y aprendizajes

## Que no debe intentarse ahora

- duplicar toda la logica comercial de `Shopify`
- crear un ERP propio antes de vender
- modelar automatizaciones complejas sin datos reales

## Entidades iniciales recomendadas

- `leads`
- `crm_contacts`
- `drop_campaigns`
- `content_events`
- `shopify_orders_summary`
- `stock_alerts`
- `customer_feedback`
- `reporting_snapshots`

## Regla de sincronizacion

- `Shopify` genera el evento comercial.
- `n8n` captura, valida e idempotentiza.
- `Supabase` conserva el dato complementario o resumido que necesita el negocio.

## Criterio de exito

La base complementaria es util si ayuda a medir, organizar y aprender sin crear una segunda tienda paralela.
