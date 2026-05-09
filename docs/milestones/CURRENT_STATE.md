# CURRENT_STATE

Fecha de referencia:

- 2026-05-09

## Ultimo milestone completado

- `01_PROJECT_STRUCTURE_AND_RULES`
- Estado: completado con sobre-alcance
- Referencia: [01-status.md](C:/Users/Manuel/PROJECTS/airline-33/docs/milestones/01-status.md)

## Milestone en curso

- Transicion entre `01_PROJECT_STRUCTURE_AND_RULES` y `02_RUFLO_AGENT_ORCHESTRATION`

Estado real:

- la estructura base del repo ya existe;
- la politica de trabajo para Codex ya existe;
- los agentes de AIRLINE 33 ya estan copiados a `.ai/agents/`;
- el repo ya tiene tambien avances de importacion desde `A33.xlsx`, seeds y scaffolding de datos que exceden el milestone 01.

## Siguiente milestone recomendado

- `02_RUFLO_AGENT_ORCHESTRATION`

Motivo:

- hay que cerrar la separacion operativa entre AIRLINE 33 y el legado de Ruflo/Claude Flow;
- siguen presentes `.claude`, `.claude-flow`, `.swarm`, `.mcp.json` y `CLAUDE.md` como capa heredada;
- antes de avanzar fuerte con backend, Supabase y automatizaciones conviene fijar la politica de orquestacion y saneamiento del legado.

## Archivos clave modificados

### Ya comiteados en el ultimo bloque

- [CODEX.md](C:/Users/Manuel/PROJECTS/airline-33/CODEX.md)
- [AGENTS.md](C:/Users/Manuel/PROJECTS/airline-33/AGENTS.md)
- [.gitignore](C:/Users/Manuel/PROJECTS/airline-33/.gitignore)
- [docs/architecture/overview.md](C:/Users/Manuel/PROJECTS/airline-33/docs/architecture/overview.md)
- [docs/architecture/decisions/ADR-001-use-supabase-as-source-of-truth.md](C:/Users/Manuel/PROJECTS/airline-33/docs/architecture/decisions/ADR-001-use-supabase-as-source-of-truth.md)
- [docs/architecture/decisions/ADR-002-use-n8n-for-automations.md](C:/Users/Manuel/PROJECTS/airline-33/docs/architecture/decisions/ADR-002-use-n8n-for-automations.md)
- [docs/architecture/decisions/ADR-003-use-ruflo-as-external-orchestration-layer.md](C:/Users/Manuel/PROJECTS/airline-33/docs/architecture/decisions/ADR-003-use-ruflo-as-external-orchestration-layer.md)
- [docs/ruflo/ruflo-local-usage.md](C:/Users/Manuel/PROJECTS/airline-33/docs/ruflo/ruflo-local-usage.md)
- [docs/ruflo/airline33-agent-map.md](C:/Users/Manuel/PROJECTS/airline-33/docs/ruflo/airline33-agent-map.md)
- [docs/ruflo/workflow-policy.md](C:/Users/Manuel/PROJECTS/airline-33/docs/ruflo/workflow-policy.md)
- [supabase/migrations/20260509_001_initial_schema.sql](C:/Users/Manuel/PROJECTS/airline-33/supabase/migrations/20260509_001_initial_schema.sql)
- [.ai/agents/](C:/Users/Manuel/PROJECTS/airline-33/.ai/agents)

### Pendientes de commit en la working tree

- [README.md](C:/Users/Manuel/PROJECTS/airline-33/README.md)
- [docs/milestones/01-status.md](C:/Users/Manuel/PROJECTS/airline-33/docs/milestones/01-status.md)
- [operations/excel/imports/](C:/Users/Manuel/PROJECTS/airline-33/operations/excel/imports)
- [operations/excel/templates/](C:/Users/Manuel/PROJECTS/airline-33/operations/excel/templates)
- [scripts/import-a33-excel/export-a33-key-sheets.ps1](C:/Users/Manuel/PROJECTS/airline-33/scripts/import-a33-excel/export-a33-key-sheets.ps1)
- [scripts/import-a33-excel/build-drop-catalog-draft.ps1](C:/Users/Manuel/PROJECTS/airline-33/scripts/import-a33-excel/build-drop-catalog-draft.ps1)
- [scripts/import-a33-excel/build-customers-draft-template.ps1](C:/Users/Manuel/PROJECTS/airline-33/scripts/import-a33-excel/build-customers-draft-template.ps1)
- [scripts/import-a33-excel/split-catalog-draft-to-templates.ps1](C:/Users/Manuel/PROJECTS/airline-33/scripts/import-a33-excel/split-catalog-draft-to-templates.ps1)
- [supabase/seed/README.md](C:/Users/Manuel/PROJECTS/airline-33/supabase/seed/README.md)

