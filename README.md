# AIRLINE 33

Base operativa para construir la infraestructura digital, comercial y tecnica de AIRLINE 33.

## Objetivo

Ordenar el proyecto para que pueda crecer de forma profesional, segura y escalable con:

- frontend y ecommerce;
- backend y API;
- `Supabase` como fuente de verdad;
- `n8n` como capa principal de automatizacion;
- `Ruflo` como capa externa de orquestacion;
- agentes documentados para Codex y compatibilidad con legado `.claude`.

## Reglas base

- leer `context.md`, `CODEX.md` y `AGENTS.md` antes de trabajo relevante;
- no tocar credenciales ni `.env`;
- no tratar `Ruflo` como dependencia interna del producto;
- no asumir que hojas historicas o tooling heredado son la fuente de verdad;
- no hacer deploy, migraciones reales ni activacion de workflows sin confirmacion.

## Estructura principal

- `docs/`: arquitectura, seguridad, integraciones, decisiones y pruebas
- `agents/`: capa documental de agentes de proyecto
- `prompts/`: prompts reutilizables por rol
- `ruflo/`: guia de compatibilidad y uso operativo de Ruflo
- `mcp/`: capa documental MCP y plantillas
- `integrations/`: integraciones externas y su estado
- `backend/`, `frontend/`, `supabase/`, `n8n/`: dominios tecnicos principales
- `operations/`: reglas operativas y normalizacion del modelo de negocio
- `automations/`: payloads y workflows documentados
- `scripts/`: automatizaciones locales PowerShell

## Estado

El repo ya contiene avances reales en:

- modelo de datos inicial;
- migracion base de `Supabase`;
- payloads y contratos API;
- modelo operativo inicial de inventario, pedidos, CRM, costes y drops;
- documentacion de orquestacion `Ruflo`.

Tambien conserva runtime heredado de `.claude`, `.claude-flow` y `.swarm` para compatibilidad operativa.

## Puntos de entrada

- [CODEX.md](CODEX.md)
- [AGENTS.md](AGENTS.md)
- [project-status.md](project-status.md)
- [roadmap.md](roadmap.md)
