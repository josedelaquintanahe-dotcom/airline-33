# Milestone 10 — Holded, facturación y finanzas

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Preparar capa fiscal/financiera: ventas, costes, facturas, proveedores y caja.

## Agentes Ruflo

- Principal: `backend-agent`
- Apoyo: `n8n-automation-agent`
- Apoyo: `crm-inventory-agent`
- Revisión: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `backend-agent`

Agentes de apoyo:
- `n8n-automation-agent`
- `crm-inventory-agent`
- `security-agent`
- `git-agent`

Objetivo:
Preparar integración futura con Holded.

Reglas:
1. No conectes Holded real sin confirmación.
2. No uses API keys reales.
3. No crees facturas reales.
4. No modifiques `.env`.
5. Documenta primero.

Tareas:
1. Crear `docs/architecture/holded-finance-setup.md`.
2. Crear `operations/costs/finance-rules.md`.
3. Definir qué sincronizar:
   - clientes;
   - facturas;
   - ventas;
   - costes;
   - proveedores;
   - productos;
   - impuestos;
   - caja.
4. Definir qué NO sincronizar:
   - decisiones de marca;
   - borradores de drops;
   - datos de comunidad no necesarios fiscalmente.
5. Diseñar workflow n8n:
   - venta pagada → factura/registro Holded;
   - coste registrado → gasto/proveedor Holded;
   - proveedor nuevo → contacto Holded.
6. Crear payloads:
   - holded-sale-sync.example.json
   - holded-cost-sync.example.json
7. Crear checklist legal/fiscal:
   - forma jurídica;
   - IVA;
   - facturación;
   - política de devoluciones;
   - términos y condiciones;
   - privacidad;
   - cookies.

Entrega:
- documentación Holded;
- reglas financieras;
- payloads;
- checklist legal/fiscal;
- riesgos;
- comando de commit.
```

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Plan Holded finance and invoicing integration"
git push
```
