# Database Model - Operaciones

## Objetivo

Describir el modelo complementario que Airline 33 puede mantener en `Supabase` sin duplicar el ecommerce inicial.

## Principio

En la primera fase:

- `Shopify` es la fuente principal inicial para catalogo publicado, variantes, checkout, pagos, pedidos, clientes compradores y stock operativo.
- `Supabase` guarda datos propios de leads, CRM, eventos, metricas, reporting y seguimiento operativo.

## Entidades utiles

- `leads`
- `crm_contacts`
- `drop_campaigns`
- `shopify_orders_summary`
- `stock_alerts`
- `customer_feedback`
- `reporting_snapshots`

## Regla

Solo sincronizar a `Supabase` lo que ayude a medir, organizar o automatizar mejor el relanzamiento.
