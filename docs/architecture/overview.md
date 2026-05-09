# AIRLINE 33 Architecture Overview

## Arquitectura objetivo

AIRLINE 33 debe construirse con una separacion clara entre sistema operativo del negocio, automatizacion y tooling externo.

## Decisiones base

- `Supabase` como fuente de verdad para productos, SKUs, stock, pedidos, costes, clientes, drops, devoluciones y caja.
- `n8n` como motor de automatizacion y orquestacion de eventos.
- `Excel` y `Google Sheets` como capa de reporting, historico e importacion controlada.
- `Codex` como ejecutor tecnico del proyecto y mantenedor de la estructura del repo.
- `Ruflo` como capa externa de orquestacion y referencia de patrones, no como dependencia interna del producto.
- `GitHub` como control de versiones.

## Componentes

### Capa de datos

- `supabase/migrations`
- `supabase/policies`
- `supabase/seed`

### Capa operativa

- `operations/`
- `doc-ref/A33.xlsx` como fuente historica de referencia

### Capa de automatizacion

- `automations/n8n/workflows`
- `automations/payloads`
- `automations/webhooks`

### Capa documental

- `docs/architecture`
- `docs/brand`
- `docs/operations`
- `docs/ruflo`

### Capa de agentes e IA

- `.ai/agents`
- `.ai/prompts`

## Reglas de arquitectura

- Ningun runtime interno de Ruflo debe formar parte de la logica del negocio.
- Los datos de operacion no deben vivir en memoria de agentes ni en estado de swarm.
- La logica de negocio critica debe quedar en base de datos, backend o workflows auditables.

## Futuro previsto

Integraciones futuras a preparar sin acoplar ahora:

- `Shopify`
- `Stripe`
- `PostHog`
- `Holded`
- `Brevo`
