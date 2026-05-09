# Ruflo Local Usage

## Posicion en AIRLINE 33

Ruflo vive fuera del proyecto AIRLINE 33 y debe tratarse como herramienta externa de apoyo.

AIRLINE 33 no debe depender internamente del codigo fuente de Ruflo para poder funcionar, desplegarse o evolucionar.

## Que puede hacer Codex con Ruflo

Codex puede usar patrones de Ruflo como referencia para:

- coordinacion entre agentes;
- definicion de roles especializados;
- politicas de handoff;
- patrones de revision antes de commit;
- checklists de seguridad y validacion;
- diseno de workflows operativos.

## Que no debe hacer Codex

- no debe mover logica de producto AIRLINE 33 dentro del repo de Ruflo;
- no debe acoplar el backend, Supabase o n8n a runtime interno de Ruflo;
- no debe tratar memoria, swarm state o metricas de Ruflo como datos del negocio;
- no debe modificar el codigo fuente externo de Ruflo desde este repositorio.

## Dependencia permitida

La dependencia permitida es conceptual y documental:

- patrones;
- convenciones;
- modelos de coordinacion.

La dependencia no permitida es tecnica u operativa:

- imports de codigo fuente de Ruflo;
- uso de bases internas de memoria de Ruflo como parte del sistema;
- acoplamiento a rutas de runtime o archivos de estado.

## Que requiere confirmacion humana

Requiere confirmacion humana explicita:

- mover o borrar `.claude`, `.claude-flow` o `.swarm`;
- reescribir instrucciones heredadas de agentes si afecta al flujo actual del equipo;
- conectar Ruflo a herramientas reales con permisos de escritura;
- cambiar politicas de seguridad o permisos MCP;
- ejecutar acciones que afecten datos reales, pagos o credenciales.
