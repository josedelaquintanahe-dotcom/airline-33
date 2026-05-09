# Safety Rules

## Permitido sin confirmacion

- leer documentacion del repo;
- crear o actualizar documentacion interna;
- crear estructura de carpetas;
- copiar agentes propios de AIRLINE 33 dentro del repo;
- proponer arquitectura, workflows, mapping y roadmap;
- crear scripts no destructivos y ejemplos;
- ejecutar checks locales de lectura, validacion o inspeccion sin tocar credenciales.

## Requiere confirmacion

- borrar, mover o reestructurar `.claude`, `.claude-flow`, `.swarm`, `.mcp.json` o `CLAUDE.md`;
- ejecutar acciones con impacto financiero, de pagos o refunds;
- tocar secretos, credenciales, `.env` o permisos de acceso;
- conectar herramientas externas con write real;
- ejecutar migraciones sobre entornos reales;
- hacer commits o pushes si no se han pedido;
- versionar o empujar datos historicos si contienen informacion sensible o personal.

## Prohibido

- modificar codigo fuente externo de Ruflo desde este repo;
- usar memoria, metrics o swarm state de Ruflo como parte del producto AIRLINE 33;
- borrar archivos sin confirmacion explicita;
- exponer credenciales, tokens o datos sensibles;
- asumir que tooling heredado es fuente de verdad del negocio;
- ejecutar acciones destructivas por conveniencia.
