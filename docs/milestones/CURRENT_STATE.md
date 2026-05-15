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
- el repo ya tiene tambien avances de importacion desde workbook historico local, seeds y scaffolding de datos que exceden el milestone 01.

## Siguiente milestone recomendado

- `02_RUFLO_AGENT_ORCHESTRATION`

Motivo:

- hay que cerrar la separacion operativa entre AIRLINE 33 y el legado de Ruflo/Claude Flow;
- siguen presentes `.claude`, `.claude-flow`, `.swarm`, `.mcp.json` y `CLAUDE.md` como capa heredada;
- antes de avanzar fuerte con backend, Supabase y automatizaciones conviene fijar la politica de orquestacion y saneamiento del legado.

## Checks ejecutados

- lectura de `context.md`, `CODEX.md`, `AGENTS.md` y `docs/milestones/01_PROJECT_STRUCTURE_AND_RULES.md`
- verificacion de estructura base del repo
- verificacion de copia de agentes desde `.claude/agents/custom/airline-33/` a `.ai/agents/`
- verificacion de `.gitignore`
- verificacion de `git status --short`
- validacion del workbook mediante parametro o variable local
- export de hojas clave del workbook historico local
- generacion de borradores CSV para drops, products, skus y customers

## Riesgos pendientes

- siguen trackeados artefactos heredados de `.claude`, `.claude-flow` y `.swarm`
- `.mcp.json` sigue apuntando a tooling heredado
- los CSV de `operations/excel/imports/` pueden contener datos que no convenga commitear o empujar sin revisar
- `customers-draft.csv` puede incluir datos personales historicos
- el repo tiene mezcla entre milestone 01 y trabajo adelantado de importacion

## Comandos utiles para continuar

### Revisar estado

```powershell
git status --short
git log --oneline -5
Get-ChildItem docs\milestones
```

### Revisar imports de Excel

```powershell
$env:A33_WORKBOOK_PATH="C:\ruta\local\A33.xlsx"
powershell -ExecutionPolicy Bypass -File .\scripts\validate-data\validate-a33-structure.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\import-a33-excel\export-a33-key-sheets.ps1 -WorkbookPath "C:\ruta\local\A33.xlsx"
```

## Nota para una nueva sesion

No asumir que el siguiente paso es backend o migraciones. Primero decidir:

1. si se cierra formalmente `02_RUFLO_AGENT_ORCHESTRATION`;
2. si los CSV crudos y `customers-draft.csv` deben versionarse o excluirse;
3. si se hace un bloque especifico de saneamiento del legado `.claude` / `.claude-flow` / `.swarm`.
