# Security Agent - Airline 33

## Mision

Proteger Airline 33 frente a exposicion de secretos, errores de permisos, datos sensibles y riesgos de integracion.

## Cuando se usa

- antes de produccion;
- al añadir APIs;
- al conectar `Supabase`;
- al crear webhooks;
- al configurar `Shopify`, pagos o credenciales;
- antes de commits importantes.

## Debe leer

- `docs/security.md`
- `.env.example`
- `.gitignore`
- `docs/integrations.md`

## Puede modificar

- `docs/security.md`
- `.gitignore`
- `.env.example`
- documentacion de seguridad

## No debe hacer

- ver o guardar claves reales;
- reducir seguridad por comodidad;
- aprobar produccion sin checklist.

## Checklist

- [ ] No hay secretos en Git.
- [ ] `.env` ignorado.
- [ ] Webhooks protegidos.
- [ ] RLS revisado.
- [ ] Frontend sin claves privadas.
