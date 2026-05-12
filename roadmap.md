# Roadmap - Airline 33

## Objetivo del roadmap

Guiar la construccion de Airline 33 hasta un lanzamiento vendible, priorizando primero claridad estrategica y velocidad de salida, despues profundidad operativa.

## Fase 1 - Base estrategica y documental

Objetivo:
Dejar una base coherente para que Codex, Ruflo y los agentes trabajen con el mismo contexto.

Entregables:
- `README.md`
- `AGENTS.md`
- `project-status.md`
- `roadmap.md`
- `docs/`
- `agents/`
- `prompts/`
- `integrations/`
- `mcp/`
- `ruflo/`
- `.env.example`
- `.gitignore`

Criterio de cierre:
La documentacion raiz es coherente y el proyecto puede entenderse rapido por un agente nuevo.

## Fase 2 - Identidad de marca

Objetivo:
Definir el posicionamiento, tono y direccion visual que gobernaran producto, web y contenido.

Entregables:
- posicionamiento;
- publico objetivo;
- tono de voz;
- referentes visuales;
- decision de direccion de marca;
- mensaje central;
- guia inicial de marca.

Criterio de cierre:
La marca tiene una direccion suficientemente clara para producir producto, copy y experiencia digital.

## Fase 3 - Producto y primer drop

Objetivo:
Definir la primera oferta vendible.

Entregables:
- prendas iniciales;
- drop inicial;
- pricing orientativo;
- costes y margen objetivo;
- politica de stock;
- naming y narrativa del drop.

Criterio de cierre:
Existe un primer drop suficientemente definido para montar catalogo y preparar la venta.

## Fase 4 - Arquitectura tecnica y operativa

Objetivo:
Cerrar la arquitectura minima para vender pronto sin perder control operativo.

Decisiones clave:
- `Shopify` como ecommerce inicial;
- `Supabase` como fuente de verdad operativa complementaria;
- `n8n` como capa principal de automatizacion;
- `Ruflo` como capa externa de agentes;
- `GitHub` como versionado;
- frontend y backend preparados para evolucion posterior.

Entregables:
- `docs/architecture.md`
- `docs/database.md`
- `docs/api.md`
- `docs/integrations.md`
- decision de stack frontend;
- decision de despliegue;
- modelo de datos inicial.

Criterio de cierre:
Se puede implementar sin contradicciones sobre ecommerce, datos y automatizacion.

## Fase 5 - Ecommerce inicial con Shopify

Objetivo:
Poner en marcha la superficie de venta mas rapida.

Entregables:
- storefront inicial;
- catalogo y productos publicados;
- colecciones o drops estructurados;
- checkout operativo;
- politicas basicas de tienda;
- newsletter o waitlist;
- integracion documental con el resto del stack.

Criterio de cierre:
Airline 33 puede vender online con Shopify como canal inicial.

## Fase 6 - Backend interno y Supabase

Objetivo:
Construir la capa operativa que complementa Shopify y gobierna el negocio.

Entregables:
- tablas y relaciones de operacion;
- clientes, leads, drops e inventario;
- pedidos sincronizados;
- politicas de seguridad;
- API interna o contratos de integracion;
- seed y migraciones revisables.

Criterio de cierre:
La operacion interna vive en `Supabase` sin sustituir el rol inicial de Shopify como ecommerce.

## Fase 7 - Automatizaciones n8n

Objetivo:
Automatizar los procesos repetitivos y sincronizaciones entre sistemas.

Entregables:
- captura de leads;
- sincronizacion Shopify -> Supabase;
- alertas de stock;
- notificaciones de pedido;
- registros de errores;
- workflows documentados;
- payloads y webhooks definidos.

Criterio de cierre:
Las operaciones principales estan automatizadas de forma trazable y auditable.

## Fase 8 - Contenido, lanzamiento y ventas

Objetivo:
Preparar el lanzamiento coordinado del primer drop.

Entregables:
- calendario de contenido;
- campaña de pre-lanzamiento;
- lista de espera;
- emails o mensajes de lanzamiento;
- copy de producto;
- plan de drop;
- funnel inicial.

Criterio de cierre:
La marca puede lanzar su primer drop con coordinacion entre producto, venta y operaciones.

## Fase 9 - Despliegue y operacion estable

Objetivo:
Publicar y operar el stack con seguridad y continuidad.

Entregables:
- frontend publicado;
- backend o capa de integracion publicada;
- `Supabase` operativo;
- `n8n` operativo;
- dominio conectado;
- variables de entorno configuradas;
- logs y documentacion de operacion.

Criterio de cierre:
El sistema esta online, trazable y preparado para trafico real.

## Fase 10 - Optimizacion

Objetivo:
Mejorar conversion, operacion y producto con datos reales.

Entregables:
- metricas de trafico y conversion;
- feedback de clientes;
- mejoras de producto;
- automatizaciones adicionales;
- nuevas integraciones justificadas;
- preparacion del segundo drop.

Criterio de cierre:
La marca aprende del primer ciclo de venta y mejora con base operativa real.
