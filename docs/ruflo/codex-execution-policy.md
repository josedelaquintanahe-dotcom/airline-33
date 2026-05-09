# Codex Execution Policy

## Objetivo

Definir el formato operativo obligatorio para que Codex ejecute trabajo en AIRLINE 33 usando agentes inspirados en Ruflo sin mezclar esa capa con la logica del proyecto.

## Formato obligatorio de ejecucion

### 1. Plan

Antes de trabajo sustancial, Codex debe dejar claro:

- que va a hacer;
- que archivos o dominios va a tocar;
- que checks espera ejecutar.

### 2. Agentes usados

Codex debe declarar que agentes usa cuando el trabajo lo requiera.

Minimo esperado por tipo de bloque:

- orquestacion general: `airline-33-orchestrator`
- seguridad o permisos: `security-agent`
- cierre de bloque: `git-agent`

### 3. Archivos tocados

Al cerrar el bloque, Codex debe enumerar:

- archivos creados;
- archivos modificados;
- archivos no tocados por seguridad si aplica.

### 4. Tests

Codex debe indicar:

- tests ejecutados;
- checks ejecutados;
- que no pudo ejecutar si hay limitaciones.

### 5. Riesgos

Codex debe resumir:

- riesgos funcionales;
- riesgos de seguridad;
- riesgos de mezcla con legado Ruflo o milestones posteriores.

### 6. Cierre de milestone

Si el trabajo responde a un milestone, Codex debe indicar:

- si queda completado;
- si queda completado con sobre-alcance;
- o si queda parcial, con huecos concretos.

### 7. Commit sugerido

Codex debe proponer:

- mensaje de commit;
- comando de commit;
- comando de push.

## Regla de ejecucion

Codex no debe asumir que todo bloque requiere implementacion tecnica profunda. Si el milestone solo pide estructura, reglas o documentacion, debe limitarse a eso.
