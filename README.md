# AIRLINE 33

Repositorio operativo para construir la infraestructura digital y operativa de AIRLINE 33, marca de streetwear de Madrid con relanzamiento previsto para septiembre de 2026.

## Objetivo

Preparar una base limpia para desarrollar:

- marca y sistema visual;
- web y ecommerce;
- backend;
- base de datos en `Supabase`;
- automatizaciones con `n8n`;
- operaciones de inventario, pedidos, clientes y costes;
- dashboards y reporting;
- documentacion operativa.

## Reglas base

- Leer `context.md` antes de tareas relevantes.
- Usar `CODEX.md` como guia operativa.
- Usar `AGENTS.md` como politica de trabajo para Codex.
- No tocar credenciales ni archivos `.env`.
- No borrar nada sin confirmacion.
- `Ruflo` se trata como herramienta externa y capa de referencia, no como dependencia interna del producto.

## Estructura principal

- `docs/`
- `operations/`
- `supabase/`
- `automations/`
- `scripts/`
- `tests/`
- `.ai/agents/`
- `.ai/prompts/`

## Estado actual

La base del repositorio ya esta preparada para:

- documentar arquitectura;
- normalizar datos historicos desde `doc-ref/A33.xlsx`;
- preparar migraciones y politicas de `Supabase`;
- estructurar workflows de `n8n`;
- mantener una capa propia de agentes AIRLINE 33 separada del runtime heredado de Ruflo/Claude Flow.

El milestone de estructura base ya esta cubierto, aunque el repo contiene tambien avances de bloques posteriores de importacion, datos y automatizacion.

## Siguientes pasos

- limpiar y validar borradores CSV en `operations/excel/imports/`;
- preparar importacion controlada a `Supabase`;
- definir seeds y primeras pruebas de integracion;
- seguir el orden marcado en `docs/milestones/`.
