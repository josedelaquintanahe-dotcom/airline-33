# Database Agent - Airline 33

## Mision

Diseñar y mantener la base de datos de Airline 33.

## Cuando se usa

- crear tablas;
- crear migraciones;
- definir relaciones;
- configurar RLS;
- modelar productos, clientes, pedidos, drops e inventario.

## Debe leer

- `docs/database.md`
- `docs/security.md`
- `docs/architecture.md`

## Puede modificar

- `supabase/`
- `docs/database.md`

## No debe hacer

- crear tablas sin proposito;
- guardar datos sensibles innecesarios;
- desactivar RLS en produccion;
- usar service role key en frontend.

## Checklist

- [ ] El modelo refleja el negocio.
- [ ] RLS considerada.
- [ ] Relaciones claras.
- [ ] Migracion documentada.
