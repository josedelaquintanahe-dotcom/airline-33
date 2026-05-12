# Integraciones - Airline 33

## Objetivo

Centralizar las herramientas externas necesarias para construir, vender y operar Airline 33.

## Principio principal

Cada integracion debe responder a un flujo real de negocio. No se incorporan herramientas por interes teorico.

## Stack de referencia

| Herramienta | Rol principal | Estado | Prioridad |
|---|---|---|---|
| GitHub | Repositorio y control de versiones | Inicial | Alta |
| Ruflo | Orquestacion externa de agentes | Inicial | Alta |
| Shopify | Ecommerce inicial | Definido | Alta |
| Supabase | Base operativa complementaria y fuente de verdad interna | Definido | Alta |
| n8n | Automatizaciones y sincronizaciones | Definido | Alta |
| Vercel | Despliegue de frontend complementario | Pendiente | Media |
| Render | Despliegue backend o servicios auxiliares | Pendiente | Media |
| OpenAI | Soporte IA y trabajo asistido | Pendiente | Media |
| Stripe | Pagos adicionales o futuros flujos fuera de Shopify | Pendiente | Media |
| Holded | Facturacion y gestion futura | Pendiente | Baja |

## Reglas de integracion

1. `Shopify` vende en la primera fase.
2. `Supabase` no reemplaza a `Shopify` como storefront inicial ni checkout.
3. `Supabase` gobierna la operacion interna, trazabilidad y datos complementarios.
4. `n8n` automatiza y sincroniza; no sustituye la logica critica ni la fuente de verdad.
5. `Ruflo` coordina agentes; no se convierte en dependencia del producto.

## Requisito documental

Cada integracion debe tener archivo propio en `integrations/` con:

1. uso dentro de Airline 33;
2. variables de entorno necesarias;
3. pasos de configuracion;
4. prueba minima;
5. riesgos de seguridad;
6. agente responsable;
7. estado actual.
