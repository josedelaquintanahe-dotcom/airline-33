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

## Contrato operativo

- `Shopify` emite eventos comerciales.
- `n8n` procesa y enruta.
- `Supabase` guarda datos complementarios.
- Las APIs propias solo cubren huecos operativos o de seguridad.

## No incluido

- chatbot
- motor de recomendaciones complejo
- backend de ecommerce custom desde el inicio
