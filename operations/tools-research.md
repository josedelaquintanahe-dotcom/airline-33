# AIRLINE 33 - Research de Herramientas

Fecha de referencia: 2026-05-08

## Criterios de evaluación

- Sistema de registro: si debe ser fuente principal de verdad operativa.
- Encaje operativo: inventario, pedidos, costes, clientes, comunidad y reporting.
- Automatización: facilidad para orquestar eventos, reglas y sincronizaciones.
- MCP/IA: madurez para uso con Codex y otros agentes.
- Riesgo: complejidad, lock-in, coste operativo y exposición de datos.

## Resumen ejecutivo

La combinación con mejor encaje para AIRLINE 33 es:

- `Supabase` como sistema central de datos y lógica.
- `n8n` como motor principal de automatizaciones internas.
- `Stripe` para cobro y eventos de pago.
- `PostHog` para analítica de producto, comportamiento y revenue journeys.
- `Holded` para facturación/contabilidad, alimentado desde el sistema central.
- `Notion` para documentación operativa.
- `Figma` para diseño.
- `Google Sheets` solo como capa de exportación, reporting y trabajo puntual.

Herramientas a mantener como opcionales o de fase posterior:

- `Shopify` para ecommerce cuando el catálogo, stock y fulfillment ya estén estabilizados.
- `HubSpot` si la comunidad y CRM superan la complejidad asumible en Supabase + Klaviyo/Brevo.
- `Klaviyo` cuando el canal email/SMS y segmentación avanzada ya justifiquen el coste.
- `Airtable`, `Pipedream`, `Zapier MCP`, `Composio`, `Linear` solo para casos concretos, no como columna vertebral inicial.

## Comparativa

| Herramienta | Rol recomendado | Encaje AIRLINE 33 | MCP / IA | Riesgos / límites | Recomendación |
| --- | --- | --- | --- | --- | --- |
| `Supabase` | Base de datos principal, auth, storage, edge functions | Muy alto. Permite modelar SKUs, stock, pedidos, costes y comunidad sin depender de hojas | Alto. MCP oficial y buen encaje con agentes técnicos | Riesgo si se conecta MCP a producción con permisos amplios | Base central desde Fase 1 |
| `Airtable` | Capa ligera de operación o prototipado | Medio. Rápido para montar vistas, pero peor como sistema transaccional | Alto. MCP oficial | Escala peor para inventario y consistencia; más lock-in en UI | No usar como sistema principal |
| `n8n` | Automatizaciones internas y orquestación | Muy alto. Excelente para ventas, stock, reportes, sincronías y agentes | Alto. Puede actuar como cliente MCP y también como servidor MCP | Requiere disciplina operativa y observabilidad | Motor de automatización principal |
| `Pipedream` | Integraciones amplias y conectores externos | Medio-alto. Muy útil si faltan conectores o hace falta auth delegada | Alto. MCP gestionado para miles de apps | Puede duplicar rol de n8n y fragmentar la operación | Usar solo como capa complementaria |
| `Zapier MCP` | Acceso rápido a muchas apps desde agentes | Medio. Bueno para acciones simples desde IA | Alto. Da acceso a miles de apps vía MCP | Menos control fino; coste por tareas; peor trazabilidad técnica | Fase posterior o casos concretos |
| `Composio` | Broker de herramientas para agentes | Medio. Útil si AIRLINE 33 quiere producto agent-first con permisos por usuario | Alto. Catálogo amplio orientado a agentes | Añade otra capa de control y coste; hoy no es necesaria para una operación pequeña | Evaluar en Fase 5 |
| `Shopify` | Ecommerce y catálogo web | Alto para Fase 3, bajo para Fase 1 | Medio-alto. Shopify ya ofrece MCP para storefront/agentes | Si entra demasiado pronto, condiciona catálogo y procesos | Preparar integración futura; no hacerlo sistema maestro |
| `Stripe` | Pagos, links de pago, refunds | Muy alto | Alto. MCP oficial | Riesgo alto por operaciones financieras; requiere permisos restringidos | Adoptar desde el inicio |
| `PostHog` | Analítica de producto, campañas y revenue journeys | Alto | Medio-alto. MCP oficial disponible | Si se modelan mal eventos, el análisis pierde valor | Adoptar desde Fase 1-2 |
| `HubSpot` | CRM comercial y soporte | Medio para el arranque | Alto. MCP remoto oficial | Overkill para la fase inicial; coste y complejidad | Dejar para cuando el CRM lo pida |
| `Klaviyo` | Email/SMS para ecommerce y retención | Alto desde que exista ecommerce | Alto. MCP oficial | Coste y complejidad tempranos si aún no hay volumen | Fase 3-4 |
| `Brevo` | Email, SMS y CRM ligero | Medio-alto como alternativa económica a Klaviyo | Alto. MCP oficial | Menor especialización ecommerce que Klaviyo | Buena alternativa si el presupuesto manda |
| `Holded` | Facturación y contabilidad | Alto para España | Bajo en MCP; alto por API tradicional | No debe gobernar inventario ni pedidos internos | Integrarlo como sistema downstream |
| `Notion` | Documentación, SOPs, arquitectura, decisiones | Alto | Alto. MCP oficial | Riesgo de mezclar documentación con dato operativo | Usarlo solo para docs y coordinación |
| `Linear` | Gestión técnica de trabajo | Medio | Alto. MCP oficial | Añade otra herramienta si GitHub Projects ya basta | Opcional para equipo técnico |
| `Figma` | Diseño, sistema visual, handoff | Alto | Alto. MCP oficial | Riesgo bajo; no es sistema operativo | Adoptar para diseño y handoff |

