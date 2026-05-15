# API - Airline 33

## Objetivo

Definir la API necesaria para conectar frontend, backend, `Supabase`, `n8n` e integraciones externas.

## Principio principal

La API debe ser minima durante el MVP. Solo se crean endpoints cuando aportan valor real al negocio y no duplican flujos que ya resuelve `Shopify`.

## Endpoints iniciales recomendados

### Health

```txt
GET /health
```

### Leads

```txt
POST /api/leads
```

### Products

```txt
GET /api/products
GET /api/products/:slug
```

### Drops

```txt
GET /api/drops
GET /api/drops/:slug
```

### Webhooks

```txt
POST /api/webhooks/shopify/order-created
POST /api/webhooks/shopify/customer-created
POST /api/webhooks/internal/stock-low
```

## Reglas

- validar todos los inputs;
- verificar autenticacion o firma en todos los webhooks;
- no confiar en datos calculados por el frontend;
- no exponer claves ni errores sensibles;
- documentar contratos y payloads de ejemplo.

## Relacion con el stack

- `Shopify` gestiona el ecommerce inicial;
- `Supabase` conserva el estado operativo interno;
- `n8n` consume o dispara eventos automatizados;
- el backend sirve como capa de control, validacion y sincronizacion.
