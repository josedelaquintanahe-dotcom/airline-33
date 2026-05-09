# AIRLINE 33 - Workflows de Automatización

Fecha de referencia: 2026-05-08

## Principios

- El dato maestro vive en `Supabase`.
- `n8n` coordina pasos, notificaciones y sincronías.
- Toda automatización sensible debe ser idempotente.
- Las acciones financieras o contables deben dejar rastro y, si aplica, requerir aprobación.

## 1. Venta manual

### Objetivo

Cobrar una venta directa por DM, evento, showroom o contacto personal sin perder trazabilidad.

### Trigger

- creación manual de pedido borrador;
- o formulario interno de venta.

### Flujo

1. Operación crea `order` en estado `draft`.
2. Se añaden `order_items` y reserva de stock opcional.
3. `n8n` genera `payment_link` en `Stripe`.
4. Se envía link por canal correspondiente.
5. `Stripe` confirma pago.
6. `n8n` actualiza `order` a `paid`.
7. Se crean `stock_movements` de salida.
8. Se crea `cash_movement`.
9. Se dispara evento en `PostHog`.
10. Se crea o actualiza documento en `Holded` si aplica.

### Controles

- si el pago no llega en X horas, expirar reserva;
- evitar doble confirmación del mismo evento de pago;
- alertar si no hay stock suficiente antes de emitir el link.

## 2. Venta web

### Objetivo

Procesar compras desde la web propia con mínima intervención manual.

### Trigger

- evento de checkout/pago confirmado.

### Flujo

1. La web recoge carrito y datos de cliente.
2. Se inicia checkout con `Stripe`.
3. Webhook de `Stripe` entra en `n8n`.
4. `n8n` valida idempotencia.
5. Se crea o actualiza `customer`.
6. Se crea `order` y `order_items`.
7. Se registran `stock_movements`.
8. Se registra `cash_movement`.
9. Se envía evento de conversión a `PostHog`.
10. Se sincroniza con `Holded`.
11. Se añade el cliente a flujos de comunidad/marketing futuros.

### Controles

- webhook firmado;
- pedido no se da por válido sin confirmación de pago;
- conciliación diaria entre `Stripe` y `Supabase`.

## 3. Entrada de stock

### Objetivo

Registrar recepciones de proveedor y actualizar disponibilidad.

### Trigger

- formulario interno de recepción;
- o importación CSV controlada.

### Flujo

1. Operación selecciona proveedor y SKU.
2. Se registra cantidad recibida, coste unitario y referencia de compra.
3. `Supabase` crea `stock_movements` de tipo `inbound`.
4. Si el coste cambia, se crea registro en `costs`.
5. `n8n` recalcula dashboards.
6. Si un SKU vuelve a estar disponible, se desbloquean alertas o listas de espera relacionadas.

### Controles

- no permitir SKU inexistente;
- capturar lote, fecha y documento si aplica;
- diferenciar stock recibido de stock dañado o pendiente.

## 4. Registro de coste

### Objetivo

Guardar costes reales para margen por SKU, pedido y drop.

### Trigger

- alta manual;
- recepción de factura;
- o ajuste operativo.

### Flujo

1. Operación registra coste con categoría: producción, packaging, envío, sesión, ads, evento, otros.
2. Si el coste aplica a un producto o drop, se vincula.
3. `Supabase` guarda `costs`.
4. `n8n` actualiza tablas de margen y reportes.
5. Si el coste es facturable o contable, se refleja en `Holded` o se marca para conciliación.

### Controles

- exigir categoría y fecha;
- distinguir coste confirmado de estimado;
- no sobreescribir históricos: usar nuevos registros.

## 5. Devolución

### Objetivo

Procesar devoluciones sin romper stock, caja ni contabilidad.

### Trigger

- solicitud manual o formulario.

### Flujo

1. Operación localiza el `order`.
2. Se crea registro en `returns`.
3. Se valida motivo, estado y política aplicable.
4. Si procede, `n8n` ejecuta refund en `Stripe` o lo deja pendiente de aprobación.
5. Se crea `cash_movement` negativo o ajuste correspondiente.
6. Si el producto vuelve a inventario, se crea `stock_movement` de retorno.
7. Se actualiza estado de pedido/devolución.
8. Se sincroniza ajuste con `Holded`.

