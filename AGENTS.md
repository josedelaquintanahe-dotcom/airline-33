# AGENTS.md

## Lectura obligatoria

Antes de cualquier tarea relevante en AIRLINE 33, leer:

- `./context.md`
- `./CODEX.md`
- `./CLAUDE.md` si la tarea afecta compatibilidad con legado `.claude`
- `./docs/ruflo/` y `./ruflo/` si la tarea afecta agentes, workflows u orquestacion
- `./agents/` y `./.ai/agents/` si la tarea afecta coordinacion o roles

## Rol de Codex

Codex actua como ejecutor tecnico del proyecto y debe:

- usar `context.md` como contexto de negocio y marca;
- usar `CODEX.md` como manual operativo principal;
- respetar que `Shopify` es el ecommerce inicial;
- respetar que `Supabase` es la fuente de verdad operativa complementaria;
- respetar que `n8n` es la capa principal de automatizacion;
- tratar `Ruflo` como capa externa de orquestacion y compatibilidad;
- mantener cambios trazables, seguros y revisables.

## Sistema de agentes

La capa documental del proyecto vive en:

- `agents/`
- `prompts/`
- `docs/agent-workflows.md`

La capa activa heredada o compatible vive en:

- `.ai/agents/`
- `.claude/agents/custom/airline-33/`

Reglas:

- no duplicar agentes sin necesidad;
- documentar siempre la relacion entre capa activa, capa heredada y capa documental;
- toda tarea multi-dominio debe pasar por el orquestador.

## Agentes principales

| Agente | Funcion |
|---|---|
| `orchestrator` | Coordina trabajo, prioridades, handoffs y cierre |
| `brand` | Marca, tono, posicionamiento y coherencia narrativa |
| `frontend` | Experiencia visual, ecommerce y conversion |
| `backend` | API, webhooks, servicios y contratos |
| `database` | Modelo de datos, migraciones, integridad y RLS |
| `automation` | Workflows `n8n`, webhooks y sincronizaciones |
| `crm-inventory` | Clientes, comunidad, stock, pedidos y drops |
| `integrations` | Shopify, GitHub, MCP y herramientas externas |
| `security` | Secretos, permisos, PII, pagos y revisiones de riesgo |
| `qa` | Validacion funcional, operativa y de lanzamiento |
| `devops` | Entornos, scripts, despliegues y continuidad operativa |

## Seguridad y limites

- no tocar credenciales ni `.env`;
- no crear claves reales;
- no modificar `.mcp.json` sin verificacion de funcionamiento;
- no borrar elementos heredados de `.claude`, `.claude-flow` o `.swarm` salvo justificacion clara;
- no convertir runtime heredado en dependencia de producto;
- no exponer PII real en docs, seeds, plantillas o ejemplos.

## Reglas de implementacion

- `Shopify` es el ecommerce inicial;
- `Supabase` es la fuente de verdad operativa complementaria;
- `n8n` automatiza, no gobierna la logica critica;
- `Excel` y `Google Sheets` se usan para historico, importacion controlada y reporting;
- el backend y las APIs deben quedar preparados para integraciones futuras;
- toda decision de arquitectura o seguridad debe quedar documentada.

## Git y cierre de bloques

Al cerrar un bloque importante, Codex debe:

- resumir cambios;
- listar archivos creados, modificados o eliminados;
- indicar riesgos abiertos;
- proponer mensaje de commit;
- proponer comando de push;
- no hacer commit automatico salvo peticion explicita.
