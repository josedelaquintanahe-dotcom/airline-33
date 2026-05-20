# Domain and Store Ownership - Airline 33

## Objetivo

Cerrar la propiedad de la tienda y del dominio antes de activar el relanzamiento para evitar bloqueos operativos, pagos o accesos difusos.

## Decision operativa

El activo principal del milestone es una tienda `Shopify` con propiedad clara y un dominio propio asociado.

## Checklist de propiedad

- decidir titular legal o cuenta propietaria de `Shopify`
- definir email principal de administracion
- definir email de recuperacion y backup
- activar `2FA` en la cuenta propietaria
- registrar quien tiene acceso admin y con que rol
- documentar quien aprueba pagos, configuracion y contenido

## Checklist de dominio

- confirmar dominio principal de la marca
- confirmar registrador y acceso real al panel
- definir quien mantiene la titularidad
- conectar dominio principal a `Shopify`
- definir subdominios si hacen falta para email o tracking

## Reparto minimo recomendado

- `Jose`: propiedad tecnica y configuracion de la tienda
- `Gonzalo`: validacion operativa y financiera
- `Jacobo`: validacion visual y de contenido visible

## Riesgos a evitar

- tienda creada en una cuenta personal sin control compartido
- dominio sin acceso verificable
- accesos mezclados entre email temporal y cuenta final
- ausencia de `2FA`
