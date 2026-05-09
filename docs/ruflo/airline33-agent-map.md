# AIRLINE 33 Agent Map

## Objetivo

Este mapa documenta la capa propia de agentes de AIRLINE 33, separada del runtime interno de Ruflo.

## Agentes

### `airline-33-orchestrator`

Coordina tareas entre dominios, divide trabajo, resuelve dependencias y decide secuencias o paralelizacion. Debe leer `context.md` y `CODEX.md` antes de enrutar.

### `backend-agent`

Responsable de API, logica de negocio, contratos de integracion y arquitectura backend escalable para pedidos, clientes, stock y drops.

### `brand-strategist`

Define posicionamiento, tension de marca, direccion estrategica y narrativa de lanzamiento. Debe trabajar las dos rutas de identidad cuando siga abierta la decision House vs Dark techno.

### `content-calendar-agent`

Planifica cadencia de contenido, secuencia editorial, drops y tiempos de campana de forma realista para el equipo y presupuesto actual.

### `crm-inventory-agent`

Define reglas operativas de clientes, stock, reservas, exclusividad, estados y dashboards internos sin inflar el sistema.

### `frontend-agent`

Implementa la experiencia web en React y traduce visual + copy + contratos tecnicos a una UI consistente y util.

### `git-agent`

Prepara cierres de bloque, higiene de commits, recomendacion de push y agrupacion coherente de cambios sin reescribir historia ajena.

### `n8n-automation-agent`

Disena workflows, webhooks, reintentos, notificaciones y automatizaciones auditables para reducir trabajo manual.

### `security-agent`

Revisa auth, secretos, politicas, webhooks, RLS y tratamiento de datos sensibles. Debe intervenir en cambios con riesgo real.

### `streetwear-copywriter`

Escribe copy de web, producto, drops, email y CRM con tono selectivo, directo y no generico.

### `supabase-agent`

Disena esquema, migraciones, constraints, RLS, storage y patrones de acceso a datos alineados con backend y operaciones.

### `visual-identity-agent`

Define direccion visual, paletas, tipografia, tension estetica y guias listas para handoff a frontend.

## Relacion entre agentes

- El orquestador decide ruta y dependencias.
- `brand-strategist`, `streetwear-copywriter` y `visual-identity-agent` cubren la capa de marca.
- `backend-agent`, `supabase-agent`, `n8n-automation-agent` y `security-agent` cubren la capa tecnica.
- `crm-inventory-agent` conecta operacion con implementacion.
- `git-agent` cierra bloques y prepara hitos del repo.

## Ubicacion operativa

La copia activa y limpia para AIRLINE 33 queda en:

- `.ai/agents/`

La fuente heredada original sigue existiendo temporalmente en:

- `.claude/agents/custom/airline-33/`
