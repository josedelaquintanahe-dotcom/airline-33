# AIRLINE 33 - API Contracts

## Objetivo

Definir contratos minimos para las superficies backend que conectaran operacion, `Supabase` y futuras automatizaciones `n8n`.

## Reglas generales

- todos los endpoints responden JSON;
- no exponen credenciales ni secretos;
- toda operacion sensible debe ser idempotente o rechazar duplicados;
- las validaciones de negocio criticas no quedan delegadas a tooling externo.
- no se aceptan campos arbitrarios de `metadata` o `properties` sin allowlist.

## Convenciones

- `Content-Type: application/json`
- fechas en formato `ISO 8601`
- ids internos en formato `UUID`
- errores con estructura `{ "error": { "code": "...", "message": "..." } }`
- rechazo de campos no documentados en escritura

## `POST /api/manual-sale`

Registra una venta manual y sus lineas.

### Input

```json
{
  "channel": "manual",
  "customer": {
    "full_name": "Cliente Demo",
    "email": "demo@example.com",
    "phone": "+34600000000"
  },
  "items": [
    {
      "sku_code": "A33-SHADOW-TEE-M",
      "quantity": 1,
      "unit_price": 42
    }
  ],
  "currency": "EUR",
  "payment_status": "paid",
  "payment_method": "payment_link",
  "notes": "Venta manual validada por operacion"
}
```

### Validaciones

- al menos una linea;
- `sku_code` existente;
- `quantity > 0`;
- no stock negativo salvo ajuste autorizado;
- si `payment_status = paid`, `payment_method` obligatorio;
- deduplicacion por `email` y/o `phone` cuando existan.

### Output

```json
{
  "order_id": "uuid",
  "order_number": "A33-DEV-0001",
  "status": "paid",
  "stock_resolved": true
}
```

Payload de referencia:

- `automations/payloads/manual-sale.example.json`

## `POST /api/stock-entry`

Registra entrada de stock por SKU.

### Input

```json
{
  "sku_code": "A33-SHADOW-TEE-M",
  "quantity": 10,
  "unit_cost": 16.5,
  "supplier_id": "uuid",
  "reference_document": "PO-DEMO-001",
  "warehouse_code": "MADRID",
  "notes": "Recepcion parcial del proveedor"
}
```

### Validaciones

- `sku_code` existente;
- `quantity > 0`;
- `unit_cost >= 0`;
- proveedor valido si se informa.

Payload de referencia:

- `automations/payloads/stock-entry.example.json`

## `POST /api/costs`

Registra un coste operativo.

### Input

```json
{
  "cost_type": "production",
  "status": "confirmed",
  "amount": 165,
  "currency": "EUR",
  "drop_id": "uuid",
  "supplier_id": "uuid",
  "reference_document": "PO-DEMO-001",
  "incurred_at": "2026-04-28T09:00:00Z",
  "notes": "Coste de produccion del drop"
}
```

### Validaciones

- `cost_type` obligatorio;
- `amount > 0`;
- moneda valida;
- relaciones existentes si se informan.

Payload de referencia:

- `automations/payloads/cost-registration.example.json`

## `POST /api/returns`

Abre o actualiza una devolucion.

### Input

```json
{
  "order_id": "uuid",
  "customer_id": "uuid",
  "reason_code": "size",
  "refund_amount": 42,
  "restock_decision": "restock",
  "notes": "Solicitud iniciada por operacion"
}
```

### Validaciones

- `order_id` existente;
- `refund_amount >= 0`;
- no refund superior al cobrado;
- `restock_decision` coherente con el estado del producto.

Payload de referencia:

- `automations/payloads/return.example.json`

## `GET /api/stock`

Devuelve disponibilidad por SKU.

### Query params sugeridos

- `sku_code`
- `product_id`
- `drop_id`
- `status`

### Output minimo

```json
{
  "items": [
    {
      "sku_id": "uuid",
      "sku_code": "A33-SHADOW-TEE-M",
      "product_name": "Shadow Tee",
      "stock_balance": 9
    }
  ]
}
```

## `GET /api/dashboard`

Devuelve agregados operativos.

### Output minimo

```json
{
  "week_start": "2026-04-27T00:00:00Z",
  "orders_count": 1,
  "revenue_total": 47,
  "units_sold": 1
}
```

## `GET /api/orders`

Lista pedidos con filtros operativos.

### Query params sugeridos

- `status`
- `payment_status`
- `customer_id`
- `date_from`
- `date_to`

## `GET /api/customers`

Lista clientes y señales de CRM.

### Query params sugeridos

- `email`
- `phone`
- `customer_status`
- `acquisition_channel`

## Validaciones transversales

- no `SKUs` duplicados;
- no pedidos sin lineas;
- no stock negativo salvo ajuste autorizado;
- no costes sin categoria;
- no venta pagada sin metodo de pago;
- evitar duplicados de cliente por email o telefono.
- no aceptar PII libre dentro de `metadata`.

## Nota de implementacion

En este milestone se documentan contratos y payloads. La implementacion del backend puede quedar como capa posterior siempre que estos contratos gobiernen la integracion con `Supabase` y `n8n`.
