# Milestone 08 - Pagos con Shopify Payments y flujos complementarios

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestacion/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentacion Ruflo antes de modificar codigo.

## Objetivo

Preparar pagos de forma segura, sin activar cobros reales hasta confirmacion, priorizando `Shopify Payments` en la primera fase.

## Agentes Ruflo

- Principal: `backend-agent`
- Apoyo: `frontend-agent`
- Apoyo: `supabase-agent`
- Apoyo: `n8n-automation-agent`
- Revision obligatoria: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `backend-agent`

Agentes de apoyo:
- `frontend-agent`
- `supabase-agent`
- `n8n-automation-agent`
- `security-agent`
- `git-agent`

Objetivo:
Preparar pagos con Shopify Payments como opcion principal y documentar Stripe solo si aparece un flujo complementario fuera de Shopify.

Antes de modificar:
1. Lee `docs/architecture/overview.md`.
2. Lee `docs/ruflo/safety-rules.md`.
3. Lee `.env.example` si existe.
4. No modifiques `.env`.
5. No uses claves reales.
6. No actives pagos en produccion.
7. No realices cobros reales.

Tareas:
1. Crear `docs/architecture/payments-setup.md`.
2. Documentar:
   - Shopify Payments para el flujo inicial.
   - Stripe solo si se justifica fuera del checkout base de Shopify.
3. Mantener `.env.example` sin valores reales.
4. Documentar flujo:
   - pedido creado;
   - pago confirmado;
   - webhook recibido;
   - sincronizacion hacia Supabase;
   - automatizacion en n8n;
   - actualizacion de stock y estado.
5. Si hay payloads, que sean ejemplos sin datos sensibles.
6. `security-agent` debe revisar:
   - secretos no commiteados;
   - webhooks verificados;
   - no confiar en frontend para pagos;
   - no descontar stock sin evento confirmado.
```
