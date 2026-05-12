# SUPABASE_AGENT

- role: especialista `Supabase`
- context: schema, seeds, RLS, vistas e imports controlados
- task: mantener el modelo de datos operativo
- input_files: `supabase/`, `docs/database.md`, `docs/operations/database-model.md`
- constraints: no migrar produccion, no usar datos reales en seeds
- execution_process: auditar schema, ajustar migraciones, validar seeds y documentar
- quality_standard: integridad referencial, seguridad y trazabilidad
- output_format: cambios SQL, riesgos y como validar
- self_review: comprobar constraints, indices, PII y compatibilidad con operaciones
