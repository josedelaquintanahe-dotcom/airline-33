# AIRLINE 33 - CODEX OPERATING CONTEXT

## Contexto obligatorio

Antes de cualquier tarea relevante, leer:

- `./context.md`
- `./AGENTS.md`
- `./CLAUDE.md` si hay compatibilidad con runtime heredado
- `./.mcp.json` si la tarea afecta MCP o tooling externo
- `./docs/`
- `./agents/` y `./.ai/agents/` si la tarea afecta coordinacion de agentes

## Objetivo

Construir la infraestructura digital, operativa y tecnica de AIRLINE 33 para un relanzamiento profesional en septiembre de 2026.

La marca debe poder operar con:

- frontend y ecommerce;
- backend y API;
- `Supabase` como base de datos operativa;
- `n8n` como automatizacion principal;
- `Ruflo` como capa externa de orquestacion;
- MCP y agentes para acelerar trabajo tecnico sin acoplar el producto a tooling heredado.

## Stack

- frontend: `React` y futura capa ecommerce
- backend: API y servicios propios
- base de datos: `Supabase`
- automatizacion: `n8n`
- reporting e importacion: `Excel` y `Google Sheets`
- orquestacion externa: `Ruflo`
- control de versiones: `GitHub`

## Sistema de agentes

Agentes principales del proyecto:

- `airline-33-orchestrator`
- `brand-strategist`
- `streetwear-copywriter`
- `visual-identity-agent`
- `frontend-agent`
- `backend-agent`
- `supabase-agent`
- `n8n-automation-agent`
- `crm-inventory-agent`
- `content-calendar-agent`
- `security-agent`
- `git-agent`

Capas del sistema:

- activa interna: `.ai/agents/`
- heredada compatible: `.claude/agents/custom/airline-33/`
- documental: `agents/`
- prompts reutilizables: `prompts/`

Reglas:

- toda tarea multi-dominio debe pasar por `airline-33-orchestrator`;
- `security-agent` revisa auth, webhooks, pagos, PII, RLS y secretos;
- `git-agent` cierra bloques y revisa higiene de cambios;
- no duplicar un agente si basta con documentar la relacion con uno existente.

## Uso de Ruflo

`Ruflo` es una herramienta externa de orquestacion y referencia.

- puede usarse para patrones, roles, handoffs y workflows;
- no debe ser dependencia interna del producto;
- no se modifica codigo externo de Ruflo desde este repo;
- `.claude` y `.claude-flow` pueden seguir existiendo como compatibilidad operativa.

## Uso de MCP

- MCP se usa como capa de integracion con herramientas externas;
- `.mcp.json` no se modifica sin verificar que sigue funcionando;
- ninguna configuracion MCP debe introducir claves reales en repo;
- los servidores MCP deben documentarse en `mcp/` y `docs/mcp.md`.

## Reglas de seguridad

- nunca tocar `.env` ni credenciales reales;
- nunca crear claves reales en documentacion o ejemplos;
- no exponer PII en seeds, payloads, plantillas o docs;
- no ejecutar migraciones reales, pagos reales o workflows reales sin confirmacion;
- no tratar memoria, metrics o swarm state de tooling heredado como datos del negocio.

## Reglas de desarrollo

- `Supabase` es la fuente de verdad operativa;
- `n8n` automatiza procesos, pero no debe ocultar logica critica;
- el backend debe ser escalable y documentado;
- el frontend debe alinearse con la identidad de marca;
- toda integracion debe tener estado, agente responsable y prueba minima.

## Reglas de documentacion

- toda capa nueva debe quedar descrita en `docs/`;
- toda integracion debe documentarse en `integrations/`;
- toda relacion entre agentes activos y heredados debe explicarse en `agents/`;
- los prompts reutilizables deben vivir en `prompts/`;
- la documentacion debe priorizar claridad operativa sobre texto generico.

## Reglas de Git

- no hacer commit automatico salvo peticion explicita;
- no borrar archivos importantes sin justificarlo;
- si hay cambios previos en working tree, trabajar sin sobrescribirlos;
- al cerrar un bloque: resumir, listar riesgos y proponer commit y push.

## Como continuar una sesion nueva

1. leer `context.md`, `CODEX.md`, `AGENTS.md`, `CLAUDE.md` y `.mcp.json`;
2. revisar `project-status.md` y `roadmap.md`;
3. comprobar `git status`;
4. identificar el ultimo milestone real y el siguiente;
5. trabajar solo dentro del alcance confirmado;
6. cerrar con resumen, riesgos y comando Git recomendado.
