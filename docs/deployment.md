# Deployment - Airline 33

## Objetivo

Desplegar solo lo necesario para vender `Drop 001` y medir el relanzamiento.

## Prioridad de despliegue

1. Tienda `Shopify`
2. Captacion de email
3. Automatizaciones `n8n`
4. Base complementaria en `Supabase`
5. Reporting minimo

## Regla

No levantar infraestructura propia compleja si `Shopify` resuelve la venta inicial.

## Entornos

- local: documentacion, payloads, pruebas controladas
- test: webhooks y automatizaciones sin datos reales
- produccion: tienda, automatizaciones activas y reporting minimo

## Criterio de salida

El sistema esta listo cuando:

- la tienda puede publicar `Drop 001`
- el pedido entra y se registra
- existe alerta de stock bajo
- se captan emails
- hay reporting basico post-drop
