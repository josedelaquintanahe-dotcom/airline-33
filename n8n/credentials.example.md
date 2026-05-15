# Credenciales n8n - Ejemplo

## Objetivo

Este archivo documenta que credenciales hacen falta en `n8n` sin incluir valores reales.

## Credenciales previstas

### Supabase

Uso:

- crear leads;
- consultar productos;
- actualizar stock;
- registrar pedidos.

Variables:

```env
SUPABASE_URL=
SUPABASE_SERVICE_ROLE_KEY=
```

### Email provider

```env
EMAIL_PROVIDER_API_KEY=
EMAIL_FROM=
```

### Shopify

```env
SHOPIFY_STORE_URL=
SHOPIFY_ADMIN_TOKEN=
SHOPIFY_WEBHOOK_SECRET=
```

### Webhooks internos

```env
INTERNAL_API_KEY=
WEBHOOK_SHARED_SECRET=
```
