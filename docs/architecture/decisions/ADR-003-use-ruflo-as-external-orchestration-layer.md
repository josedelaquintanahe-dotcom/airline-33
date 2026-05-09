# ADR-003 Use Ruflo as External Orchestration Layer

## Estado

Aprobado

## Contexto

El proyecto hereda configuracion, agentes, memoria y artefactos de Ruflo/Claude Flow dentro del repo, pero AIRLINE 33 no debe depender de runtime, swarm state o memoria interna de esa herramienta para operar.

## Decision

Usar `Ruflo` solo como capa externa de orquestacion y como referencia de patrones, manteniendo AIRLINE 33 desacoplado de su codigo fuente y de su estado interno.

## Consecuencias

- Los agentes propios de AIRLINE 33 se copian a `.ai/agents`.
- El runtime heredado `.claude`, `.claude-flow` y `.swarm` no se elimina todavia, pero queda identificado como deuda de limpieza.
- La arquitectura del negocio no debe depender de memoria, metricas ni estado interno de Ruflo.
- Cualquier integracion futura con Ruflo debe ser controlada y confirmada por una persona.

## Alternativas descartadas

- integrar Ruflo como dependencia interna del producto;
- usar memoria o estado de swarm como parte del sistema operativo de AIRLINE 33;
- mezclar instrucciones de herramienta y logica del negocio sin separacion documental.
