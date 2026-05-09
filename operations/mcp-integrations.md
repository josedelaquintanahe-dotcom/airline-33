# AIRLINE 33 - Integraciones MCP

Fecha de referencia: 2026-05-08

## Objetivo

Definir qué herramientas conviene conectar vía MCP, qué puede hacer Codex con cada una, qué permisos hacen falta y qué riesgos existen antes de abrir accesos reales.

## Criterio operativo

- MCP no sustituye APIs ni workflows.
- MCP se usa para acelerar consulta, soporte técnico, configuración y operaciones supervisadas.
- Las integraciones con impacto financiero, contable o de cliente deben entrar con permiso mínimo y aprobación humana.

## Resumen

### Prioridad alta

- `Supabase`
- `Notion`
- `Figma`

### Prioridad media

- `n8n`
- `Stripe`
- `PostHog`
- `Linear`

### Prioridad posterior

- `Shopify`
- `Klaviyo`
- `Brevo`
- `HubSpot`
- `Pipedream`
- `Zapier MCP`
- `Composio`
- `Airtable`

## Matriz de integraciones

| Herramienta | MCP oficial o conocido | Qué puede hacer Codex | Permisos necesarios | Riesgos de seguridad | Fase recomendada |
| --- | --- | --- | --- | --- | --- |
| `Supabase` | Oficial | inspeccionar esquema, consultar tablas, generar migraciones, revisar logs, types y funciones | proyecto acotado, idealmente `dev` o `staging`; read-only por defecto | prompt injection desde datos, SQL destructivo, exposición de datos sensibles | 1 |
| `Airtable` | Oficial | leer bases, analizar registros, crear/actualizar filas | acceso a base concreta | fuga de datos y edición no controlada | 4-5 |
| `n8n` | Oficial como servidor MCP y cliente MCP | descubrir workflows, ejecutarlos, editar workflows según configuración | acceso a instancia o workflows expuestos | automatizaciones con efectos reales, visibilidad cruzada entre clientes MCP | 2 |
| `Pipedream` | Oficial | usar miles de herramientas vía MCP, especialmente donde n8n no cubra bien | OAuth por app o servidor Pipedream | superficie enorme, control difuso de herramientas, costes ocultos | 5 |
| `Zapier MCP` | Oficial | lanzar acciones simples sobre muchas apps | cuenta Zapier y apps conectadas | baja granularidad, coste por tareas, errores silenciosos en cadenas largas | 5 |
| `Composio` | Conectores/servidores MCP conocidos | enrutar herramientas, auth gestionada, permisos por toolkit | acceso a Composio y apps delegadas | capa adicional de credenciales y gobierno | 5 |
| `Shopify` | Oficial para storefront y catálogo; ecosistema creciente | consultar catálogo, políticas, carrito y más adelante operaciones de tienda | según endpoint; storefront MCP puede ser público; otras áreas requieren OAuth | exposición de catálogo, acciones sobre clientes/pedidos si se amplía demasiado | 3-5 |
| `Stripe` | Oficial | consultar pagos/clientes/productos, generar links, reembolsos, soporte operativo | OAuth o keys restringidas; sandbox preferido | impacto financiero directo, refunds o cobros incorrectos | 2 |
| `PostHog` | Oficial | consultar métricas, crear insights, revisar eventos y funnels | proyecto PostHog y permisos analíticos | lectura de datos sensibles de comportamiento; cambios analíticos no deseados | 2-3 |
| `HubSpot` | Oficial remoto y developer MCP | consultar y actualizar CRM, deals, tickets, marketing objects | OAuth con scopes concretos | exposición de CRM completo y escrituras erróneas | 4-5 |
| `Klaviyo` | Oficial | consultar campañas, segmentos, perfiles y performance; algunas escrituras | OAuth o API key privada según cliente | riesgo sobre marketing, listas y mensajes | 4 |
| `Brevo` | Oficial | gestionar contactos, listas, campañas, deals y templates | token MCP específico | riesgo sobre campañas y CRM | 4 |
| `Holded` | No he encontrado MCP oficial; sí API oficial | vía API indirecta o workflows: crear contactos, facturas y sincronías | API key de Holded muy restringida | impacto fiscal/contable | 2-3 por API, no por MCP |
| `Notion` | Oficial | crear docs, actualizar SOPs, consultar bases de conocimiento | OAuth al workspace o espacio concreto | fuga de documentación interna, edición accidental | 1 |
| `Linear` | Oficial | crear issues, actualizar estado, consultar roadmap técnico | OAuth o token con workspace acotado | cambios de planificación no aprobados | 2-3 |
| `Figma` | Oficial | leer diseños, variables y componentes; escribir en canvas si el plan lo permite | acceso al archivo/proyecto; write solo si compensa | modificación de diseños fuente | 1-2 |

## Qué puede hacer Codex con cada una

