# AIRLINE 33 Agent Map

## Objetivo

Este mapa documenta la capa propia de agentes de AIRLINE 33, separada del runtime interno de Ruflo.

## Agentes

### `airline-33-orchestrator`

Coordina tareas entre dominios, divide trabajo, resuelve dependencias y decide secuencias o paralelizacion. Debe leer `context.md` y `CODEX.md` antes de enrutar.

Responsabilidades:

- clasificar el trabajo por dominio;
- decidir si una tarea es simple, secuencial o paralela;
- pedir revision de `security-agent` cuando toque auth, pagos, webhooks, RLS o datos sensibles;
- pedir cierre de bloque a `git-agent`.

### `backend-agent`

Responsable de API, logica de negocio, contratos de integracion y arquitectura backend escalable para pedidos, clientes, stock y drops.

Responsabilidades:

- contratos backend;
- validacion de reglas de negocio;
- integraciones con Supabase y n8n;
- superficies tecnicas para panel y web.

### `supabase-agent`

Disena esquema, migraciones, constraints, RLS, storage y patrones de acceso a datos alineados con backend y operaciones.

Responsabilidades:

- modelo de datos;
- migraciones SQL;
- vistas operativas;
- politicas de acceso y RLS;
- compatibilidad con imports y automatizaciones.

### `n8n-automation-agent`

Disena workflows, webhooks, reintentos, notificaciones y automatizaciones auditables para reducir trabajo manual.

Responsabilidades:

- flujos de venta, stock, costes y reporting;
- definicion de payloads y triggers;
- manejo de errores e idempotencia;
- coordinacion con backend, Supabase y operaciones.

### `frontend-agent`

Implementa la experiencia web en React y traduce visual + copy + contratos tecnicos a una UI consistente y util.

Responsabilidades:

- interfaces web y panel;
- integracion con backend y Supabase;
- estados de UI y journeys de compra;
- coherencia entre visual y copy.

### `crm-inventory-agent`

Define reglas operativas de clientes, stock, reservas, exclusividad, estados y dashboards internos sin inflar el sistema.

Responsabilidades:

- estados de clientes;
- reglas de stock e inventario;
- pedidos, reservas, devoluciones y comunidad;
- definicion de dashboards y campos operativos.

### `brand-strategist`

Define posicionamiento, tension de marca, direccion estrategica y narrativa de lanzamiento. Debe trabajar las dos rutas de identidad cuando siga abierta la decision House vs Dark techno.

Responsabilidades:

- narrativa de marca;
- tension House vs Dark techno;
- estrategia de drops;
- guardrails de tono y posicionamiento.

### `content-calendar-agent`

Planifica cadencia de contenido, secuencia editorial, drops y tiempos de campana de forma realista para el equipo y presupuesto actual.

Responsabilidades:

- secuencia editorial;
- calendarios de lanzamiento;
- relacion entre contenido, comunidad y conversion;
- volumen realista de ejecucion.

### `git-agent`

Prepara cierres de bloque, higiene de commits, recomendacion de push y agrupacion coherente de cambios sin reescribir historia ajena.

Responsabilidades:

- preparar mensajes de commit;
- agrupar cambios por bloque;
- vigilar mezcla con trabajo no relacionado;
- proponer push y checkpoints.

### `security-agent`

Revisa auth, secretos, politicas, webhooks, RLS y tratamiento de datos sensibles. Debe intervenir en cambios con riesgo real.

Responsabilidades:

- revisar riesgos de seguridad;
- validar limites de permisos;
- detectar mezcla peligrosa con tooling externo;
- bloquear defaults inseguros.

### `streetwear-copywriter`

Escribe copy de web, producto, drops, email y CRM con tono selectivo, directo y no generico.

Responsabilidades:

- copy de producto, drop, email y web;
- adaptacion de tono por canal;
- soporte a CRM y automatizaciones;
- consistencia con estrategia y visual.

### `visual-identity-agent`

Define direccion visual, paletas, tipografia, tension estetica y guias listas para handoff a frontend.

Responsabilidades:

- sistema visual;
- rutas esteticas de marca;
- handoff a frontend;
- apoyo visual a contenido y campañas.

## Relacion entre agentes

- El orquestador decide ruta y dependencias.
- `brand-strategist`, `streetwear-copywriter` y `visual-identity-agent` cubren la capa de marca.
- `backend-agent`, `supabase-agent`, `n8n-automation-agent` y `security-agent` cubren la capa tecnica.
- `crm-inventory-agent` conecta operacion con implementacion.
- `git-agent` cierra bloques y prepara hitos del repo.

## Ubicacion operativa

La copia activa y limpia para AIRLINE 33 queda en:

- `.ai/agents/`

La fuente heredada original sigue existiendo temporalmente en:

- `.claude/agents/custom/airline-33/`
