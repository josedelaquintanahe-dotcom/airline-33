# Supabase Policies

## Objetivo

Mantener politicas RLS y reglas de acceso separadas de las migraciones base.

## Regla inicial

Antes de activar RLS en produccion, definir:

- roles de admin interno;
- acceso de automatizaciones `n8n`;
- acceso de lectura y escritura para backend;
- limites sobre clientes, pedidos, caja y devoluciones.

## Ficheros esperados

- una politica base por dominio cuando haya auth real;
- revisiones por parte de `security-agent`;
- pruebas de acceso en `tests/integration`.
