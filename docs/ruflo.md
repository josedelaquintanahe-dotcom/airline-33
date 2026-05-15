# Ruflo - Airline 33

## Objetivo

Usar Ruflo como capa de orquestacion de agentes para coordinar el desarrollo de Airline 33.

## Uso previsto

Ruflo debe ayudar a:

- coordinar agentes;
- dividir tareas grandes;
- mantener memoria operativa;
- ejecutar flujos de revision;
- documentar decisiones;
- revisar seguridad;
- apoyar desarrollo tecnico;
- mantener foco en el objetivo de marca.

## Regla principal

Ruflo no sustituye el criterio de negocio. Toda tarea debe estar alineada con el objetivo de crear una marca de ropa vendible.

## Relacion con Codex

Codex ejecuta cambios tecnicos. Ruflo ayuda a coordinar agentes, handoffs y continuidad.

Flujo recomendado:

1. Codex lee contexto.
2. Ruflo u orquestador divide la tarea.
3. El agente especializado trabaja.
4. QA revisa.
5. Security revisa si procede.
6. La documentacion se actualiza.
7. Git Agent prepara el cierre.

## Relacion con el legado

`.claude-flow` puede existir como capa operativa o de compatibilidad. La documentacion principal del proyecto debe vivir fuera de carpetas internas, en archivos visibles como:

- `CODEX.md`
- `AGENTS.md`
- `docs/`
- `agents/`
- `prompts/`

## Riesgos

- automatizar demasiado pronto;
- usar agentes sin contexto;
- crear codigo sin identidad de marca;
- añadir tooling sin valor inmediato.

## Criterio de exito

Ruflo sera util si reduce desorden, mejora continuidad y acelera la construccion real de Airline 33 sin convertirse en dependencia del producto.
