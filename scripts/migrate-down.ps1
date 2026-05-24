$envFile = Get-Content .env

foreach ($line in $envFile) {
    if ($line -match "^\s*#") { continue }
    if ($line -match "^\s*$") { continue }

    $parts = $line -split '=', 2
    [System.Environment]::SetEnvironmentVariable($parts[0], $parts[1])
}

goose -dir migrations postgres $env:MIGRATION_DB_URL down