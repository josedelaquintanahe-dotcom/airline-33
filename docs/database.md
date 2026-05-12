# Base de datos - Airline 33

## Objetivo

Definir el modelo de datos inicial que soporta la operacion interna de Airline 33.

## Principio principal

`Supabase` es la fuente de verdad operativa complementaria del negocio. No sustituye a `Shopify` como ecommerce inicial, pero si gobierna inventario interno, drops, CRM, reporting y sincronizaciones.

## Entidades principales

### products

Catalogo maestro interno de producto.

Campos recomendados:
- `id`
- `name`
- `slug`
- `description`
- `category`
- `status`
- `base_price`
- `currency`
- `shopify_product_id`
- `created_at`
- `updated_at`

### product_variants

Variantes operativas por talla, color y SKU.

Campos recomendados:
- `id`
- `product_id`
- `size`
- `color`
- `sku`
- `base_price`
- `stock_quantity`
- `shopify_variant_id`
- `created_at`
- `updated_at`

### drops

Lanzamientos limitados o colecciones activables.

### customers

Clientes sincronizados desde `Shopify` y otros canales propios.

Campos recomendados:
- `id`
- `shopify_customer_id`
- `email`
- `phone`
- `first_name`
- `last_name`
- `source`
- `created_at`
- `updated_at`

### orders

Pedidos con referencia al origen comercial.

Campos recomendados:
- `id`
- `shopify_order_id`
- `customer_id`
- `order_number`
- `status`
- `total_amount`
- `currency`
- `payment_status`
- `shipping_status`
- `source_channel`
- `created_at`
- `updated_at`

### order_items

Lineas de pedido internas sincronizadas desde el canal de venta.

### inventory_movements

Entradas y salidas de stock trazables.

### leads

Leads y lista de espera previos o paralelos a la compra.

### automation_logs

Historial auditable de ejecuciones relevantes de `n8n` u otros procesos.

## Reglas

1. Toda tabla debe tener objetivo operativo claro.
2. Toda tabla con datos sensibles debe tener RLS o controles equivalentes.
3. No almacenar datos de pago completos.
4. No duplicar datos innecesariamente si ya existen en `Shopify`.
5. Toda sincronizacion con `Shopify` debe ser idempotente y trazable.
6. Todo cambio importante debe tener migracion y documentacion.

## Pendiente

- concretar el contrato exacto de sincronizacion entre `Shopify`, `Supabase` y `n8n`;
- definir el frontend interno que consumira estos datos;
- cerrar la relacion final con pagos adicionales fuera de Shopify si aparecen.
