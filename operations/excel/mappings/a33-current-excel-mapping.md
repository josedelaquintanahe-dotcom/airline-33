# AIRLINE 33 - Current Excel Mapping

## Objetivo

Traducir la futura plantilla operativa de Excel o Sheets a tablas y campos de `Supabase`, separandola del workbook historico local no versionado.

## Regla base

- la plantilla operativa es una capa de captura y reporting controlado;
- `Supabase` sigue siendo la fuente de verdad;
- el historico original no se reutiliza como input transaccional directo.

## Pestañas transaccionales

### `PRODUCTOS_SKU`

- destino principal: `products`, `skus`
- claves: `slug`, `sku_code`

Mapeo minimo:

| Columna | Destino |
| --- | --- |
| `drop_code` | `drops.code` |
| `product_slug` | `products.slug` |
| `product_name` | `products.name` |
| `category` | `products.category` |
| `sku_code` | `skus.sku_code` |
| `size` | `skus.size` |
| `color` | `skus.color` |
| `retail_price` | `skus.retail_price` o `products.retail_price` |
| `cost_basis` | `skus.cost_basis` |
| `status` | `products.status` / `skus.status` |

### `MOVIMIENTOS_STOCK`

- destino: `stock_movements`
- una fila por movimiento

| Columna | Destino |
| --- | --- |
| `sku_code` | `skus.sku_code` |
| `movement_type` | `stock_movements.movement_type` |
| `quantity` | `stock_movements.quantity` |
| `unit_cost` | `stock_movements.unit_cost` |
| `reference_type` | `stock_movements.reference_type` |
| `reference_id` | `stock_movements.reference_id` |
| `warehouse_code` | `stock_movements.warehouse_code` |
| `effective_at` | `stock_movements.effective_at` |

### `PEDIDOS`

- destino: `orders`
- una fila por pedido

| Columna | Destino |
| --- | --- |
| `order_number` | `orders.order_number` |
| `customer_key` | referencia a cliente |
| `channel` | `orders.channel` |
| `status` | `orders.status` |
| `payment_status` | `orders.payment_status` |
| `payment_method` | `orders.payment_method` |
| `fulfillment_status` | `orders.fulfillment_status` |
| `ordered_at` | `orders.ordered_at` |
| `paid_at` | `orders.paid_at` |
| `total_amount` | `orders.total_amount` |

### `LINEAS_PEDIDO`

- destino: `order_items`
- una fila por linea

| Columna | Destino |
| --- | --- |
| `order_number` | vinculacion logica |
| `sku_code` | `skus.sku_code` |
| `quantity` | `order_items.quantity` |
| `unit_price` | `order_items.unit_price` |
| `line_total` | `order_items.line_total` |

### `CLIENTES_CRM`

- destino: `customers` y segmentos operativos

| Columna | Destino |
| --- | --- |
| `full_name` | `customers.full_name` |
| `email` | `customers.email` |
| `phone` | `customers.phone` |
| `instagram_handle` | `customers.instagram_handle` |
| `acquisition_channel` | `customers.acquisition_channel` |
| `customer_status` | `customers.customer_status` |
| `segment_primary` | capa operativa / comunidad |

### `DROPS`

- destino: `drops`

### `COSTES`

- destino: `costs`

### `PROVEEDORES_COMPRAS`

- destino: `suppliers`

### `CAJA_BANCO`

- destino: `cash_movements`

### `DEVOLUCIONES_INCIDENCIAS`

- destino: `returns`

### `COMUNIDAD_WAITLIST`

- destino: `community_members`

## Pestañas de salida o apoyo

- `DASHBOARD`: reporting, no input transaccional.
- `STOCK_ACTUAL`: vista derivada de `inventory_current_view`.
- `MARKETING_CONTENIDO`: planning y reporting, no truth transaccional.
- `CONFIG`: listas cerradas, catalogos y umbrales.

## Validaciones antes de importar

- sin emails ni telefonos duplicados;
- sin `sku_code` duplicado;
- cantidades numericas y distintas de cero en movimientos;
- estados dentro de la lista oficial;
- sin columnas libres de `metadata` o `notes` sensibles;
- toda fecha en `ISO` o formato homogeneo definido.

## Campos prohibidos como libre texto

- PII sensible adicional;
- datos bancarios;
- tokens;
- notas internas sensibles;
- `metadata` arbitraria.

## Relacion con el historico

- `A33-workbook-mapping.md` sigue siendo referencia de auditoria;
- este documento define la plantilla operativa nueva, no el workbook heredado.
