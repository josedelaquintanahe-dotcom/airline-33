# Seguridad - Airline 33

## Principios

- no guardar claves reales en el repo
- no exponer PII real en docs, seeds o payloads
- proteger webhooks y automatizaciones
- mantener permisos minimos
- separar claramente local, staging y produccion

## Riesgos prioritarios

- tokens de `Shopify`, `Supabase`, `n8n`, `GitHub` y `OpenAI`
- pedidos y datos de clientes
- webhooks sin firma o sin idempotencia
- automatizaciones que escriban varias veces el mismo evento

## Reglas

1. Usar `.env` local y `.env.example` como plantilla vacia.
2. No subir secretos a `.md`, JSON de ejemplo, exports ni seeds.
3. Revisar firma y origen de webhooks.
4. Registrar errores sin guardar datos innecesarios.
5. Mantener la IA como apoyo, no como acceso directo sin control a sistemas criticos.

## Checklist minimo antes de vender

- politicas legales preparadas
- secretos fuera de repo
- permisos revisados
- webhooks protegidos
- datos de prueba sin PII real
