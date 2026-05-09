# Milestone 06 — Panel interno de operaciones

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Crear el panel interno mínimo para operar AIRLINE 33: ventas manuales, stock, costes, devoluciones, clientes y dashboard.

## Agentes Ruflo

- Principal: `frontend-agent`
- Apoyo: `backend-agent`
- Apoyo: `supabase-agent`
- Apoyo: `crm-inventory-agent`
- Revisión: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `frontend-agent`

Agentes de apoyo:
- `backend-agent`
- `supabase-agent`
- `crm-inventory-agent`
- `security-agent`
- `git-agent`

Antes de modificar:
1. Lee `docs/operations/api-contracts.md`.
2. Lee `docs/operations/database-model.md`.
3. Lee `operations/inventory/stock-rules.md`.
4. Lee `automations/n8n/workflow-index.md`.
5. Revisa si ya existe app frontend.

Objetivo:
Crear o planificar el panel interno MVP.

Pantallas mínimas:
1. Dashboard general.
2. Registrar venta manual.
3. Consultar stock.
4. Registrar entrada de stock.
5. Registrar coste.
6. Registrar devolución/cambio.
7. Ver pedidos.
8. Ver clientes.
9. Ver drops.

Tareas:
1. Si existe frontend, respetar arquitectura actual.
2. Si no existe frontend, proponer stack mínimo:
   - Next.js o React/Vite
   - TypeScript
   - Supabase client
   - formularios validados
   - dashboard simple
3. No instales dependencias sin explicar.
4. Crear `docs/operations/internal-panel-spec.md`.
5. Crear componentes/páginas solo si la estructura ya está clara.
6. Formularios mínimos:
   - ManualSaleForm
   - StockEntryForm
   - CostForm
   - ReturnForm
7. Validaciones frontend:
   - SKU obligatorio;
   - unidades > 0;
   - método pago si está pagado;
   - coste con categoría;
   - impedir stock negativo si API lo indica.
8. Preparar conexión con API/Supabase sin credenciales reales.
9. Crear `.env.example` si hace falta, nunca `.env`.

Entrega:
- estructura propuesta/creada;
- pantallas;
- componentes;
- dependencias;
- cómo ejecutar;
- tests;
- riesgos;
- comando de commit.
```

## MVP mínimo

Debe permitir:
1. Ver stock.
2. Registrar venta manual.
3. Descontar stock.
4. Registrar cliente.
5. Registrar cobro/caja.
6. Registrar coste.
7. Ver dashboard simple.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Add internal operations panel specification"
git push
```
