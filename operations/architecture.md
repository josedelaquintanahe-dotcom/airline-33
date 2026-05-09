# AIRLINE 33 - Arquitectura Recomendada

Fecha de referencia: 2026-05-08

## Objetivo

Diseñar un sistema operativo para AIRLINE 33 que:

- sirva para relanzar la marca en septiembre de 2026;
- centralice productos, SKUs, stock, pedidos, costes, clientes, comunidad y caja;
- automatice procesos sin depender de Excel como base principal;
- permita trabajar con Codex y con servidores MCP de forma segura;
- y pueda crecer hacia ecommerce, CRM y agentes IA sin rehacer la base.

## Principios

### 1. Una única fuente de verdad operativa

`Supabase` será el sistema maestro de:

- catálogo,
- inventario,
- pedidos,
- costes,
- clientes,
- drops,
- devoluciones,
- comunidad,
- y caja.

### 2. Las automatizaciones no son el sistema de verdad

`n8n` orquesta procesos y sincronías, pero no gobierna el dato maestro.

### 3. Las herramientas externas reciben o enriquecen datos

- `Stripe`: pagos y refunds
- `Holded`: facturación y contabilidad
- `PostHog`: analítica
- `Notion`: documentación
- `Google Sheets`: reporting/exportación
- `Figma`: diseño

### 4. Preparación para agentes, no dependencia temprana de agentes

La arquitectura debe ser usable por personas sin IA y mejorable con IA. MCP es una capa de acceso, no la lógica central del negocio.

### 5. Seguridad por defecto

- Principio de mínimo privilegio.
- Separar entornos `dev`, `staging`, `prod`.
- Nunca dar a un MCP acceso amplio a producción si puede evitarse.

## Arquitectura objetivo

```text
Canales / Operación
├─ Venta manual
├─ Web propia
├─ Futuro ecommerce Shopify
├─ Comunidad / CRM
└─ Operación interna

Servicios especializados
├─ Stripe
├─ Holded
├─ PostHog
├─ Notion
├─ Figma
└─ Google Sheets

Capa de orquestación
└─ n8n
   ├─ workflows operativos
   ├─ sincronizaciones
   ├─ alertas
   └─ reporting

Capa central
└─ Supabase
   ├─ PostgreSQL
   ├─ Auth (si aplica)
   ├─ Storage
   ├─ Edge Functions
   └─ RLS / políticas

Capa de agentes
└─ Codex + MCP
   ├─ acceso técnico controlado
   ├─ lectura de docs / diseño / CRM
   └─ ejecución supervisada
```

## Componentes

### `Supabase`

Responsabilidades:

- almacenar datos operativos;
- garantizar integridad referencial;
- soportar consultas analíticas;
- alojar vistas materializadas o vistas de reporting;
- y exponer APIs/funciones para casos que deban ser consumidos por otros sistemas.

Uso recomendado:

- esquema SQL limpio;
- claves estables;
- tablas de auditoría para cambios críticos;
- y movimientos de stock/caja como ledger, no solo estado final.

### `n8n`

Responsabilidades:

- disparar workflows por eventos o cron;
- traducir datos entre sistemas;
- generar alertas y reportes;
- gestionar procesos semiautomáticos con aprobación humana;
- y actuar como puente con herramientas que no conviene exponer directamente a Codex.

Uso recomendado:

- nombrado consistente de workflows;
- versionado exportando JSON al repo si se decide más adelante;
- manejo explícito de errores y reintentos;
- idempotencia en operaciones sensibles.

### `Stripe`

Responsabilidades:

- cobro de ventas manuales o web;
- tracking de pagos, intentos y refunds;
- fuente de eventos financieros en tiempo real.

Regla:

- `Stripe` no debe ser la única fuente del pedido. Cada transacción relevante debe aterrizar en `Supabase`.

### `Holded`

Responsabilidades:

- emisión de factura;
- contacto contable;
- salida financiera/fiscal.

Regla:

