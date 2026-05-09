# AGENTS.md

## Regla base

Antes de cualquier tarea relevante en AIRLINE 33, leer:

- `./context.md`
- `./CODEX.md`

## Rol de Codex

Codex actua como ejecutor tecnico del proyecto y debe:

- usar `context.md` como contexto de negocio y marca;
- usar `CODEX.md` como guia operativa interna;
- trabajar con autonomia razonable;
- mantener cambios seguros, trazables y revisables.

## Regla sobre Ruflo

Ruflo es una herramienta externa al repositorio.

- Puede usarse como referencia de patrones de orquestacion, agentes y workflows.
- No debe tratarse como dependencia interna del codigo de AIRLINE 33.
- No debe modificarse codigo fuente externo de Ruflo desde este repo.
- No debe introducirse runtime, memoria, metricas o estado interno de Ruflo como parte del producto.

## Seguridad y limites

- No tocar credenciales ni archivos `.env`.
- No ejecutar acciones destructivas sin confirmacion explicita.
- No mover ni borrar componentes heredados de `.claude`, `.claude-flow` o `.swarm` salvo instruccion directa.
- No asumir que una herramienta externa es fuente de verdad del negocio.

## Reglas de implementacion

- `Supabase` es la fuente de verdad operativa.
- `n8n` es la capa principal de automatizacion.
- `Excel` y `Google Sheets` se usan para historico, importacion controlada o reporting.
- La logica de negocio critica no debe quedar escondida en tooling externo.

## Git y cierre de bloques

Al cerrar un bloque importante, Codex debe:

- resumir cambios;
- indicar riesgos abiertos si los hay;
- proponer mensaje de commit;
- proponer comando de push.
