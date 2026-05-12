# Arquitectura - Airline 33

## Objetivo

Definir la arquitectura inicial de Airline 33 para soportar marca, ecommerce, catalogo, clientes, pedidos, inventario, drops y automatizaciones sin sobredimensionar el MVP.

## Principio principal

La arquitectura debe optimizar velocidad de salida y control operativo.

## Capas del sistema

```txt
Shopify Storefront / Checkout
            |
            v
Backend / Integrations Layer
            |
            v
Supabase Operational Data
            |
            v
n8n Automations
            |
            v
External Integrations
```

## Decisiones base

- `Shopify` es el ecommerce inicial.
- `Supabase` es la fuente de verdad operativa complementaria.
- `n8n` sincroniza y automatiza procesos.
- `Ruflo` coordina agentes como capa externa.
- `GitHub` mantiene versionado y trazabilidad.

## Reglas

1. `Shopify` no debe convertirse en la unica capa de datos internos.
2. `Supabase` no debe asumir el rol de storefront inicial.
3. `n8n` no debe esconder logica critica que necesite auditabilidad.
4. Ningun runtime de `Ruflo` o legado `.claude` debe gobernar la operacion del negocio.
