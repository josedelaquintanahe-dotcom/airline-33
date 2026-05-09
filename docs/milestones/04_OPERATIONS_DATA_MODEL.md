# Milestone 04 — Modelo operativo: inventario, pedidos, costes, clientes y drops

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Convertir el Excel histórico en un modelo operativo claro para Supabase, n8n, dashboard y panel interno.

## Agentes Ruflo

- Principal: `crm-inventory-agent`
- Apoyo: `supabase-agent`
- Apoyo: `backend-agent`
- Apoyo: `airline-33-orchestrator`
- Revisión: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Usa como agente principal:
- `crm-inventory-agent`

Agentes de apoyo:
- `supabase-agent`
- `backend-agent`
- `airline-33-orchestrator`
- `security-agent`
- `git-agent`

Objetivo:
Diseñar y documentar el modelo operativo definitivo.

Tareas:
1. Crear o actualizar:
   - operations/inventory/stock-rules.md
   - operations/orders/order-statuses.md
   - operations/customers/crm-segments.md
   - operations/costs/cost-categories.md
   - operations/drops/drop-model.md
   - operations/dashboards/kpi-definitions.md
   - operations/excel/mappings/a33-current-excel-mapping.md
   - operations/excel/templates/a33-operations-template-spec.md

2. En `stock-rules.md`, definir:
   - stock inicial;
   - stock reservado;
   - stock vendido;
   - stock devuelto;
   - stock disponible;
   - stock mínimo;
   - stock negativo prohibido salvo ajuste autorizado;
   - muestras/regalos/influencers;
   - pérdida/rotura;
   - cambios de talla.

3. En `order-statuses.md`, definir estados:
   - draft
   - pending_payment
   - paid
   - preparing
   - shipped
   - delivered
   - returned
   - cancelled
   - refunded

4. En `crm-segments.md`, definir:
   - amigo/círculo cercano
   - comunidad
   - comprador web
   - VIP
   - recurrente
   - influencer/prensa
   - evento/pop-up
   - waitlist
   - early access

5. En `cost-categories.md`, definir costes:
   - blanks
   - serigrafía
   - bordado
   - packaging
   - envíos
   - muestras
   - marketing
   - fotografía
   - vídeo
   - web
   - dominio
   - comisiones de pago
   - eventos
   - devoluciones
   - otros

6. En `a33-operations-template-spec.md`, definir pestañas:
   - DASHBOARD
   - PRODUCTOS_SKU
   - STOCK_ACTUAL
   - MOVIMIENTOS_STOCK
   - PEDIDOS
   - LINEAS_PEDIDO
   - CLIENTES_CRM
   - DROPS
   - COSTES
   - PROVEEDORES_COMPRAS
   - CAJA_BANCO
   - MARKETING_CONTENIDO
   - DEVOLUCIONES_INCIDENCIAS
   - COMUNIDAD_WAITLIST
   - CONFIG

Entrega:
- documentación creada;
- reglas de negocio;
- decisiones pendientes;
- automatizaciones derivadas;
- comando de commit.
```

## Criterios de cierre

- Reglas de stock, pedidos, CRM, costes y drops definidas.
- KPIs definidos.
- Plantilla Excel/Sheets especificada.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Define AIRLINE 33 operating data model"
git push
```
