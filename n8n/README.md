# n8n - Airline 33

## Objetivo

Automatizar procesos operativos y comerciales de Airline 33.

## Automatizaciones prioritarias

1. Nuevo lead en newsletter o waitlist.
2. Nuevo pedido sincronizado desde `Shopify`.
3. Alerta de stock bajo.
4. Alta o enriquecimiento de cliente.
5. Lanzamiento de drop.
6. Confirmacion interna.
7. Registro de errores.
8. Sincronizacion con `Supabase` y herramientas auxiliares.

## Reglas

1. Todo workflow debe tener objetivo de negocio.
2. Todo webhook debe estar protegido.
3. Todo workflow debe documentarse.
4. Las credenciales no deben guardarse en archivos.
5. Los exports pueden guardarse en `n8n/workflows/` o en `automations/n8n/workflows/` segun el caso.

## Estructura

```txt
n8n/
- README.md
- credentials.example.md
- workflows/
- exports/
```
