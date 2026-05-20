# n8n Minimum Automations - Airline 33

## Objetivo

Documentar las automatizaciones minimas necesarias para operar `Drop 001` sin procesos manuales opacos.

## Automatizacion 1 - Nuevo lead

- trigger: nuevo formulario o suscripcion
- entrada: email y origen
- acciones:
  - validar formato
  - evitar duplicado
  - guardar en `Supabase`
  - confirmar registro si aplica

Payload de referencia:

- `automations/payloads/lead-capture.example.json`

## Automatizacion 2 - Nuevo pedido

- trigger: webhook de `Shopify`
- entrada: pedido confirmado
- acciones:
  - verificar firma
  - deduplicar evento
  - guardar resumen en `Supabase`
  - disparar seguimiento interno

Payload de referencia:

- `automations/payloads/shopify-order-created.example.json`

## Automatizacion 3 - Stock bajo

- trigger: stock igual o inferior al umbral definido
- acciones:
  - registrar alerta
  - notificar a operacion
  - marcar riesgo de sold out

Payload de referencia:

- `automations/payloads/low-stock-alert.example.json`

## Umbrales iniciales sugeridos

- por talla: alerta al quedar `2` unidades
- por producto: alerta al quedar `5` unidades

## Datos minimos a registrar

- `lead_id` o `order_id`
- origen
- marca temporal
- estado del workflow
- resultado o error resumido

## Reglas de seguridad

- firma de webhook obligatoria
- idempotencia obligatoria
- sin credenciales reales en docs o payloads
