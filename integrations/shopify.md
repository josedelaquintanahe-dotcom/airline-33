# Shopify

- uso en Airline 33: ecommerce inicial, catalogo publicado, colecciones, checkout y gestion comercial de tienda en la primera fase
- relacion con Supabase: Shopify vende; `Supabase` conserva la capa operativa complementaria, reporting y sincronizacion interna
- relacion con n8n: `n8n` sincroniza eventos, pedidos, clientes y stock hacia sistemas internos o auxiliares
- variables necesarias: `SHOPIFY_STORE_URL`, `SHOPIFY_ADMIN_TOKEN`, `SHOPIFY_STOREFRONT_TOKEN`
- configuracion: tienda, catalogo, colecciones, checkout, webhooks y mapeo de datos con `Supabase`
- prueba minima: lectura segura de productos o pedidos en entorno controlado y validacion de webhook de prueba
- errores comunes: duplicar la verdad entre `Shopify` y `Supabase`, romper idempotencia de pedidos, mezclar credenciales de admin y storefront
- agente responsable: `backend-agent` con apoyo de `n8n-automation-agent` e `integrations-agent`
- estado actual: definido como ecommerce inicial; configuracion real pendiente
