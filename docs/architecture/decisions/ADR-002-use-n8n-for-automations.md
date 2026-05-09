# ADR-002 Use n8n for Automations

## Estado

Aprobado

## Contexto

AIRLINE 33 necesita automatizar ventas, stock, costes, devoluciones, reporting y sincronizaciones sin dispersar la operacion entre demasiadas herramientas puente.

## Decision

Usar `n8n` como motor principal de automatizaciones.

## Consecuencias

- Los workflows viviran documentados y organizados en `automations/n8n/workflows`.
- `n8n` coordinara eventos y sincronizaciones, pero no sera la fuente de verdad.
- Los webhooks, payloads y politicas de revision quedaran versionados y revisables.

## Alternativas descartadas

- depender de automatizaciones manuales aisladas;
- repartir la operacion entre varias capas como Zapier + Pipedream + scripts ad hoc desde el inicio;
- esconder logica de negocio critica fuera del repo.
