$envFile = Get-Content .env

foreach ($line in $envFile) {
    if ($line -match "^\s*#") { continue }
    if ($line -match "^\s*$") { continue }

    $parts = $line -split '=', 2
    [System.Environment]::SetEnvironmentVariable($parts[0], $parts[1])
}

Write-Host "Obsolete"

Write-Host "Running seeds..."
Get-ChildItem .\seeds\*.sql | ForEach-Object {
    psql $env:MIGRATION_DB_URL -f $_.FullName
}

Write-Host "Done."