# Milestone 07 - Web/ecommerce para empezar a vender

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestacion/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentacion Ruflo antes de modificar codigo.

## Objetivo

Preparar y documentar la superficie de venta minima con `Shopify` como ecommerce inicial.

## Agentes Ruflo

- Principal: `frontend-agent`
- Apoyo: `brand-strategist`
- Apoyo: `visual-identity-agent`
- Apoyo: `streetwear-copywriter`
- Apoyo tecnico: `backend-agent`, `supabase-agent`, `n8n-automation-agent`
- Revision: `security-agent`
- Cierre: `git-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Agente principal:
- `frontend-agent`

Agentes de apoyo:
- `brand-strategist`
- `visual-identity-agent`
- `streetwear-copywriter`
- `backend-agent`
- `supabase-agent`
- `n8n-automation-agent`
- `security-agent`
- `git-agent`

Antes de modificar:
1. Lee `context.md`.
2. Lee `docs/architecture/overview.md`.
3. Lee `docs/operations/database-model.md`.
4. Lee `docs/ruflo/safety-rules.md`.
5. No modifiques `.env`.

Objetivo:
Preparar el ecommerce MVP con Shopify como canal inicial de venta.

Tareas:
1. Documentar la estructura comercial del storefront.
2. Definir colecciones, producto, drop, about minimo y waitlist.
3. Especificar que datos deben sincronizarse desde Shopify hacia Supabase.
4. Preparar copy inicial no generico.
5. Listar pendientes tecnicos y legales.
6. No implementar pagos reales sin confirmacion.

Entrega:
- estructura ecommerce;
- copy inicial;
- datos necesarios;
- sincronizaciones requeridas;
- riesgos;
- comando de commit.
```

## Criterios de cierre

- Shopify fijado como ecommerce inicial.
- Estructura web definida.
- Copy base creado.
- Lista de assets y legales creada.
- Sin pagos reales conectados.
