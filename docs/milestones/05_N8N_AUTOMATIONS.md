# Milestone 05 — Automatizaciones n8n

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Preparar workflows n8n para automatizar ventas manuales, stock, costes, devoluciones, alertas y reportes.

## Agentes Ruflo

- Principal: `n8n-automation-agent`
- Apoyo: `supabase-agent`
- Apoyo: `backend-agent`
- Apoyo: `crm-inventory-agent`
- Revisión: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33 usando agentes especializados.

Agente principal:
- `n8n-automation-agent`

Agentes de apoyo:
- `supabase-agent`
- `backend-agent`
- `crm-inventory-agent`
- `security-agent`
- `git-agent`

Antes de modificar:
1. Lee `docs/operations/api-contracts.md`.
2. Lee `docs/operations/database-model.md`.
3. Lee `operations/inventory/stock-rules.md`.
4. Lee `operations/orders/order-statuses.md`.
5. Lee `docs/ruflo/safety-rules.md`.

Objetivo:
Crear documentación y estructura de workflows n8n.

Tareas:
1. Crear `automations/n8n/workflow-index.md`.
2. Crear:
   - automations/n8n/workflows/manual-sale.md
   - automations/n8n/workflows/stock-entry.md
   - automations/n8n/workflows/cost-registration.md
   - automations/n8n/workflows/returns.md
   - automations/n8n/workflows/low-stock-alert.md
   - automations/n8n/workflows/weekly-report.md
   - automations/n8n/workflows/drop-exclusive-access.md
   - automations/n8n/workflows/holded-sync.md

3. Cada workflow debe incluir:
   - objetivo;
   - trigger;
   - input JSON;
   - nodos n8n previstos;
   - validaciones;
   - llamadas a Supabase/API;
   - salida esperada;
   - errores;
   - reintentos;
   - logs;
   - credenciales necesarias;
   - riesgos;
   - prueba manual.

4. Crear payloads:
   - manual-sale.example.json
   - stock-entry.example.json
   - cost-registration.example.json
   - return.example.json
   - low-stock-alert.example.json
   - weekly-report.example.json

5. No conectes credenciales reales.
6. No actives workflows reales.
7. Si generas JSON exportable de n8n, guárdalo como draft en:
   - automations/n8n/workflows/json-drafts/

Entrega:
- workflows documentados;
- payloads;
- credenciales necesarias;
- riesgos;
- próximos pasos;
- comando de commit.
```

## Workflows mínimos para vender

1. Venta manual.
2. Entrada de stock.
3. Coste nuevo.
4. Devolución/cambio.
5. Stock bajo.
6. Reporte semanal.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Design n8n automation workflows for AIRLINE 33"
git push
```