### Controles

- no permitir refund superior al cobrado;
- separar devolución recibida de devolución aprobada;
- distinguir restockable vs no restockable.

## 6. Stock bajo

### Objetivo

Detectar roturas de stock o riesgo de agotamiento en SKUs críticos.

### Trigger

- cron diario;
- o cada movimiento de stock.

### Flujo

1. `n8n` consulta SKUs con stock disponible por debajo de umbral.
2. Agrupa por producto y drop.
3. Envía alerta a canal operativo.
4. Marca incidencias en tabla o vista de seguimiento.
5. Si el SKU pertenece a un drop activo, añade prioridad alta.

### Controles

- umbrales por SKU, no globales;
- evitar spam con ventana de enfriamiento;
- distinguir stock bajo de stock reservado.

## 7. Reporte semanal

### Objetivo

Generar un resumen operativo y comercial semanal.

### Trigger

- cron semanal.

### Flujo

1. `n8n` consulta ventas, unidades, ticket medio, devoluciones, stock bajo, margen estimado y caja.
2. Consulta `PostHog` para tráfico, conversiones y campañas.
3. Cruza datos con drops activos.
4. Genera resumen en `Notion` y/o `Google Sheets`.
5. Envía versión corta por email o canal interno.

### Controles

- congelar rango temporal;
- registrar timestamp de generación;
- mostrar si hay datos pendientes de conciliación.

## 8. Drop exclusivo

### Objetivo

Operar drops reservados a comunidad activa.

### Trigger

- activación manual del drop;
- o fecha/hora programada.

### Flujo

1. Se define `drop` con reglas, fechas y SKUs.
2. `n8n` identifica elegibles desde `community_members` y `marketing_events`.
3. Se genera segmento de acceso.
4. Se envía comunicación o acceso anticipado.
5. Se monitoriza conversión y agotado.
6. Al cerrar ventana exclusiva, se habilita acceso público si aplica.

### Controles

- elegibilidad explícita;
- trazabilidad de quién recibió acceso;
- límite por cliente si se decide exclusividad real.

## 9. Segmentación de clientes

### Objetivo

Clasificar clientes por valor, recurrencia, afinidad con drops y engagement.

### Trigger

- cron diario o semanal.

### Flujo

1. `n8n` calcula métricas por cliente:
   - pedidos,
   - gasto total,
   - última compra,
   - devoluciones,
   - participación en drops,
   - interacción de marketing.
2. Asigna etiquetas o scores.
3. Actualiza `customers`, `community_members` o tablas derivadas.
4. Exporta segmentos a `Brevo`, `Klaviyo` o herramienta futura.

### Controles

- separar score calculado de datos fuente;
- guardar fecha del último cálculo;
- no perder histórico si cambia la segmentación.

## 10. Sincronización con Holded

### Objetivo

Enviar a `Holded` solo lo necesario para facturación y contabilidad.

### Trigger

- pedido pagado;
- refund;
- coste confirmado;
- o cron de conciliación.

### Flujo

1. `n8n` detecta registros pendientes de sincronizar.
2. Valida campos fiscales mínimos.
3. Crea o actualiza contacto/documento en `Holded`.
4. Guarda `external_id`, estado y timestamp de sync.
5. Si falla, reintenta y deja incidencia operativa.

### Controles

- no duplicar facturas;
- no bloquear la operación principal si Holded cae;
- conciliación periódica entre ambos sistemas.

## Workflows adicionales recomendados

- alerta de pago fallido;
- conciliación diaria `Stripe` vs `Supabase`;
- limpieza y enriquecimiento de clientes;
- exporte mensual a reporting histórico;
- backup de configuraciones críticas.

## Prioridad de implementación

### Primero

1. venta manual
2. entrada de stock
3. registro de coste
4. sincronización con Holded
5. reporte semanal

### Después

6. venta web
7. devolución
8. stock bajo
9. segmentación de clientes
10. drop exclusivo
