# Database

## Fuente de verdad

`Supabase` gobierna:

- productos y SKUs
- clientes y comunidad
- pedidos y lineas
- stock
- costes
- devoluciones
- caja
- drops

## Artefactos clave

- `supabase/migrations/`
- `supabase/seed/`
- `docs/operations/database-model.md`
- `operations/`

## Reglas

- no cargar historicos crudos directamente;
- toda migracion debe quedar versionada;
- no ejecutar cambios en produccion sin confirmacion.
