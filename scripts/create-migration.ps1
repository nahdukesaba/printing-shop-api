param(
    [string]$name
)

Write-Host "usage: .\scripts\create-migration.ps1 create_categories_table"
goose -dir migrations create $name sql