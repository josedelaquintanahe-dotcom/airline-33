# Shopify

## Papel en Airline 33

`Shopify` es el ecommerce inicial y la fuente principal inicial para:

- catalogo publicado
- productos
- variantes
- checkout
- pagos
- pedidos
- clientes compradores
- stock operativo

## Relacion con otras capas

- `Supabase` guarda datos complementarios y reporting propio.
- `n8n` automatiza eventos, alertas y sincronizaciones.

## Estado

Definido como plataforma inicial. Configuracion real pendiente.

## Variables

- `SHOPIFY_STORE_URL`
- `SHOPIFY_ADMIN_TOKEN`
- `SHOPIFY_STOREFRONT_TOKEN`
- `SHOPIFY_WEBHOOK_SECRET`

## Riesgos

- duplicar catalogo o stock sin necesidad
- no definir bien variantes de `Drop 001`
- no proteger webhooks
