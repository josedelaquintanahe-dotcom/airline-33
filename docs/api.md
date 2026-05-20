# API y eventos - Airline 33

## Objetivo

Definir contratos minimos entre `Shopify`, `n8n`, `Supabase` y futuras capas propias sin sobredisenar una API completa antes de tiempo.

## Principios

- priorizar webhooks y eventos simples
- proteger todos los endpoints internos
- no duplicar lo que `Shopify` ya resuelve
- no exponer datos sensibles sin necesidad

## Eventos prioritarios

- nuevo lead
- nuevo pedido
- pedido actualizado
- stock bajo
- devolucion o incidencia
- resumen de ventas
- reporting de contenido

## Eventos minimos del milestone 2

- suscripcion de email o waitlist
- `shopify/orders/create`
- `shopify/orders/updated`
- alerta de stock bajo por variante

Payloads de referencia:

- `automations/payloads/lead-capture.example.json`
- `automations/payloads/shopify-order-created.example.json`
- `automations/payloads/low-stock-alert.example.json`

## Endpoints internos sugeridos

```txt
POST /api/leads
POST /api/shopify/webhooks/orders-create
POST /api/shopify/webhooks/orders-updated
POST /api/shopify/webhooks/customers-create
POST /api/stock/alerts
POST /api/reporting/snapshots
GET  /api/health
```

## Nota de milestone

En este bloque no hace falta una API amplia. Basta con contratos claros para leads, pedidos y stock bajo.

## Contrato operativo

- `Shopify` emite eventos comerciales.
- `n8n` procesa y enruta.
- `Supabase` guarda datos complementarios.
- Las APIs propias solo cubren huecos operativos o de seguridad.

## No incluido

- chatbot
- motor de recomendaciones complejo
- backend de ecommerce custom desde el inicio
