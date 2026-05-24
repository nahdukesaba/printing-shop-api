$envFile = Get-Content .env

foreach ($line in $envFile) {
    if ($line -match "^\s*#") { continue }
    if ($line -match "^\s*$") { continue }

    $parts = $line -split '=', 2
    [System.Environment]::SetEnvironmentVariable($parts[0], $parts[1])
}

Write-Host "Running migrations..."
goose -dir migrations postgres $env:MIGRATION_DB_URL up

Write-Host "Running seeds..."
psql $env:MIGRATION_DB_URL -f seeds/seed.sql

Write-Host "Generating sqlc..."
sqlc generate

Write-Host "Setup completed."