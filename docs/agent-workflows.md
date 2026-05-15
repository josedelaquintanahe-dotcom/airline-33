# Workflows de agentes - Airline 33

## Objetivo

Definir como trabajan juntos los agentes para construir Airline 33 sin perder trazabilidad ni seguridad.

## Workflow 1 - Nueva funcionalidad

1. `orchestrator` analiza la peticion.
2. `brand` valida si tiene sentido para la marca si afecta experiencia, producto o mensaje.
3. El agente tecnico implementa.
4. `qa` revisa.
5. `security` revisa si hay datos, pagos, auth o integraciones.
6. Se actualiza documentacion.
7. Se cierra con resumen y propuesta de commit.

## Workflow 2 - Nueva integracion

1. `integrations` analiza la herramienta.
2. `security` revisa riesgos y permisos.
3. `backend` o `automation` implementa si procede.
4. Se actualiza `.env.example`.
5. Se documenta en `integrations/`.
6. Se define una prueba minima.
7. Se actualiza `project-status.md` si cambia el estado del stack.

## Workflow 3 - Nuevo drop

1. `brand` define concepto y tono.
2. `crm-inventory` define stock, acceso y soporte operativo.
3. `frontend` prepara la superficie visual.
4. `automation` prepara comunicaciones y eventos.
5. `qa` revisa el flujo completo.

## Workflow 4 - Cambio de base de datos

1. `database` propone cambio.
2. `backend` valida impacto en contratos.
3. `security` revisa RLS y datos sensibles.
4. `qa` define prueba minima.
5. Se actualizan `docs/database.md` y contratos relacionados.
6. Se prepara migracion versionada.

## Workflow 5 - Lanzamiento

1. `orchestrator` valida checklist.
2. `frontend` revisa experiencia.
3. `backend` revisa API y webhooks.
4. `database` revisa datos.
5. `automation` revisa workflows.
6. `security` revisa secretos y permisos.
7. `qa` valida readiness.
8. Se actualiza changelog.

## Regla

Ningun workflow debe terminar sin actualizar documentacion si ha cambiado estructura, criterio, integracion, API, base de datos o proceso comercial.
