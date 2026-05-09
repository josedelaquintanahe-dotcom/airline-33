# Milestone 02 — Ruflo como capa externa de agentes y workflows

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Documentar cómo Codex debe trabajar usando agentes Ruflo/AIRLINE 33, sin mezclar Ruflo con la lógica del proyecto.

## Agentes Ruflo

- Principal: `airline-33-orchestrator`
- Apoyo: `security-agent`
- Apoyo: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Objetivo:
Crear la capa de orquestación para que Codex trabaje con agentes especializados inspirados en Ruflo.

Antes de modificar:
1. Lee `context.md`.
2. Lee `CODEX.md`.
3. Lee `AGENTS.md`.
4. Lee `.ai/agents/`.
5. Si existe ruta local de Ruflo externa, léela solo como referencia.
6. No modifiques Ruflo.
7. No copies Ruflo dentro del proyecto.
8. No modifiques `.env`.

Tareas:
1. Crear o actualizar:
   - docs/ruflo/ruflo-local-usage.md
   - docs/ruflo/airline33-agent-map.md
   - docs/ruflo/workflow-policy.md
   - docs/ruflo/safety-rules.md
   - docs/ruflo/codex-execution-policy.md
   - docs/architecture/decisions/ADR-003-use-ruflo-as-external-orchestration-layer.md

2. En `airline33-agent-map.md`, documenta responsabilidades:
   - `airline-33-orchestrator`
   - `backend-agent`
   - `supabase-agent`
   - `n8n-automation-agent`
   - `frontend-agent`
   - `crm-inventory-agent`
   - `security-agent`
   - `git-agent`
   - `brand-strategist`
   - `streetwear-copywriter`
   - `visual-identity-agent`
   - `content-calendar-agent`

3. En `workflow-policy.md`, define:
   - feature-planning
   - supabase-migration-review
   - n8n-workflow-review
   - manual-sale
   - stock-entry
   - cost-registration
   - returns
   - weekly-report
   - precommit-review
   - launch-readiness

4. En `safety-rules.md`, separa:
   - permitido sin confirmación;
   - requiere confirmación;
   - prohibido.

5. En `codex-execution-policy.md`, define formato obligatorio:
   - plan
   - agentes usados
   - archivos tocados
   - tests
   - riesgos
   - cierre de milestone
   - commit sugerido

Entrega:
- archivos creados/modificados;
- política de agentes;
- riesgos;
- próximos pasos;
- comando de commit.
```

## Criterios de cierre

- Documentación Ruflo creada.
- Mapa de agentes creado.
- Política de seguridad creada.
- Codex sabe qué agente usar en cada bloque.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Document Ruflo agent orchestration for AIRLINE 33"
git push
```