### `Supabase`

- inspeccionar el modelo de datos;
- generar SQL de migración;
- revisar logs y advisors;
- crear tipos TypeScript;
- ayudar a depurar incidencias de inventario o pedidos.

### `n8n`

- consultar workflows expuestos;
- proponer o editar automatizaciones;
- ejecutar pruebas controladas;
- usar MCP externos desde n8n si conviene encapsular acciones.

### `Stripe`

- revisar pagos fallidos;
- listar clientes, productos y precios;
- crear links de pago o refunds solo con aprobación;
- apoyar conciliación con pedidos internos.

### `PostHog`

- responder preguntas de negocio sobre funnels, eventos, cohorts y revenue;
- ayudar a definir instrumentación y taxonomía de eventos;
- construir insights repetibles.

### `Notion`

- escribir documentación técnica;
- actualizar SOPs;
- volcar decisiones de arquitectura o playbooks.

### `Figma`

- leer componentes, variables y layouts;
- traducir diseño a código;
- comparar implementación con diseño;
- generar documentación de handoff.

### `Linear`

- registrar trabajo técnico;
- enlazar bugs y tareas de automatización;
- reflejar progreso por fase.

### `Shopify`

- consultar catálogo y políticas;
- más adelante, si se habilita, ayudar a operar búsqueda, carrito o customer flows;
- servir como contexto para agentes de compra o soporte.

### `HubSpot`, `Klaviyo`, `Brevo`

- consultar CRM y segmentos;
- analizar campañas;
- automatizar tareas repetitivas de marketing y comunidad;
- siempre con control de permisos y trazabilidad.

## Permisos recomendados

### Regla general

- `read-only` por defecto.
- `write` solo en herramientas donde el valor supere claramente el riesgo.
- credenciales separadas por entorno y por rol.

### Recomendación por herramienta

- `Supabase`: proyecto acotado, read-only o `dev`; nunca acceso amplio a prod al principio.
- `Stripe`: cuenta test o restricted keys; evitar permisos de refund sin aprobación humana.
- `n8n`: exponer solo workflows seleccionados para MCP.
- `Notion`: espacio de arquitectura y operaciones, no todo el workspace si no hace falta.
- `Figma`: read al inicio; write solo en archivos concretos.
- `PostHog`: proyecto con permisos analíticos, sin administración global si puede evitarse.

## Riesgos de seguridad

### Riesgo 1: Prompt injection desde datos

Un registro de cliente, pedido o nota interna puede contener texto malicioso que intente inducir acciones no deseadas del agente.

Mitigación:

- aprobación manual de tool calls;
- herramientas sensibles en read-only;
- separar lectura de datos y escritura en sistemas críticos.

### Riesgo 2: Credenciales demasiado amplias

Una sola conexión MCP con permisos globales puede exponer demasiado.

Mitigación:

- cuentas técnicas dedicadas;
- scopes mínimos;
- separar `dev`, `staging`, `prod`;
- rotación de tokens.

### Riesgo 3: Sistemas con efecto financiero o fiscal

`Stripe` y `Holded` son especialmente sensibles.

Mitigación:

- no permitir escrituras sin supervisión;
- usar sandbox/test siempre que se pueda;
- logs y conciliación.

### Riesgo 4: Dispersión operativa

Cuantos más brokers MCP y herramientas puente existan, más difícil es entender dónde pasó algo.

Mitigación:

- priorizar `Supabase + n8n`;
- añadir `Pipedream`, `Zapier MCP` o `Composio` solo si resuelven una carencia real.

## Integraciones a dejar para fases posteriores

### Posterior por complejidad

- `HubSpot`
- `Pipedream`
- `Zapier MCP`
- `Composio`

### Posterior por dependencia de ecommerce/marketing maduro

- `Shopify`
- `Klaviyo`
- `Brevo`

### Posterior por necesidad operativa no crítica al arranque

- `Airtable`
- `Linear` si GitHub Projects basta al principio

## Recomendación final

Conectar primero por MCP:

1. `Notion`
2. `Figma`
3. `Supabase` en entorno seguro

Conectar después y con control fuerte:

4. `n8n`
5. `PostHog`
6. `Stripe`

Dejar para fases posteriores:

7. `Shopify`
8. `Klaviyo` o `Brevo`
9. `HubSpot`
10. `Pipedream` / `Zapier MCP` / `Composio`

## Notas de investigación

Estado revisado con documentación oficial pública a fecha 2026-05-08:

- Supabase MCP
- Airtable MCP
- n8n instance-level MCP y MCP Trigger/Client
- Stripe MCP
- Pipedream MCP
- Zapier MCP
- HubSpot MCP
- Klaviyo MCP
- Brevo MCP
- Linear MCP
- Figma MCP
- Shopify Storefront/Catalog MCP
- Notion MCP
- PostHog MCP
- Holded API