## Decisiones por herramienta

### `Supabase`

Por qué sí:

- Modelo relacional claro para productos, SKUs, inventario, pedidos, devoluciones y caja.
- SQL nativo para reporting fiable.
- Edge Functions y cron jobs si alguna automatización debe vivir cerca del dato.
- Buen encaje para separar `source of truth` operativo de vistas exportadas.

Por qué no usar otra cosa como núcleo:

- `Airtable` y `Sheets` son más cómodos al principio, pero peores para integridad transaccional.
- `Shopify` está optimizado para ecommerce, no para ser el sistema central de operaciones de relanzamiento.

### `n8n`

Por qué sí:

- Permite orquestar eventos entre `Stripe`, `Supabase`, `Holded`, `Sheets`, `Notion`, `PostHog` y futuros conectores.
- Tiene buen encaje con flujos humanos + automáticos.
- Puede consumir MCP externos o exponer flujos propios a clientes MCP.

Riesgo a controlar:

- No convertir n8n en lógica de negocio opaca. La lógica crítica debe quedar documentada y, cuando sea posible, anclada en Supabase.

### `Airtable`

Tiene valor si queréis:

- construir una interfaz temporal para operaciones no críticas,
- compartir vistas muy rápidas con personal no técnico,
- o prototipar tablas antes del modelo final.

No es buena elección como fuente maestra de inventario, caja o pedidos.

### `Pipedream`, `Zapier MCP`, `Composio`

Las tres son útiles, pero resuelven una necesidad distinta:

- `Pipedream`: amplitud de conectores y auth gestionada.
- `Zapier MCP`: acceso simple desde agentes a muchas apps.
- `Composio`: capa más agent-first con control de herramientas y credenciales.

Para AIRLINE 33, meter cualquiera de las tres en Fase 1 generaría dispersión. Solo tiene sentido cuando aparezca una integración que `n8n` no cubra bien o cuando queráis exponer capacidades a agentes externos con permisos más finos.

### `Stripe`

Debe entrar pronto porque:

- permite venta manual con payment links,
- centraliza cobros y refunds,
- y emite eventos fiables para activar automatizaciones.

### `Shopify`

Debe entrar después de estabilizar:

- catálogo,
- variantes/SKUs,
- reglas de stock,
- devoluciones,
- y sincronía contable.

Si entra antes, AIRLINE 33 corre el riesgo de modelar la operación alrededor del ecommerce en vez de alrededor del negocio.

### `PostHog`

Es recomendable incluso antes del ecommerce completo si vais a construir web propia:

- trazabilidad de páginas, campañas, eventos y conversiones;
- análisis por drop, cohorte y comportamiento;
- posibilidad de unir eventos de marketing con pedidos y revenue.

### `HubSpot`

No lo pondría al inicio salvo que:

- vaya a haber B2B/wholesale pronto,
- se necesite pipeline comercial serio,
- o la comunidad pase a una operación multicanal grande.

### `Klaviyo` vs `Brevo`

`Klaviyo` gana si el foco es ecommerce y lifecycle marketing sofisticado.

`Brevo` gana si:

- el presupuesto es más ajustado,
- se valora tener email/SMS/CRM simple en una sola herramienta,
- y la automatización avanzada de ecommerce todavía no es prioritaria.

Recomendación:

- `Brevo` si queréis lanzar rápido y barato.
- `Klaviyo` si prevéis que el email y la comunidad serán un motor principal de revenue en 2026.

### `Holded`

Encaja muy bien por contexto España, pero con una regla:

- `Holded` recibe facturas, contactos y asientos derivados.
- `Supabase` conserva el control del dato operativo granular.

### `Notion`, `Linear`, `Figma`

- `Notion`: documentación, SOPs, decisiones y playbooks.
- `Linear`: opcional para gestión técnica si GitHub Projects se queda corto.
- `Figma`: necesario para sistema visual, diseño de web y handoff a desarrollo.

## Stack recomendado

### Núcleo inicial

- `Supabase`
- `n8n`
- `Stripe`
- `PostHog`
- `Holded`
- `Notion`
- `Figma`
- `GitHub`
- `Google Sheets` como salida de reporting, no como origen

### Alternativas o fase posterior

- `Shopify`
- `Klaviyo`
- `Brevo`
- `HubSpot`
- `Pipedream`
- `Zapier MCP`
- `Composio`
- `Linear`
- `Airtable`

## Regla operativa clave

AIRLINE 33 debe operar con esta jerarquía:

1. `Supabase` como verdad operativa.
2. `n8n` como capa de orquestación.
3. Herramientas externas como sistemas especializados.
4. `Google Sheets` y Excel como salida de análisis e histórico.

## Notas de investigación

El estado MCP usado para esta propuesta se apoya en documentación oficial pública revisada el 2026-05-08, incluyendo:

- Supabase MCP
- Airtable MCP
- n8n MCP server y MCP client
- Stripe MCP
- Pipedream MCP
- Zapier MCP
- HubSpot MCP
- Klaviyo MCP
- Brevo MCP
- Linear MCP
- Figma MCP
- Shopify Storefront/Catalog MCP
- Holded API
- Notion MCP
- PostHog MCP
