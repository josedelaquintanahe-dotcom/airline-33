# AIRLINE 33 - Project Status

## Estado actual

El repositorio ya tiene una base funcional de arquitectura, milestones, migracion inicial de `Supabase`, payloads y reglas operativas de negocio.

Tambien conserva capas heredadas de compatibilidad:

- `.claude`
- `.claude-flow`
- `.swarm`
- `.mcp.json`

## Lo anadido en esta reorganizacion

- capa documental raiz para agentes, prompts, MCP, Ruflo e integraciones;
- archivos raiz de seguimiento y roadmap;
- endurecimiento de `.gitignore`;
- documentacion base para arquitectura, API, seguridad, despliegue, testing y decisiones;
- scripts base PowerShell para setup, desarrollo, pruebas y despliegue.

## Lo eliminado

- `.claude/memory.db`
- `.claude-flow/daemon.pid`
- `.claude/agents/custom/test-long-runner.md`

## Motivo de eliminacion

- `memory.db` y `daemon.pid` son artefactos runtime locales;
- `test-long-runner.md` es un agente de prueba generico, fuera de la capa AIRLINE 33 y sin valor de producto.

## Lo que falta

- validacion real local de la migracion y el seed de `Supabase`;
- implementacion real de backend y frontend;
- formalizacion de workflows `n8n`;
- consolidacion de integraciones externas;
- cierre de milestones posteriores.

## Riesgos abiertos

- working tree ya venia con cambios no cerrados antes de esta reorganizacion;
- existe legado operativo de `.claude`, `.claude-flow` y `.swarm` que debe convivir sin contaminar el producto;
- `.mcp.json` se mantiene sin tocar para no romper compatibilidad actual;
- hay datos historicos en `operations/excel/imports/` que requieren control de privacidad y revision.

## Proximo milestone recomendado

Validar localmente `Supabase` de forma real y, despues, ejecutar `05_N8N_AUTOMATIONS` con la nueva capa documental como referencia oficial.
