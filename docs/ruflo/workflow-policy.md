# Workflow Policy

## Regla general

Los workflows de AIRLINE 33 deben ser trazables, revisables y apoyarse en `Supabase` como fuente de verdad.

## `precommit-review`

Antes de un commit importante:

1. revisar impacto funcional;
2. revisar seguridad si hay auth, webhooks, pagos o datos de cliente;
3. revisar cambios de schema si hay migraciones;
4. resumir alcance y riesgos;
5. proponer commit claro.

## `manual-sale`

1. crear pedido borrador;
2. validar cliente y SKU;
3. confirmar pago o enlace de pago;
4. registrar movimiento de stock;
5. registrar movimiento de caja;
6. sincronizar contabilidad si aplica.

## `stock-entry`

1. identificar proveedor y SKU;
2. registrar cantidad y coste;
3. crear movimiento de entrada;
4. actualizar reporting;
5. alertar si cambia disponibilidad de drop.

## `cost-registration`

1. registrar categoria de coste;
2. vincular a producto, drop o proveedor si aplica;
3. marcar estado estimado o confirmado;
4. reflejarlo en reporting y conciliacion.

## `returns`

1. localizar pedido;
2. registrar solicitud de devolucion;
3. validar politica;
4. ejecutar o preparar refund;
5. ajustar stock y caja;
6. dejar trazabilidad completa.

## `weekly-report`

1. consolidar ventas, unidades, stock, devoluciones y caja;
2. incluir drops y margen estimado;
3. exportar a dashboard o documento operativo;
4. marcar incidencias pendientes de conciliacion.

## `n8n-workflow-review`

1. revisar trigger;
2. revisar idempotencia;
3. revisar errores y reintentos;
4. revisar secretos y webhooks;
5. confirmar que no duplica logica critica ya definida en backend o base de datos.

## `supabase-migration-review`

1. revisar tablas y relaciones afectadas;
2. revisar constraints e indices;
3. revisar impacto en RLS;
4. revisar compatibilidad con imports, automations y reporting;
5. preparar rollback o plan de mitigacion si la migracion es sensible.
