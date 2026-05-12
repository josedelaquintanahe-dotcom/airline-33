# Architecture

## Objetivo

Definir la arquitectura objetivo de AIRLINE 33 con separacion clara entre producto, automatizacion y tooling externo.

## Principios

- `Supabase` es la fuente de verdad operativa.
- `n8n` automatiza eventos y procesos.
- el backend concentra contratos, reglas y superficies de integracion.
- el frontend consume contratos estables y no esconde logica critica.
- `Ruflo` y MCP son capas de orquestacion e integracion, no el nucleo del producto.

## Capas

- datos: `supabase/`
- automatizacion: `n8n/` y `automations/`
- backend: `backend/`
- frontend: `frontend/`
- operacion: `operations/`
- documentacion y decision log: `docs/`
- agentes y prompts: `agents/`, `prompts/`, `.ai/agents/`

## Futuro previsto

- ecommerce web propio
- integraciones con `Stripe`, `Shopify`, `Holded`, `Vercel` o `Render`
- panel interno y reporting
