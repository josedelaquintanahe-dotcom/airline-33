# Milestone 11 — Testing, seguridad y QA

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Evitar fallos al empezar a vender: stock negativo, pagos mal marcados, pedidos sin líneas, secretos filtrados y workflows inseguros.

## Agentes Ruflo

- Principal: `security-agent`
- Apoyo: `backend-agent`
- Apoyo: `frontend-agent`
- Apoyo: `supabase-agent`
- Apoyo: `n8n-automation-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `security-agent`

Agentes de apoyo:
- `backend-agent`
- `frontend-agent`
- `supabase-agent`
- `n8n-automation-agent`
- `git-agent`

Objetivo:
Crear una capa mínima de testing, seguridad y QA.

Antes de modificar:
1. Revisa si existe package.json.
2. Revisa si hay stack frontend/backend.
3. No instales dependencias sin explicar.
4. No toques `.env`.
5. No borres nada.

Tareas:
1. Crear `docs/architecture/security-checklist.md`.
2. Crear `docs/architecture/testing-strategy.md`.
3. Crear `docs/ruflo/precommit-review.md`.
4. Crear o actualizar scripts en `package.json` si procede:
   - lint
   - format
   - test
   - test:e2e
   - check
   - audit:secrets
   - codex:precommit
5. Si faltan dependencias, proponer:
   - eslint
   - prettier
   - vitest
   - playwright
   - gitleaks
6. Crear tests mínimos o especificarlos:
   - no pedido sin líneas;
   - no venta de SKU inexistente;
   - no stock negativo sin override;
   - no pedido pagado sin método de pago;
   - no coste sin categoría;
   - no commit de `.env`;
   - payloads n8n válidos.
7. Crear checklist precommit:
   - git status;
   - lint;
   - tests;
   - secret scan;
   - revisión de archivos;
   - resumen de riesgos.

Entrega:
- estrategia de testing;
- checklist de seguridad;
- scripts;
- tests creados o pendientes;
- comando precommit;
- comando de commit.
```

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Add testing and security QA strategy"
git push
```
