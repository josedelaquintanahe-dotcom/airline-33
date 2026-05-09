# AIRLINE 33 - Modelo de Datos Inicial

Fecha de referencia: 2026-05-08

## Principios de modelado

- `Supabase` será la base de datos principal.
- El modelo debe soportar operación real antes del ecommerce completo.
- Inventario y caja se modelan como movimientos, no solo como saldos.
- Las integraciones externas guardan `external_id` y estado de sincronización.
- Se prioriza trazabilidad sobre comodidad temporal.

## Convenciones recomendadas

- `id uuid primary key`
- `created_at timestamptz not null default now()`
- `updated_at timestamptz not null default now()`
- `status` como texto controlado o enum según criticidad
- `metadata jsonb default '{}'::jsonb` para datos auxiliares

## 1. `products`

Propósito:

- entidad comercial principal del producto.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `slug` | `text` | único |
| `name` | `text` | nombre comercial |
| `description` | `text` | opcional |
| `category` | `text` | tee, hoodie, etc. |
| `status` | `text` | draft, active, archived |
| `brand_season` | `text` | ej. `FW26` |
| `drop_id` | `uuid` | FK opcional a `drops` |
| `supplier_id` | `uuid` | FK principal opcional |
| `base_currency` | `text` | `EUR` |
| `retail_price` | `numeric(12,2)` | precio orientativo |
| `compare_at_price` | `numeric(12,2)` | opcional |
| `launch_at` | `timestamptz` | opcional |
| `metadata` | `jsonb` | atributos extra |

Relaciones:

- 1 producto tiene muchos `skus`
- puede pertenecer a un `drop`
- puede tener muchos `costs`

## 2. `skus`

Propósito:

- variante vendible y stockable.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `product_id` | `uuid` | FK a `products` |
| `sku_code` | `text` | único |
| `barcode` | `text` | opcional |
| `size` | `text` | S, M, L, XL... |
| `color` | `text` | opcional |
| `material_variant` | `text` | opcional |
| `status` | `text` | active, inactive |
| `retail_price` | `numeric(12,2)` | si difiere del producto |
| `cost_basis` | `numeric(12,2)` | coste estándar actual |
| `weight_grams` | `integer` | opcional |
| `external_shopify_variant_id` | `text` | futuro |
| `metadata` | `jsonb` | |

Relaciones:

- un `sku` pertenece a un `product`
- un `sku` tiene muchos `stock_movements`
- un `sku` puede aparecer en muchos `order_items`

## 3. `stock_movements`

Propósito:

- ledger de inventario.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `sku_id` | `uuid` | FK a `skus` |
| `movement_type` | `text` | inbound, sale, return, adjustment, reserve, release, damaged |
| `quantity` | `integer` | signed o unsigned con convención fija |
| `unit_cost` | `numeric(12,2)` | opcional |
| `reference_type` | `text` | order, return, purchase, manual, sync |
| `reference_id` | `uuid` | FK lógica |
| `warehouse_code` | `text` | si aplica |
| `notes` | `text` | opcional |
| `effective_at` | `timestamptz` | fecha operativa |
| `metadata` | `jsonb` | |

Regla:

- el stock disponible debe derivarse de movimientos, no mantenerse a mano como valor aislado.

## 4. `orders`

Propósito:

- cabecera de pedido.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `order_number` | `text` | único, legible |
| `customer_id` | `uuid` | FK a `customers` |
| `channel` | `text` | manual, web, shopify, popup |
| `status` | `text` | draft, pending_payment, paid, fulfilled, cancelled, refunded, partially_refunded |
| `currency` | `text` | `EUR` |
| `subtotal_amount` | `numeric(12,2)` | |
| `discount_amount` | `numeric(12,2)` | |
| `shipping_amount` | `numeric(12,2)` | |
| `tax_amount` | `numeric(12,2)` | |
| `total_amount` | `numeric(12,2)` | |
| `payment_status` | `text` | unpaid, paid, refunded, partial |
| `fulfillment_status` | `text` | unfulfilled, partial, fulfilled, returned |
| `stripe_payment_intent_id` | `text` | opcional |
| `external_shopify_order_id` | `text` | futuro |
| `ordered_at` | `timestamptz` | |
| `paid_at` | `timestamptz` | opcional |
| `metadata` | `jsonb` | |

## 5. `order_items`

Propósito:

- líneas del pedido.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `order_id` | `uuid` | FK a `orders` |
| `sku_id` | `uuid` | FK a `skus` |
| `product_name_snapshot` | `text` | snapshot histórico |
| `sku_code_snapshot` | `text` | snapshot histórico |
| `quantity` | `integer` | |
| `unit_price` | `numeric(12,2)` | precio vendido |
| `unit_cost_snapshot` | `numeric(12,2)` | coste al momento |
| `discount_amount` | `numeric(12,2)` | |
| `line_total` | `numeric(12,2)` | |
| `metadata` | `jsonb` | |

## 6. `customers`

Propósito:

- perfil base de cliente.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `email` | `text` | índice único parcial |
| `phone` | `text` | opcional |
| `first_name` | `text` | |
| `last_name` | `text` | |
| `full_name` | `text` | denormalizado opcional |
| `instagram_handle` | `text` | opcional |
| `city` | `text` | |
| `country` | `text` | |
| `birth_date` | `date` | opcional |
| `acquisition_channel` | `text` | organic, referral, drop, paid, event |
| `marketing_consent_email` | `boolean` | |
| `marketing_consent_sms` | `boolean` | |
| `customer_status` | `text` | lead, buyer, repeat, vip, inactive |
| `first_order_at` | `timestamptz` | opcional |
| `last_order_at` | `timestamptz` | opcional |
| `metadata` | `jsonb` | |

