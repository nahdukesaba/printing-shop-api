Write-Host "Running migrations..."
goose postgres $env:DATABASE_URL up

Write-Host "Running seeds..."
psql $env:DATABASE_URL -f seeds/seed.sql

Write-Host "Setup complete!"