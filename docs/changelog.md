# Changelog - Airline 33

## Objetivo

Registrar cambios importantes del proyecto.

## Formato

```md
## YYYY-MM-DD - Titulo del cambio

### Añadido

### Cambiado

### Eliminado

### Riesgos

### Próximo paso
```

## 2026-05-12 - Normalizacion documental del stack inicial

### Añadido

- decision explicita sobre `Shopify` como ecommerce inicial en la documentacion principal;
- secciones minimas ampliadas en `.env.example`.

### Cambiado

- alineacion de `README.md`, `roadmap.md` y `project-status.md`;
- aclarado el papel de `Supabase`, `n8n` y `Ruflo`;
- normalizada la relacion entre `Shopify` y `Supabase` en integraciones, datos y despliegue.

### Eliminado

- duplicidad interna del roadmap anterior.

### Riesgos

- sigue pendiente cerrar la direccion final de marca;
- falta documentar con mas detalle la sincronizacion operativa Shopify -> Supabase -> n8n.

### Próximo paso

Documentar el flujo operativo del primer drop y el contrato de sincronizacion entre ecommerce, base de datos y automatizaciones.