## 7. `drops`

Propósito:

- campañas o ventanas de lanzamiento.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `code` | `text` | único |
| `name` | `text` | |
| `status` | `text` | planned, private_live, public_live, closed, archived |
| `theme` | `text` | opcional |
| `access_type` | `text` | public, exclusive, mixed |
| `starts_at` | `timestamptz` | |
| `ends_at` | `timestamptz` | opcional |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 8. `costs`

Propósito:

- costes directos e indirectos.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `cost_type` | `text` | production, packaging, shipping, ads, event, tooling, freelance, refund_fee, other |
| `status` | `text` | estimated, confirmed, paid |
| `amount` | `numeric(12,2)` | |
| `currency` | `text` | `EUR` |
| `product_id` | `uuid` | FK opcional |
| `sku_id` | `uuid` | FK opcional |
| `drop_id` | `uuid` | FK opcional |
| `supplier_id` | `uuid` | FK opcional |
| `reference_document` | `text` | factura, pedido, etc. |
| `incurred_at` | `timestamptz` | |
| `paid_at` | `timestamptz` | opcional |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 9. `suppliers`

Propósito:

- proveedores de producto, materiales o servicios.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `name` | `text` | |
| `supplier_type` | `text` | manufacturer, printer, logistics, packaging, creative, other |
| `contact_name` | `text` | |
| `email` | `text` | |
| `phone` | `text` | |
| `country` | `text` | |
| `vat_number` | `text` | opcional |
| `payment_terms` | `text` | opcional |
| `status` | `text` | active, inactive |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 10. `cash_movements`

Propósito:

- ledger simple de caja y movimientos monetarios operativos.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `movement_type` | `text` | sale_inflow, refund_outflow, expense_outflow, adjustment |
| `status` | `text` | pending, cleared, cancelled |
| `amount` | `numeric(12,2)` | signed o por tipo |
| `currency` | `text` | `EUR` |
| `occurred_at` | `timestamptz` | |
| `reference_type` | `text` | order, return, cost, manual |
| `reference_id` | `uuid` | FK lógica |
| `payment_provider` | `text` | stripe, cash, transfer |
| `external_reference` | `text` | id externo |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 11. `returns`

Propósito:

- devoluciones y refunds.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `order_id` | `uuid` | FK a `orders` |
| `customer_id` | `uuid` | FK a `customers` |
| `status` | `text` | requested, approved, received, refunded, rejected, closed |
| `reason_code` | `text` | size, defect, remorse, logistics, other |
| `refund_amount` | `numeric(12,2)` | |
| `currency` | `text` | `EUR` |
| `restock_decision` | `text` | restock, damaged, discard |
| `requested_at` | `timestamptz` | |
| `received_at` | `timestamptz` | opcional |
| `refunded_at` | `timestamptz` | opcional |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 12. `community_members`

Propósito:

- entidad de comunidad separada del cliente transaccional.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `customer_id` | `uuid` | FK opcional a `customers` |
| `email` | `text` | si aún no existe customer |
| `instagram_handle` | `text` | |
| `telegram_handle` | `text` | opcional |
| `source` | `text` | instagram, telegram, waitlist, event, referral, web |
| `status` | `text` | active, paused, removed |
| `tier` | `text` | public, close_friends, vip, founders_circle |
| `joined_at` | `timestamptz` | |
| `last_engaged_at` | `timestamptz` | opcional |
| `notes` | `text` | |
| `metadata` | `jsonb` | |

## 13. `marketing_events`

Propósito:

- eventos de relación, campañas y comportamiento relevante de marketing.

Campos sugeridos:

| Campo | Tipo | Notas |
| --- | --- | --- |
| `id` | `uuid` | PK |
| `customer_id` | `uuid` | FK opcional |
| `community_member_id` | `uuid` | FK opcional |
| `event_type` | `text` | email_open, email_click, waitlist_join, drop_access_sent, drop_access_used, sms_click, form_submit, event_attended |
| `source` | `text` | posthog, klaviyo, brevo, manual, web |
| `campaign_name` | `text` | opcional |
| `drop_id` | `uuid` | FK opcional |
| `occurred_at` | `timestamptz` | |
| `external_event_id` | `text` | opcional |
| `properties` | `jsonb` | detalles del evento |

## Relaciones clave

```text
products 1---n skus
products n---1 drops
products n---1 suppliers
skus 1---n stock_movements
orders n---1 customers
orders 1---n order_items
order_items n---1 skus
returns n---1 orders
returns n---1 customers
costs n---1 products/skus/drops/suppliers
community_members 0..1---1 customers
marketing_events n---1 customers
marketing_events n---1 community_members
```

## Vistas recomendadas desde el inicio

- `inventory_current_view`
- `orders_margin_view`
- `customer_ltv_view`
- `weekly_kpis_view`
- `drop_performance_view`

## Índices recomendados

- `skus(sku_code)`
- `orders(order_number)`
- `orders(customer_id, ordered_at desc)`
- `stock_movements(sku_id, effective_at desc)`
- `marketing_events(customer_id, occurred_at desc)`
- `community_members(instagram_handle)`

## Reglas operativas

1. No borrar movimientos de stock ni de caja; corregir con nuevos movimientos.
2. Guardar snapshots de nombre/precio/coste en `order_items`.
3. Separar cliente comprador de miembro de comunidad, aunque puedan unirse.
4. Toda integración externa debe guardar referencia externa y estado de sync.

## Extensiones futuras

- `inventory_reservations`
- `purchase_orders`
- `shipments`
- `discount_codes`
- `crm_notes`
- `support_tickets`
- `wholesale_accounts`
