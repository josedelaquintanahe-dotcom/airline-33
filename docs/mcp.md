# MCP - Airline 33

## Objetivo

Documentar las conexiones MCP actuales y futuras del proyecto.

## Principio principal

Las conexiones MCP deben dar acceso controlado a herramientas utiles para construir Airline 33 sin comprometer seguridad ni trazabilidad.

## Conexiones previstas

| MCP | Uso | Estado |
|---|---|---|
| Ruflo | Orquestacion de agentes | Inicial |
| Filesystem | Acceso a archivos locales | Pendiente |
| GitHub | Repositorio e issues | Pendiente |
| Supabase | Base de datos | Pendiente |
| n8n | Automatizaciones | Pendiente |
| Browser | Pruebas frontend | Pendiente |

## Reglas

1. No guardar tokens reales en archivos `.md`.
2. Documentar cada conexion.
3. Probar cada conexion con una accion minima.
4. Registrar errores comunes.
5. No dar permisos excesivos.
6. Separar entorno local, staging y produccion.

## Plantilla para nuevas conexiones

Cada conexion debe documentarse en `mcp/templates/` e indicar:

- objetivo;
- herramienta;
- permisos requeridos;
- variables necesarias;
- prueba minima;
- agente responsable;
- riesgos.
