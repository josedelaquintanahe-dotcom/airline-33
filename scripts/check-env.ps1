$ErrorActionPreference = "Stop"
$required = @(
  "SUPABASE_URL",
  "SUPABASE_ANON_KEY",
  "N8N_BASE_URL"
)

foreach ($name in $required) {
  if ([string]::IsNullOrWhiteSpace((Get-Item "Env:$name" -ErrorAction SilentlyContinue).Value)) {
    Write-Host "$name: missing"
  } else {
    Write-Host "$name: present"
  }
}
