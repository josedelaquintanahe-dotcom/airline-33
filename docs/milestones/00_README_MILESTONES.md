# AIRLINE 33 — Índice de milestones operativos

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Uso

Copia esta carpeta dentro de:

```powershell
C:\Users\Manuel\PROJECTS\airline-33\docs\milestones
```

Cada archivo `.md` es un bloque de ejecución. Codex debe leer el archivo, invocar los agentes indicados, ejecutar los prompts por fases y cerrar el milestone solo cuando cumpla los criterios.

## Orden recomendado

1. `01_PROJECT_STRUCTURE_AND_RULES.md`
2. `02_RUFLO_AGENT_ORCHESTRATION.md`
3. `03_SUPABASE_BACKEND.md`
4. `04_OPERATIONS_DATA_MODEL.md`
5. `05_N8N_AUTOMATIONS.md`
6. `06_INTERNAL_PANEL_FRONTEND.md`
7. `07_WEB_ECOMMERCE.md`
8. `08_PAYMENTS_STRIPE.md`
9. `09_DASHBOARDS_ANALYTICS.md`
10. `10_HOLDED_FINANCE.md`
11. `11_TESTING_SECURITY_QA.md`
12. `12_LAUNCH_READINESS.md`

## Agentes especializados

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

## Regla de cierre de bloque

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "<mensaje del bloque>"
git push
```
