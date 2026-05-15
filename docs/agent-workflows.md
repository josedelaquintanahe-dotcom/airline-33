# Workflows de agentes - Airline 33

## Regla base

Todo workflow debe proteger marca, producto, ventas, logistica y trazabilidad.

## Workflow 1 - Alineacion de marca o contenido

1. `orchestrator` clasifica la necesidad.
2. `brand` valida coherencia con electronica, techno y `KEEP MOVING`.
3. El agente de contenido o visual prepara salida.
4. `qa` revisa claridad y utilidad comercial.

## Workflow 2 - Drop o producto

1. `brand` define concepto.
2. `crm-inventory` valida stock, tallas y operacion.
3. `frontend` o `integrations` prepara superficie en `Shopify`.
4. `automation` conecta alertas y reporting.
5. `qa` revisa checklist de lanzamiento.

## Workflow 3 - Nueva automatizacion

1. `automation` define trigger y objetivo.
2. `security` revisa riesgo.
3. `database` o `backend` valida contrato de datos.
4. Se documenta payload, errores e idempotencia.

## Workflow 4 - Cierre de milestone

1. `orchestrator` valida objetivo.
2. `qa` y `security` revisan si aplica.
3. Se actualizan `project-status.md`, `docs/decisions.md` y `docs/changelog.md`.
