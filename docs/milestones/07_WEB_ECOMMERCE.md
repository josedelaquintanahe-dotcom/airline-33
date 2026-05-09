# Milestone 07 — Web/ecommerce para empezar a vender

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Definir y construir la web mínima: landing, catálogo, producto, drops, carrito/checkout o integración con Shopify/Stripe.

## Agentes Ruflo

- Principal: `frontend-agent`
- Apoyo: `brand-strategist`
- Apoyo: `visual-identity-agent`
- Apoyo: `streetwear-copywriter`
- Apoyo técnico: `backend-agent`, `supabase-agent`
- Revisión: `security-agent`
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
- `security-agent`
- `git-agent`

Antes de modificar:
1. Lee `context.md`.
2. Lee `docs/brand/` si existe.
3. Lee `docs/architecture/overview.md`.
4. Lee `docs/operations/database-model.md`.
5. Lee `docs/ruflo/safety-rules.md`.

Objetivo:
Preparar la web/ecommerce MVP.

Decisión inicial:
Analiza:
A) Shopify como ecommerce rápido.
B) Web propia Next.js + Supabase + Stripe.
C) Landing propia + checkout externo temporal.

No implementes pagos reales sin confirmación.

Tareas:
1. Crear `docs/architecture/ecommerce-decision.md`.
2. Recomendar opción para vender cuanto antes.
3. Crear `docs/brand/web-copy.md` con copy inicial no genérico.
4. Crear `docs/brand/web-structure.md` con:
   - home
   - drop actual
   - producto
   - about mínimo
   - comunidad/waitlist
   - contacto
   - política de envíos/devoluciones
5. Si ya existe frontend, crear rutas mínimas sin romper lo existente.
6. Preparar datos necesarios:
   - productos
   - SKUs
   - imágenes
   - precios
   - stock
   - descripción
   - guía de tallas
7. Crear lista de pendientes:
   - dominio
   - hosting
   - pagos
   - términos legales
   - privacidad/cookies
   - envíos
   - devoluciones
   - fotos producto
   - tallas
   - pricing final

Entrega:
- decisión ecommerce;
- estructura web;
- copy inicial;
- tareas técnicas;
- riesgos;
- comando de commit.
```

## Criterios de cierre

- Decisión ecommerce documentada.
- Estructura web definida.
- Copy base creado.
- Lista de assets y legales creada.
- Sin pagos reales conectados.

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Define AIRLINE 33 ecommerce MVP"
git push
```