- sincronización unidireccional preferente desde `Supabase` hacia `Holded`, con controles de conciliación.

### `PostHog`

Responsabilidades:

- eventos de navegación y conversión;
- análisis por campaña, drop y cohorte;
- revenue attribution básico;
- soporte a decisiones de producto y marketing.

### `Notion`

Responsabilidades:

- SOPs operativas;
- mapa de procesos;
- decisiones de arquitectura;
- guías de uso del sistema.

### `Google Sheets`

Responsabilidades:

- dashboards ligeros;
- exportes operativos;
- vistas compartibles.

Regla:

- nunca editar a mano en Sheets un dato que ya tenga dueño en `Supabase`.

## Dominios de datos

### Catálogo

- `products`
- `skus`
- `suppliers`
- `costs`
- `drops`

### Operación comercial

- `orders`
- `order_items`
- `customers`
- `returns`

### Inventario y caja

- `stock_movements`
- `cash_movements`

### Comunidad y marketing

- `community_members`
- `marketing_events`

## Flujos de datos recomendados

### Venta manual

1. Se crea pedido borrador en `Supabase`.
2. `n8n` genera link o cobro en `Stripe`.
3. Al confirmar pago, `n8n` actualiza pedido.
4. Se registra salida de stock.
5. Se envía evento a `PostHog`.
6. Si aplica, se genera documento en `Holded`.

### Venta web

1. La web captura el checkout.
2. `Stripe` confirma el pago.
3. `n8n` o backend crea pedido en `Supabase`.
4. Se descuenta stock por SKU.
5. Se alimenta `PostHog`.
6. Se sincroniza con `Holded`.

### Reposición o entrada de stock

1. Operación registra recepción.
2. `Supabase` crea movimientos de entrada.
3. `n8n` actualiza dashboards y alerta si cambia disponibilidad de un drop.

## Estrategia MCP

### Qué sí conectar pronto

- `Supabase` en entorno no productivo o con modo muy restringido
- `Notion`
- `Figma`
- `Linear` si se adopta

### Qué conectar con más cautela

- `Stripe`
- `n8n`
- `PostHog`

### Qué dejar para más adelante

- `HubSpot`
- `Klaviyo`
- `Brevo`
- `Pipedream`
- `Zapier MCP`
- `Composio`
- `Shopify`

## Modelo de permisos recomendado

### Codex

- acceso al repo;
- lectura a documentación;
- acceso técnico a entorno `dev` y `staging`;
- ejecución supervisada sobre herramientas con efectos reales.

### Operación humana

- formularios y vistas sobre datos operativos;
- aprobaciones de devoluciones, costes y conciliaciones;
- permisos separados por función.

### MCP

- conectores read-only por defecto;
- write solo para herramientas donde el valor operativo lo justifique;
- credenciales separadas por entorno;
- revocación sencilla.

## Decisiones de arquitectura

1. `Supabase` será el `system of record`.
2. `n8n` será el `automation backbone`.
3. `Holded` será downstream contable, no núcleo operativo.
4. `Google Sheets` y Excel quedarán como reporting/histórico.
5. `Shopify` se reserva para la fase ecommerce.
6. Los agentes IA operarán sobre permisos mínimos y preferentemente en entornos no productivos.

## Riesgos principales

- Duplicar la verdad entre `Supabase`, `Sheets`, `Holded` y futuros canales.
- Exponer MCP con permisos excesivos.
- Meter Shopify demasiado pronto y deformar el modelo.
- Llevar lógica de negocio crítica a `n8n` sin trazabilidad ni tests.

## Arquitectura recomendada para empezar

### Fase 1 operativa

- `Supabase`
- `n8n`
- `Stripe`
- `Holded`
- `Notion`
- `GitHub`
- `Google Sheets`

### Fase 2-3

- `PostHog`
- web propia
- `Shopify` si se confirma como canal ecommerce

### Fase 4-5

- `Klaviyo` o `Brevo`
- `HubSpot` si el CRM lo exige
- capa MCP más amplia y agentes IA operativos
