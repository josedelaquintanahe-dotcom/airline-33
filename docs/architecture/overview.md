# AIRLINE 33 Architecture Overview

## Arquitectura objetivo

AIRLINE 33 debe construirse con una separacion clara entre sistema comercial, sistema operativo del negocio, automatizacion y tooling externo.

## Decisiones base

- `Shopify` como ecommerce inicial y canal de venta mas rapido.
- `Supabase` como fuente de verdad para productos internos, SKUs, stock, pedidos sincronizados, costes, clientes, drops, devoluciones y reporting.
- `n8n` como motor de automatizacion y orquestacion de eventos.
- `Excel` y `Google Sheets` como capa de reporting, historico e importacion controlada.
- `Codex` como ejecutor tecnico del proyecto y mantenedor de la estructura del repo.
- `Ruflo` como capa externa de orquestacion y referencia de patrones, no como dependencia interna del producto.
- `GitHub` como control de versiones.

## Componentes

### Capa comercial

- `Shopify`

### Capa de datos

- `supabase/migrations`
- `supabase/policies`
- `supabase/seed`

### Capa operativa

- `operations/`
- workbook historico local no versionado como fuente de referencia para importaciones controladas

### Capa de automatizacion

- `automations/n8n/workflows`
- `automations/payloads`
- `automations/webhooks`

### Capa documental

- `docs/architecture`
- `docs/operations`
- `docs/ruflo`

### Capa de agentes e IA

- `.ai/agents`
- `prompts/`
- `agents/`

## Reglas de arquitectura

- Ningun runtime interno de Ruflo debe formar parte de la logica del negocio.
- Los datos de operacion no deben vivir en memoria de agentes ni en estado de swarm.
- La logica de negocio critica debe quedar en base de datos, backend o workflows auditables.
- Shopify vende; Supabase opera; n8n automatiza.

## Integraciones futuras

- `Stripe` para casos complementarios si aparecen fuera del flujo base de Shopify.
- `PostHog`
- `Holded`
- `Brevo`
