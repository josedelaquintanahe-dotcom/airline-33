# Testing - Airline 33

## Objetivo

Definir como se probara Airline 33 antes de vender.

## Principio principal

No se debe lanzar un drop sin probar el flujo completo.

## Tipos de prueba

### Pruebas visuales

Comprobar:

- home;
- producto;
- carrito;
- checkout o handoff al checkout;
- mobile;
- animaciones;
- tipografias;
- imagenes;
- consistencia de marca.

### Pruebas funcionales

Comprobar:

- captura de leads;
- listado de productos;
- detalle de producto;
- stock;
- pedido;
- confirmacion;
- automatizaciones;
- emails.

### Pruebas de seguridad

Comprobar:

- `.env` no versionado;
- no hay claves en frontend;
- webhooks protegidos;
- RLS configurado;
- errores no exponen datos.

### Pruebas de negocio

Comprobar:

- el usuario entiende la marca;
- el producto parece deseable;
- el precio es claro;
- la compra es sencilla;
- el drop se entiende;
- la newsletter funciona.

## Checklist MVP

Antes de lanzar:

- [ ] Home clara.
- [ ] Producto visible.
- [ ] Mobile correcto.
- [ ] Lead guardado.
- [ ] Pedido o intencion de compra registrada.
- [ ] Automatizacion activada.
- [ ] Email o notificacion enviada.
- [ ] Stock actualizado.
- [ ] Sin errores criticos.
- [ ] Sin secretos expuestos.

## Criterio de cierre

El sistema esta listo para trafico real cuando una persona puede descubrir la marca, ver un producto, registrarse o comprar sin ayuda externa.
