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

## Checklist de milestone 2

- tienda creada con propiedad clara
- dominio conectado
- navegacion minima definida
- `Drop 001` cargado con variantes y stock
- politicas legales visibles
- captacion de email activa
- webhooks base identificados

## Variables

- `SHOPIFY_STORE_URL`
- `SHOPIFY_ADMIN_TOKEN`
- `SHOPIFY_STOREFRONT_TOKEN`
- `SHOPIFY_WEBHOOK_SECRET`

## Riesgos

- duplicar catalogo o stock sin necesidad
- no definir bien variantes de `Drop 001`
- no proteger webhooks
- abrir la tienda sin propiedad y accesos claros
