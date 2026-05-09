# Milestone 01 — Estructura base del proyecto y reglas de trabajo

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Ordenar el repositorio antes de construir backend, Supabase, n8n, frontend, web y dashboards.

## Agentes Ruflo

- Principal: `airline-33-orchestrator`
- Apoyo: `security-agent`
- Apoyo: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en el proyecto AIRLINE 33.

Antes de modificar nada:
1. Lee `context.md`.
2. Lee `CODEX.md`.
3. Lee `AGENTS.md` si existe.
4. Revisa `.ai/agents/` y `.claude/agents/custom/airline-33/`.
5. Usa como agente principal a `airline-33-orchestrator`.
6. Usa `security-agent` para revisar riesgos.
7. Usa `git-agent` para preparar el cierre del bloque.

Objetivo:
Organizar la estructura base del proyecto para construir:
- Supabase
- backend
- n8n
- panel interno
- web/ecommerce
- dashboards
- documentación operativa
- testing y seguridad

Tareas:
1. Revisa la estructura actual.
2. No borres nada.
3. No modifiques `.env` ni credenciales.
4. Crea si faltan estas carpetas:
   - docs/architecture/decisions
   - docs/brand
   - docs/operations
   - docs/ruflo
   - docs/milestones
   - operations/excel/templates
   - operations/excel/imports
   - operations/excel/mappings
   - operations/inventory
   - operations/orders
   - operations/customers
   - operations/costs
   - operations/dashboards
   - supabase/migrations
   - supabase/seed
   - supabase/policies
   - automations/n8n/workflows
   - automations/payloads
   - automations/webhooks
   - scripts/import-a33-excel
   - scripts/validate-data
   - tests/unit
   - tests/integration
   - tests/e2e
   - .ai/agents
   - .ai/prompts

5. Si existen agentes en `.claude/agents/custom/airline-33/`, cópialos a `.ai/agents/`, sin borrar originales.
6. Crea o actualiza `.gitignore` para ignorar:
   - .env
   - .env.*
   - node_modules
   - dist
   - build
   - .next
   - .vercel
   - logs
   - *.log
   - *.db
   - *.pid
   - .swarm/
   - .claude-flow/metrics/
   - .claude-flow/swarm/
   - .claude-flow/data/
   - .claude-flow/neural/
   - .claude-flow/daemon.pid
   - .claude/memory.db

7. Crea o actualiza `README.md`.
8. Crea o actualiza `AGENTS.md`.
9. No crees lógica de negocio todavía.
10. No ejecutes migraciones.

Entrega:
- estructura creada;
- archivos modificados;
- riesgos;
- próximos pasos;
- comando de commit.
```

## Criterios de cierre

- Estructura base creada.
- `.gitignore` limpio.
- `README.md` y `AGENTS.md` existen.
- No se han tocado credenciales.
- Agentes AIRLINE 33 accesibles desde `.ai/agents/`.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Organize AIRLINE 33 project structure and agent rules"
git push
```
