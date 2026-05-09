# Manual Sale Workflow

## Objetivo

Automatizar una venta manual sin perder trazabilidad en `Supabase`.

## Flujo propuesto

1. trigger manual o webhook interno;
2. validacion de cliente y SKU;
3. creacion de pedido borrador;
4. generacion de enlace de pago o confirmacion de cobro;
5. actualizacion de pedido a `paid`;
6. creacion de `stock_movements`;
7. creacion de `cash_movements`;
8. evento de reporting y conciliacion.

## Nodos esperados

- `Webhook` o `Manual Trigger`
- `Set`
- `IF`
- `HTTP Request` o `Supabase`
- `Stripe` futuro
- `Respond to Webhook`

## Revision obligatoria

- idempotencia
- errores y reintentos
- datos minimos requeridos
- no duplicar pedidos ni movimientos
