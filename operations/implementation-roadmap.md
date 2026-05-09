# AIRLINE 33 - Roadmap de Implementación

Fecha de referencia: 2026-05-08

## Objetivo

Llegar a septiembre de 2026 con un sistema operativo usable, trazable y ampliable sin rehacer la base.

## Enfoque

- construir primero el núcleo operativo;
- automatizar después lo repetitivo;
- sumar ecommerce cuando catálogo y stock estén controlados;
- y dejar la capa agentic/MCP para cuando el sistema ya tenga límites y permisos claros.

## Fase 1 - Sistema operativo interno

### Objetivo

Sacar AIRLINE 33 de Excel como sistema principal.

### Alcance

- diseñar y crear esquema inicial en `Supabase`;
- definir tablas maestras y vistas operativas;
- crear workflows base en `n8n`;
- documentar SOPs en `Notion`;
- definir reporting exportable a `Google Sheets`;
- habilitar venta manual y control de stock/costes.

### Entregables

- base de datos inicial operativa;
- flujos de venta manual, stock, costes, reportes y sync contable;
- estructura documental;
- diccionario de datos;
- reglas de operación.

### KPIs de salida

- 100% de pedidos nuevos registrados en `Supabase`;
- 100% de movimientos de stock trazables;
- reporte semanal automatizado;
- Excel relegado a histórico/importación controlada.

### Riesgos

- querer cubrir ecommerce demasiado pronto;
- mezclar reporting con operación;
- no fijar responsables por dato.

## Fase 2 - Automatización de ventas

### Objetivo

Reducir trabajo manual en cobro, actualización de pedidos y conciliación.

### Alcance

- integrar `Stripe`;
- automatizar confirmación de pago;
- registrar `cash_movements`;
- automatizar alertas e incidencias de venta;
- reforzar conciliación con `Holded`.

### Entregables

- webhooks de `Stripe`;
- flujo estable de venta manual cobrable por link;
- reportes de ventas y caja;
- control de refunds y devoluciones.

### KPIs de salida

- tiempo medio de procesamiento por venta reducido;
- cero pedidos pagados sin reflejo en `Supabase`;
- conciliación diaria con menos incidencias.

## Fase 3 - Ecommerce

### Objetivo

Lanzar canal web sin romper la operación.

### Alcance

- conectar web propia al modelo operativo;
- instrumentar `PostHog`;
- decidir si entra `Shopify` como motor ecommerce o si se mantiene stack custom;
- sincronizar catálogo, stock y pedidos.

### Entregables

- checkout web operativo;
- eventos analíticos definidos;
- trazabilidad de conversión por campaña y drop;
- modelo de integración ecommerce documentado.

### Decisión crítica

Antes de activar `Shopify`, validar:

- si aporta velocidad real al lanzamiento;
- si no obliga a duplicar catálogo/stock;
- y si AIRLINE 33 está preparada para gobernarlo.

### KPIs de salida

- pedidos web entran sin intervención manual;
- stock sincronizado;
- funnel medible end-to-end.

## Fase 4 - CRM / Comunidad

### Objetivo

Operar comunidad y retención como activo central.

### Alcance

- segmentación de clientes;
- drops exclusivos;
- waitlists;
- historial de interacción;
- posible adopción de `Klaviyo` o `Brevo`;
- evaluar `HubSpot` solo si la complejidad comercial lo exige.

### Entregables

- segmentos operativos;
- reglas de acceso a drops exclusivos;
- tracking de engagement;
- flujos de lifecycle básicos.

### KPIs de salida

- base identificada de comunidad activa;
- segmentación usable en campañas;
- incremento de repetición y conversión por cohortes.

## Fase 5 - Agentes IA con MCP

### Objetivo

Dar a Codex y futuros agentes acceso seguro y útil al sistema.

### Alcance

- conectar `Supabase`, `Notion`, `Figma` y otras herramientas priorizadas;
- definir políticas de permisos;
- exponer workflows de `n8n` seleccionados;
- introducir herramientas amplias como `Pipedream`, `Zapier MCP` o `Composio` solo si justifican su coste;
- crear playbooks de uso por agente.

### Entregables

- mapa de conectores MCP;
- reglas de acceso por entorno;
- catálogo de acciones permitidas;
- auditoría básica de uso de agentes.

### KPIs de salida

- agentes resuelven tareas reales sin tocar sistemas críticos de forma insegura;
- reducción del tiempo técnico y operativo en tareas repetitivas;
- cero incidentes por permisos excesivos.

## Dependencias por fase

| Fase | Depende de | No debería bloquearse por |
| --- | --- | --- |
| 1 | decisión de modelo operativo | ecommerce |
| 2 | Fase 1 estable | CRM avanzado |
| 3 | Fase 2 estable | MCP amplio |
| 4 | ventas y datos suficientes | HubSpot |
| 5 | permisos y procesos maduros | tener todas las apps conectadas |

## Priorización de herramientas

### Ahora

- `Supabase`
- `n8n`
- `Stripe`
- `Holded`
- `Notion`
- `GitHub`
- `Google Sheets`

### Siguiente capa

- `PostHog`
- web propia

### Según necesidad

- `Shopify`
- `Klaviyo` o `Brevo`
- `HubSpot`

### Más adelante

- `Figma MCP`
- `Supabase MCP`
- `n8n MCP`
- `Pipedream`
- `Zapier MCP`
- `Composio`

## Checklist operativo inicial

1. Crear carpeta de trabajo y documentación base.
2. Definir esquema `Supabase`.
3. Diseñar imports desde Excel actual.
4. Levantar workflows mínimos en `n8n`.
5. Conectar `Stripe` en test.
6. Diseñar dashboards de operación.
7. Cerrar SOPs de venta, stock, coste y devolución.

## Recomendación de secuencia real

Semana 1-2:

- aterrizar modelo de datos;
- mapear Excel actual;
- cerrar arquitectura y roles.

Semana 3-4:

- montar `Supabase`;
- crear vistas base;
- prototipar workflows `n8n`.

Semana 5-6:

- integrar `Stripe`;
- automatizar venta manual;
- generar reporting.

Semana 7+:

- preparar web/ecommerce;
- añadir analítica;
- preparar CRM/comunidad.
