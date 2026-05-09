# Milestone 12 — Launch readiness: listo para vender

> Proyecto: AIRLINE 33  
> Objetivo: dejar el sistema listo para vender cuanto antes, con Codex trabajando mediante agentes especializados de Ruflo.  
> Regla base: Ruflo se usa como capa de orquestación/agentes. Codex debe leer `CODEX.md`, `AGENTS.md`, `context.md` y la documentación Ruflo antes de modificar código.


## Objetivo

Validar si AIRLINE 33 está listo para vender: producto, stock, web, pagos, automatizaciones, emails, legal, operaciones y soporte.

## Agentes Ruflo

- Principal: `airline-33-orchestrator`
- Apoyo: `brand-strategist`
- Apoyo: `frontend-agent`
- Apoyo: `backend-agent`
- Apoyo: `supabase-agent`
- Apoyo: `n8n-automation-agent`
- Apoyo: `crm-inventory-agent`
- Apoyo: `security-agent`
- Apoyo: `git-agent`
- Apoyo: `streetwear-copywriter`
- Apoyo: `visual-identity-agent`
- Apoyo: `content-calendar-agent`

## Prompt maestro para Codex

```text
Trabaja en AIRLINE 33.

Usa como agente principal:
- `airline-33-orchestrator`

Usa todos los agentes especializados:
- `brand-strategist`
- `frontend-agent`
- `backend-agent`
- `supabase-agent`
- `n8n-automation-agent`
- `crm-inventory-agent`
- `security-agent`
- `git-agent`
- `streetwear-copywriter`
- `visual-identity-agent`
- `content-calendar-agent`

Objetivo:
Crear y ejecutar revisión de lanzamiento.

Tareas:
1. Crear:
   - docs/launch/launch-readiness-checklist.md
   - docs/launch/go-live-plan.md
   - docs/launch/rollback-plan.md
   - docs/launch/day-0-operations.md
   - docs/launch/day-7-review.md

Checklist mínimo:
- productos definitivos;
- SKUs creados;
- stock cargado;
- precios definidos;
- costes definidos;
- margen revisado;
- fotos producto;
- guía de tallas;
- web publicada;
- dominio conectado;
- pagos en modo real;
- pedidos de prueba;
- stock se descuenta;
- email confirmación;
- devoluciones documentadas;
- política envíos;
- privacidad/cookies;
- dashboard funcionando;
- n8n workflows activos;
- alertas internas;
- Holded/facturación preparada;
- backup de datos;
- usuarios internos;
- soporte;
- contenido de lanzamiento;
- calendario de comunicación;
- reporte semanal.

Pruebas obligatorias:
1. Pedido test completo.
2. Venta manual test.
3. Entrada stock test.
4. Coste test.
5. Devolución test.
6. Stock bajo test.
7. Reporte semanal test.
8. Pago test.
9. Cliente duplicado test.
10. Revisión seguridad final.

Entrega:
- checklist;
- estado por área;
- bloqueadores;
- riesgos;
- decisión listo/no listo;
- próximos pasos;
- comando de commit.
```

## Commit

```powershell
cd "C:\Users\Manuel\PROJECTS\airline-33"
git status
git add .
git commit -m "Add AIRLINE 33 launch readiness plan"
git push
```
