# Decisiones - Airline 33

## Objetivo

Registrar decisiones importantes para que Codex, Ruflo y futuros agentes no repitan debates ya cerrados.

## Formato de decision

```md
## DEC-000 - Titulo

Fecha:
Estado: propuesta / aceptada / rechazada / reemplazada

### Contexto

### Opciones consideradas

### Decision

### Motivo

### Consecuencias

### Archivos afectados
```

## DEC-001 - Shopify como ecommerce inicial

Fecha: 2026-05-12
Estado: aceptada

### Contexto

La documentacion raiz mezclaba varias opciones de ecommerce y dejaba abierta una decision que el objetivo actual del proyecto ya considera cerrada para la primera fase.

### Opciones consideradas

- Shopify como ecommerce inicial.
- Web propia con checkout custom desde el inicio.
- Solucion hibrida sin decision explicita.

### Decision

Usar `Shopify` como ecommerce inicial de Airline 33.

### Motivo

Permite lanzar antes, reducir complejidad inicial y separar la velocidad comercial del desarrollo de la capa operativa interna.

### Consecuencias

- `Shopify` gestiona la primera superficie de venta.
- `Supabase` queda como capa operativa complementaria, no como sustituto del storefront.
- `n8n` sincroniza eventos entre sistemas.

### Archivos afectados

- `README.md`
- `roadmap.md`
- `project-status.md`
- `docs/integrations.md`
- `integrations/shopify.md`
- `docs/database.md`
- `docs/deployment.md`
