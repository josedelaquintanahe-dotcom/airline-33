# Milestone 03 — Supabase y backend base

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Crear la base de datos principal de AIRLINE 33 y preparar el backend/API mínimo para inventario, pedidos, clientes, costes y drops.

## Agentes Ruflo

- Principal: `supabase-agent`
- Apoyo: `backend-agent`
- Apoyo: `crm-inventory-agent`
- Revisión: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33 usando agentes especializados.

Agente principal:
- `supabase-agent`

Agentes de apoyo:
- `backend-agent`
- `crm-inventory-agent`
- `security-agent`
- `git-agent`

Antes de modificar:
1. Lee `context.md`.
2. Lee `docs/architecture/overview.md`.
3. Lee `docs/ruflo/airline33-agent-map.md`.
4. Lee `docs/ruflo/safety-rules.md`.
5. Revisa `supabase/`.
6. No modifiques `.env`.
7. No ejecutes migraciones en producción.
8. No borres datos.

Objetivo:
Crear la primera versión del modelo de datos y backend para AIRLINE 33.

Tablas iniciales:
- products
- skus
- drops
- customers
- orders
- order_items
- stock_movements
- costs
- suppliers
- cash_movements
- returns
- community_members
- marketing_events

Tareas Supabase:
1. Crear migración SQL en `supabase/migrations/`.
2. Añadir claves primarias UUID.
3. Añadir timestamps `created_at`, `updated_at`.
4. Añadir relaciones entre tablas.
5. Añadir constraints:
   - SKU único.
   - order_items vinculado a orders.
   - stock_movements con cantidad distinta de 0.
   - costs con categoría obligatoria.
   - orders con estado válido.
   - payment_method obligatorio cuando el pedido esté pagado.
6. Añadir índices:
   - skus.sku
   - orders.customer_id
   - order_items.order_id
   - stock_movements.sku_id
   - costs.drop_id
   - customers.email
   - customers.phone
7. Crear `supabase/seed/seed.sql` con datos falsos.
8. Crear `supabase/README.md`.
9. Crear `docs/operations/database-model.md`.
10. Crear o actualizar `docs/architecture/decisions/ADR-001-use-supabase-as-source-of-truth.md`.

Tareas backend:
1. Si existe backend, respeta la arquitectura.
2. Si no existe backend, crea documentación/API contract.
3. Crear `docs/operations/api-contracts.md` con endpoints:
   - POST /api/manual-sale
   - POST /api/stock-entry
   - POST /api/costs
   - POST /api/returns
   - GET /api/stock
   - GET /api/dashboard
   - GET /api/orders
   - GET /api/customers

4. Crear ejemplos JSON en `automations/payloads/`:
   - manual-sale.example.json
   - stock-entry.example.json
   - cost-registration.example.json
   - return.example.json

Validaciones:
- No stock negativo salvo ajuste autorizado.
- No pedidos sin líneas.
- No SKUs duplicados.
- No costes sin categoría.
- No venta pagada sin método de pago.
- Evitar clientes duplicados por email/teléfono.

Entrega:
- migraciones;
- seed;
- contratos API;
- payloads;
- riesgos;
- cómo probar;
- comando de commit.
```

## Criterios de cierre

- Modelo documentado.
- Migración y seed creados.
- Payloads de ejemplo creados.
- Sin credenciales modificadas.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Add Supabase data model and backend API contracts"
git push
```
