# Seguridad - Airline 33

## Objetivo

Proteger el proyecto, las claves, los datos de clientes, los pagos, los webhooks y las integraciones.

## Principio principal

Airline 33 debe tratarse como un negocio real desde el primer dia.

## Secretos

Nunca versionar:

- `.env`
- tokens
- API keys
- claves privadas
- service role keys
- webhook secrets
- credenciales de `n8n`
- claves de pagos
- tokens de GitHub

Usar siempre:

- `.env` local;
- `.env.example` sin valores reales;
- variables de entorno en Vercel, Render, Supabase, Shopify y `n8n`.

## Datos sensibles

Datos a proteger:

- email de cliente;
- telefono;
- direccion;
- pedidos;
- informacion de pago;
- historial de compra.

No almacenar:

- numeros completos de tarjeta;
- CVV;
- secretos de proveedores;
- datos innecesarios;
- exportaciones historicas con PII real en seeds o ejemplos.

## Supabase

Reglas:

1. Activar RLS en tablas sensibles.
2. No usar service role key en frontend.
3. Separar anon key y service role key.
4. Documentar policies.
5. Revisar permisos antes de produccion.

## n8n

Reglas:

1. Proteger webhooks con secreto o autenticacion equivalente.
2. No guardar claves en nodos sin credenciales seguras.
3. Documentar workflows.
4. Evitar exponer endpoints sin validacion.
5. Registrar errores relevantes.

## Backend

Reglas:

1. Validar inputs.
2. Sanitizar datos.
3. Limitar exposicion de errores.
4. Proteger endpoints privados.
5. Usar variables de entorno.
6. Verificar CORS.

## Frontend

Reglas:

1. No incluir claves privadas.
2. No exponer logica sensible.
3. No confiar en validacion solo del cliente.
4. Revisar formularios y capturas de leads.

## Git

Antes de cada commit importante:

```powershell
git status
git diff
```
