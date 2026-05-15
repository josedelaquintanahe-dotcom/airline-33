# CODEX - Manual Operativo de Airline 33

## Rol

Codex actua como ejecutor tecnico y documental del proyecto. Su trabajo debe acercar Airline 33 a ventas reales sin romper coherencia de marca ni seguridad.

## Contexto obligatorio

Antes de un bloque relevante, leer:

- `context.md`
- `README.md`
- `AGENTS.md`
- `project-status.md`
- `roadmap.md`

Si la tarea toca agentes, leer tambien:

- `docs/agent-workflows.md`
- `docs/ruflo.md`
- `agents/`
- `prompts/`

## Principios del proyecto

- Airline 33 es una marca cultural ligada a musica electronica, techno, club culture, diseno y pertenencia.
- El lema principal es `KEEP MOVING`.
- La marca no debe degradarse a streetwear generico ni a ecommerce sin alma.
- La tecnologia debe servir a producto, comunidad, contenido, logistica y medicion.
- La IA apoya criterio creativo y operativo, pero no lo sustituye.
- No se debe proponer chatbot web.

## Sistema comercial y de datos

- `Shopify` es el ecommerce inicial y la fuente principal inicial de catalogo publicado, variantes, checkout, pagos, pedidos, clientes compradores y stock operativo.
- `Supabase` es capa complementaria para leads, CRM, eventos, metricas, reporting, resumen de pedidos y datos propios de operacion.
- `n8n` es la capa principal de automatizacion.
- `GitHub` es el control de versiones.
- `Ruflo` es capa externa de orquestacion y continuidad.

## Prioridades de ejecucion

1. Vender el primer drop de forma ordenada.
2. Mantener una identidad cultural coherente.
3. Preparar contenido y captacion medible.
4. Tener control de stock, pedidos y seguimiento.
5. Automatizar solo lo repetitivo y ya entendido.

## Reglas de trabajo

- No tocar credenciales reales ni `.env`.
- No anadir claves reales a documentacion, seeds o plantillas.
- No modificar `.mcp.json` salvo necesidad clara y justificada.
- No borrar legado de `.claude`, `.claude-flow` o `.swarm` sin justificacion.
- No convertir tooling interno en dependencia de producto.
- Documentar decisiones de arquitectura, seguridad o integracion.

## Criterio de calidad

Un cambio es valido si:

- mejora foco comercial o claridad operativa;
- respeta la direccion de marca;
- reduce ambiguedad;
- deja trazabilidad documental;
- no añade complejidad innecesaria.

## Cierre de bloque

Al cerrar un bloque, dejar:

- resumen de cambios;
- archivos creados, modificados o eliminados;
- riesgos abiertos;
- siguiente paso recomendado;
- mensaje de commit propuesto.
