# Security

## Principios

- no versionar secretos;
- minimo privilegio;
- separar dev, staging y prod;
- no exponer PII innecesaria en docs, plantillas o payloads.

## Riesgos actuales

- legado `.claude`, `.claude-flow` y `.swarm`;
- datos historicos en CSV;
- validacion local de `Supabase` pendiente.

## Reglas

- `security-agent` revisa auth, webhooks, pagos, RLS y PII;
- `.mcp.json` no se modifica sin verificacion.
