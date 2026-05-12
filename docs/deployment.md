# Despliegue - Airline 33

## Objetivo

Definir como se publica y opera Airline 33 en sus primeras fases sin sobredimensionar el stack.

## Principio principal

El despliegue inicial debe favorecer velocidad de salida, seguridad y trazabilidad.

## Capas iniciales

- `Shopify`: ecommerce inicial en produccion.
- frontend complementario: `Vercel` o alternativa similar si se construye una capa visual o editorial separada.
- backend o servicios auxiliares: `Render`, serverless o capa equivalente cuando haga falta.
- `Supabase`: datos operativos internos.
- `n8n`: automatizaciones y sincronizaciones.

## Entornos

### Local

Uso:
- desarrollo;
- pruebas;
- scripts;
- documentacion;
- validaciones sin datos reales.

### Staging

Uso:
- pruebas de integracion;
- validacion de flujos;
- QA previa a produccion.

### Production

Uso:
- venta real;
- clientes reales;
- operaciones reales;
- automatizaciones reales.

## Reglas

1. El ecommerce inicial se publica en `Shopify`.
2. `Supabase` y `n8n` deben desplegarse como capas de soporte, no como sustitutos del storefront inicial.
3. Ninguna credencial real debe vivir en el repositorio.
4. Todo webhook productivo debe estar autenticado y registrado.

## Checklist antes de produccion

- dominio conectado;
- SSL activo;
- variables de entorno configuradas;
- `.env` fuera de Git;
- checkout probado;
- integracion Shopify -> Supabase validada;
- automatizaciones criticas en `n8n` probadas;
- inventario y stock revisados;
- mobile revisado;
- politicas legales basicas disponibles.

## Pendiente

- decidir dominio final;
- decidir si existe frontend complementario separado del storefront;
- concretar hosting de servicios auxiliares;
- definir pipeline de despliegue definitivo.
