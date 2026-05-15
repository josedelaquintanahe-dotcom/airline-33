# Testing - Airline 33

## Objetivo

Validar que producto, contenido, tienda, automatizaciones y datos minimos funcionan para un lanzamiento pequeno y medible.

## Bloques a probar

- consistencia de marca y mensajes
- configuracion de `Shopify`
- variantes y stock de `Drop 001`
- captacion de emails
- webhooks de pedido
- automatizaciones de stock bajo y reporting
- politicas visibles y flujos basicos de compra

## Pruebas minimas

1. Revisar que el catalogo y las variantes coinciden con `docs/drop-001.md`.
2. Simular un lead nuevo.
3. Simular un pedido nuevo.
4. Validar que `n8n` no duplica el evento.
5. Comprobar que `Supabase` recibe solo el dato complementario esperado.
6. Revisar textos, tono y CTA contra la estrategia de marca.

## No hacer todavia

- suite compleja de e2e si la tienda aun no esta cerrada
- testing de funcionalidades que todavia no existen
