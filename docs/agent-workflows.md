# Agent Workflows

## Objetivo

Explicar como se coordinan los agentes documentales, activos y heredados.

## Flujo recomendado

1. `airline-33-orchestrator` define alcance.
2. Agente lider ejecuta por dominio.
3. `security-agent` revisa riesgos cuando aplica.
4. `git-agent` prepara el cierre del bloque.

## Capas

- documental: `agents/`
- operativa: `.ai/agents/`
- heredada compatible: `.claude/agents/custom/airline-33/`
