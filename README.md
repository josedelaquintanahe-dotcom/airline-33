# Airline 33

Airline 33 es una marca de ropa streetwear en fase de relanzamiento. Este repositorio centraliza la base estrategica, tecnica y operativa para preparar una salida real al mercado con un ecommerce inicial sobre Shopify, una capa de datos complementaria en Supabase, automatizaciones en n8n, agentes coordinados con Ruflo/Codex y GitHub como sistema de versionado.

## Objetivo principal

Crear y lanzar Airline 33 como una marca de ropa funcional, reconocible y preparada para vender online antes de septiembre de 2026.

## Principios de stack

- `Shopify` es el ecommerce inicial y el canal mas rapido para vender.
- `Supabase` es la fuente de verdad operativa complementaria para catalogo interno, clientes, pedidos sincronizados, inventario, drops, CRM y reporting.
- `n8n` es la capa principal de automatizacion y sincronizacion.
- `Ruflo` y `Codex` forman el sistema de agentes y orquestacion de trabajo.
- `GitHub` es el sistema de control de versiones.

## Alcance del repositorio

El proyecto no se limita a una web. Cubre marca, producto, catalogo, drops, inventario, CRM, automatizaciones, integraciones, documentacion operativa y preparacion del lanzamiento.

## Estructura

```txt
docs/           Documentacion estrategica, tecnica y operativa.
agents/         Descripcion funcional de agentes.
prompts/        Prompts reutilizables para Codex, Ruflo y agentes.
integrations/   Integraciones externas y su estado.
ruflo/          Politicas y uso de Ruflo como capa externa.
mcp/            Documentacion de conexiones MCP.
n8n/            Credenciales ejemplo y estructura de automatizaciones.
frontend/       Aplicacion web y superficie visual.
backend/        API, servicios y logica de negocio.
supabase/       Migraciones, seed y documentacion de datos.
scripts/        Scripts locales de soporte.
logs/           Logs locales no versionables.
```

## Estado actual

La prioridad actual es cerrar coherencia documental, arquitectura inicial, modelo operativo y reglas de ejecucion antes de avanzar con implementacion productiva completa.