## Decisiones tomadas

- `Supabase` es la fuente de verdad operativa.
- `n8n` es el motor principal de automatizacion.
- `Excel` y `Google Sheets` quedan para historico, importacion controlada y reporting.
- `Ruflo` se trata como herramienta externa y capa de referencia, no como dependencia interna del producto.
- Los agentes propios de AIRLINE 33 viven ya en `.ai/agents/`.
- El milestone 01 se considera cerrado a nivel estructural, aunque el repo tiene trabajo adelantado de bloques posteriores.

## Checks ejecutados

- lectura de `context.md`, `CODEX.md`, `AGENTS.md` y `docs/milestones/01_PROJECT_STRUCTURE_AND_RULES.md`
- verificacion de estructura base del repo
- verificacion de copia de agentes desde `.claude/agents/custom/airline-33/` a `.ai/agents/`
- verificacion de `.gitignore`
- verificacion de `git status --short`
- validacion del workbook:
  - `powershell -ExecutionPolicy Bypass -File .\scripts\validate-data\validate-a33-structure.ps1`
- export de hojas clave de `A33.xlsx`
- generacion de borradores CSV para drops, products, skus y customers
- revision con agentes:
  - `airline-33-orchestrator`
  - `security-agent`
  - `git-agent`

## Riesgos pendientes

- siguen trackeados artefactos heredados de `.claude`, `.claude-flow` y `.swarm`
- `.mcp.json` sigue apuntando a `npx ruflo@latest`
- `.claude/settings.json` mantiene hooks y permisos heredados
- los CSV de `operations/excel/imports/` pueden contener datos que no convenga commitear o empujar sin revisar
- `customers-draft.csv` puede incluir datos personales historicos
- el repo tiene mezcla entre milestone 01 y trabajo adelantado de importacion

## Estado Git actual

Ultimo commit:

- `7b640b7 feat: align repo structure and bootstrap data migration foundation`

Cambios pendientes de commit:

- `README.md`
- `AGENTS.md`
- `docs/milestones/`
- `operations/excel/imports/`
- `operations/excel/templates/`
- `scripts/import-a33-excel/`
- `supabase/seed/`

## Comandos utiles para continuar

### Revisar estado

```powershell
git status --short
git log --oneline -5
Get-ChildItem docs\milestones
```

### Revisar milestone actual y siguiente

```powershell
Get-Content .\docs\milestones\01_PROJECT_STRUCTURE_AND_RULES.md
Get-Content .\docs\milestones\02_RUFLO_AGENT_ORCHESTRATION.md
Get-Content .\docs\milestones\01-status.md
```

### Revisar imports de Excel

```powershell
Get-ChildItem .\operations\excel\imports -Recurse
Get-Content .\operations\excel\imports\catalog-drop-draft.csv
Get-Content .\operations\excel\imports\products-draft.csv
Get-Content .\operations\excel\imports\customers-draft.csv
```

### Regenerar exports desde A33

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\import-a33-excel\export-a33-key-sheets.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\import-a33-excel\build-drop-catalog-draft.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\import-a33-excel\build-customers-draft-template.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\import-a33-excel\split-catalog-draft-to-templates.ps1
```

### Revisar base de datos

```powershell
Get-Content .\supabase\migrations\20260509_001_initial_schema.sql
Get-Content .\supabase\seed\README.md
```

### Commit recomendado del bloque pendiente

```powershell
git add README.md AGENTS.md docs\milestones operations\excel\imports operations\excel\templates scripts\import-a33-excel supabase\seed
git commit -m "docs: close milestone 01 and add A33 import scaffolding"
git push origin main
```

## Nota para una nueva sesion

No asumir que el siguiente paso es backend o migraciones. Primero decidir:

1. si se cierra formalmente `02_RUFLO_AGENT_ORCHESTRATION`;
2. si los CSV crudos y `customers-draft.csv` deben versionarse o excluirse;
3. si se hace un bloque especifico de saneamiento del legado `.claude` / `.claude-flow` / `.swarm`.
