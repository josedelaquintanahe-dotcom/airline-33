# Milestone 08 — Pagos con Stripe / Shopify Payments

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Preparar pagos de forma segura, sin activar cobros reales hasta confirmación.

## Agentes Ruflo

- Principal: `backend-agent`
- Apoyo: `frontend-agent`
- Apoyo: `supabase-agent`
- Apoyo: `n8n-automation-agent`
- Revisión obligatoria: `security-agent`
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
Preparar pagos con Stripe o Shopify Payments.

Antes de modificar:
1. Lee `docs/architecture/ecommerce-decision.md`.
2. Lee `docs/ruflo/safety-rules.md`.
3. Lee `.env.example` si existe.
4. No modifiques `.env`.
5. No uses claves reales.
6. No actives pagos en producción.
7. No realices cobros reales.

Tareas:
1. Crear `docs/architecture/payments-setup.md`.
2. Documentar:
   - Stripe Checkout si web propia.
   - Shopify Payments si Shopify.
3. Crear `.env.example` con:
   - STRIPE_SECRET_KEY
   - STRIPE_WEBHOOK_SECRET
   - NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
   - SUPABASE_URL
   - SUPABASE_ANON_KEY
4. Documentar flujo:
   - crear checkout
   - confirmar pago
   - webhook payment_succeeded
   - actualizar order.status
   - registrar cash_movement
   - descontar stock solo con pago confirmado
5. Crear payloads:
   - stripe-checkout-created.example.json
   - stripe-payment-succeeded.example.json
6. Si hay backend, preparar endpoint mock/documentado `/api/checkout`.
7. `security-agent` debe revisar:
   - secretos no commiteados;
   - webhooks verificados;
   - no confiar en frontend para pagos;
   - no descontar stock sin pago confirmado.

Entrega:
- documentación de pagos;
- env example;
- payloads;
- riesgos;
- pasos para modo test;
- comando de commit.
```

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Prepare payment integration documentation and contracts"
git push
```
