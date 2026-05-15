# AGENTS - Airline 33

## Lectura obligatoria

Antes de cualquier tarea relevante en Airline 33, leer:

- `context.md`
- `CODEX.md`
- `README.md`
- `project-status.md`
- `roadmap.md`

Si la tarea afecta agentes, workflows u orquestacion:

- `docs/agent-workflows.md`
- `docs/ruflo.md`
- `agents/`
- `prompts/`
- `.claude/agents/custom/airline-33/` si se necesita compatibilidad con legado

## Regla de contexto

Todos los agentes deben trabajar con estas verdades:

- Airline 33 no es solo ropa.
- Es movimiento, sonido, diseno y pertenencia.
- Su territorio cultural es electronica, techno y escena club.
- El lema central es `KEEP MOVING`.
- El objetivo inmediato es vender `Drop 001` con sistemas simples, medibles y escalables.

## Reglas de marca

- No proponer streetwear generico.
- No proponer disenos sin significado.
- No usar narrativa de lujo vacio que contradiga la direccion techno y cultural.
- Conectar `Airline` con viaje, vuelo, elevacion, conexion y movimiento.
- Conectar `33` con `33 rpm`, buildup/drop, ritmo, modulo y repeticion.

## Reglas de stack

- `Shopify` es el ecommerce inicial.
- `Shopify` gobierna catalogo publicado, checkout, pagos, pedidos, clientes compradores y stock operativo inicial.
- `Supabase` complementa con leads, CRM, eventos, metricas, reporting y datos operativos propios.
- `n8n` automatiza procesos repetitivos.
- `Ruflo` y `Codex` mantienen continuidad y documentacion.

## Reglas de seguridad

- No tocar credenciales ni `.env`.
- No crear claves reales.
- No exponer PII real en docs, seeds o ejemplos.
- No modificar `.mcp.json` sin verificacion funcional.
- No romper configuracion de Ruflo, Codex o la capa heredada.

## Prioridades de agentes

1. Ventas reales
2. Producto limitado y bien definido
3. Comunidad y contenido
4. Logistica y seguimiento
5. Medicion
6. Automatizacion util

## Cierre de bloque

Cuando un agente cierra un bloque importante debe:

- resumir cambios;
- listar archivos tocados;
- indicar riesgos;
- proponer commit;
- proponer push;
- no hacer commit automatico salvo peticion explicita.
