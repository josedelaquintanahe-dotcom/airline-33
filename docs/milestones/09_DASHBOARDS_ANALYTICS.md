# Milestone 09 — Dashboards y analítica

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Crear métricas operativas: ventas, stock, margen, clientes, drops, caja y conversión web.

## Agentes Ruflo

- Principal: `crm-inventory-agent`
- Apoyo: `supabase-agent`
- Apoyo: `frontend-agent`
- Apoyo: `n8n-automation-agent`
- Apoyo: `brand-strategist`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `crm-inventory-agent`

Agentes de apoyo:
- `supabase-agent`
- `frontend-agent`
- `n8n-automation-agent`
- `brand-strategist`
- `git-agent`

Objetivo:
Definir y preparar dashboards de control.

Tareas:
1. Crear o actualizar:
   - operations/dashboards/kpi-definitions.md
   - operations/dashboards/dashboard-spec.md
   - operations/dashboards/weekly-report-template.md
   - docs/architecture/analytics-setup.md

2. Definir KPIs:
   - ventas brutas;
   - ingresos netos estimados;
   - margen bruto;
   - margen por producto;
   - margen por drop;
   - stock disponible;
   - stock bajo;
   - sell-through;
   - ticket medio;
   - clientes únicos;
   - clientes recurrentes;
   - costes por categoría;
   - caja;
   - conversión web;
   - productos más vistos;
   - add to cart;
   - purchase.

3. Definir dashboard mínimo:
   - ventas;
   - stock;
   - clientes;
   - costes;
   - drops;
   - caja;
   - marketing.

4. Definir opción técnica:
   - Google Sheets rápido.
   - Panel React/Next.js.
   - PostHog para analítica web.
   - Looker Studio si hace falta.

5. Crear consultas SQL ejemplo en:
   - operations/dashboards/sql/

6. Crear template de reporte semanal.

Entrega:
- KPIs;
- dashboard spec;
- SQL ejemplo;
- reporte semanal;
- próximos pasos;
- comando de commit.
```

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Define AIRLINE 33 dashboards and analytics"
git push
```
