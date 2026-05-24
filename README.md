# Printing Shop API

Backend service for Printing Shop Website built with:

* Golang
* Fiber
* Supabase PostgreSQL
* Supabase Auth
* Supabase Storage
* sqlc
* goose migrations
* GitHub Actions CI/CD
* Windows + NSSM deployment
* Cloudflare Quick Tunnel

---

# Features

* Customer print request submission
* Upload print files
* Upload payment proof
* Membership pricing support
* Request tracking
* Admin request management
* Request status workflow
* FAQ management
* Testimonials management
* Homepage content management

---

# Tech Stack

| Component         | Technology              |
| ----------------- | ----------------------- |
| Backend Framework | Fiber                   |
| Database          | Supabase PostgreSQL     |
| Authentication    | Supabase Auth           |
| File Storage      | Supabase Storage        |
| Query Generator   | sqlc                    |
| Migration Tool    | goose                   |
| CI/CD             | GitHub Actions          |
| Deployment        | NSSM Windows Service    |
| Public Access     | Cloudflare Quick Tunnel |

---

# Prerequisites

Install these first.

## Required Software

| Software              | Purpose                 |
| --------------------- | ----------------------- |
| Go 1.24+              | Backend runtime         |
| Git                   | Source control          |
| goose                 | Database migrations     |
| sqlc                  | Query generation        |
| NSSM                  | Windows service manager |
| cloudflared           | Public tunnel           |
| GitHub Actions Runner | CI/CD                   |

---

# 1. Install Go

[Go Downloads](https://go.dev/dl/?utm_source=chatgpt.com)

Verify:

```powershell
go version
```

---

# 2. Install goose

```powershell
go install github.com/pressly/goose/v3/cmd/goose@latest
```

Verify:

```powershell
goose -version
```

---

# 3. Install sqlc

```powershell
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
```

Verify:

```powershell
sqlc version
```

---

# 4. Install NSSM

[NSSM Downloads](https://nssm.cc/download?utm_source=chatgpt.com)

Extract somewhere permanent:

```text
D:\Tools\nssm\
```

Add to PATH.

Verify:

```powershell
nssm
```

---

# 5. Install Cloudflared

[Cloudflared Downloads](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/?utm_source=chatgpt.com)

Place executable:

```text
D:\Tools\Cloudflared\
```

Verify:

```powershell
cloudflared --version
```

---

# 6. Clone Repository

```powershell
git clone https://github.com/YOUR_USERNAME/printing-shop-api.git
```

```powershell
cd printing-shop-api
```

---

# 7. Setup Environment Variables

Create:

```text
.env
```

Example:

```env
APP_NAME=Printing Shop API
APP_ENV=development
APP_PORT=3000

DATABASE_URL=postgres://USER:PASSWORD@HOST:PORT/postgres?sslmode=require

SUPABASE_URL=https://YOUR_PROJECT.supabase.co
SUPABASE_ANON_KEY=YOUR_ANON_KEY
SUPABASE_JWT_SECRET=YOUR_JWT_SECRET

SUPABASE_STORAGE_BUCKET=print-files

MAX_UPLOAD_SIZE=52428800
```

---

# IMPORTANT DATABASE NOTE

If your password contains special characters like:

```text
#
@
&
```

URL encode them.

Example:

```text
#
```

becomes:

```text
%23
```

---

# 8. Setup Supabase

Create project:

[Supabase Dashboard](https://supabase.com/dashboard?utm_source=chatgpt.com)

Get:

| Variable    | Location               |
| ----------- | ---------------------- |
| Project URL | Project Settings → API |
| Anon Key    | Project Settings → API |
| JWT Secret  | Project Settings → API |

---

# 9. Install Dependencies

```powershell
go mod tidy
```

---

# 10. Run Database Migrations

IMPORTANT:

Always use:

```powershell
goose -dir migrations postgres $env:DATABASE_URL up
```

DO NOT omit:

```text
-dir migrations
```

otherwise files may generate in wrong folder.

---

# 11. Generate sqlc Queries

```powershell
sqlc generate
```

---

# 12. Run Backend Locally

```powershell
go run ./cmd/api
```

Health check:

```text
http://localhost:3000/api/health
```

Expected:

```json
{
  "success": true
}
```

---

# Upload Flow

Architecture:

```text
Frontend
↓ multipart/form-data
Fiber Backend
↓ temp file
Supabase Storage REST API
↓ save file path in PostgreSQL
```

Supported file types:

* pdf
* png
* jpg
* jpeg
* docx
* doc

Max upload:

```text
50MB
```

---

# Authentication Flow

Architecture:

```text
Frontend login → Supabase Auth
Frontend gets JWT
Frontend sends JWT to Go backend
Go backend validates JWT
```

Backend validates JWT using middleware.

---

# Status Workflow

Allowed statuses:

```text
pending
acknowledged
printing
completed
cancelled
```

---

# Local Development

Run backend:

```powershell
go run ./cmd/api
```

OR build:

```powershell
go build -o app.exe ./cmd/api
```

---

# Important Development Notes

## NEVER RUN PRODUCTION FROM SOURCE FOLDER

Do NOT use:

```text
D:\CodeBase\printing-shop-api\
```

as production runtime.

Windows locks executable files aggressively.

Use separate runtime folder.

---

# Recommended Production Runtime Folder

```text
C:\apps\printing-shop\
```

Contains:

```text
app.exe
.env
storage\
logs\
```

---

# Deployment Guide (Windows)

---

# 1. Create Runtime Folder

```text
C:\apps\printing-shop\
```

Copy:

* `.env`
* `app.exe`

---

# 2. Install NSSM Service

```powershell
nssm install PrintingShopAPI
```

Set:

| Field             | Value                         |
| ----------------- | ----------------------------- |
| Path              | C:\apps\printing-shop\app.exe |
| Startup directory | C:\apps\printing-shop         |

Start service:

```powershell
nssm start PrintingShopAPI
```

Verify:

```powershell
nssm status PrintingShopAPI
```

---

# 3. Setup Cloudflare Quick Tunnel

Run:

```powershell
cloudflared tunnel --url http://localhost:3000
```

You will get:

```text
https://random-name.trycloudflare.com
```

Use this URL in frontend environment variables.

---

# 4. Install GitHub Actions Runner

Create folder:

```text
D:\Tools\actions-runner\
```

Download runner:

[GitHub Actions Runner Downloads](https://github.com/actions/runner/releases?utm_source=chatgpt.com)

Extract.

Configure:

```powershell
.\config.cmd --url https://github.com/YOUR_USERNAME/YOUR_REPO --token YOUR_TOKEN
```

IMPORTANT:
When prompted:

```text
Would you like to run the runner as service?
```

Answer:

```text
Y
```

---

# 5. Fix PowerShell Execution Policy

Run PowerShell as Administrator:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine
```

---

# 6. Change Runner Service Permissions

Open:

```text
Services
```

Find:

```text
actions.runner.*
```

Properties → Log On

Change to:

```text
Local System account
```

Restart service.

---

# GitHub Actions Deployment Workflow

Create:

```text
.github/workflows/deploy.yml
```

Content:

```yaml
name: Deploy

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: self-hosted

    steps:
      - uses: actions/checkout@v4

      - name: Configure Git Safe Directory
        shell: cmd
        run: git config --global --add safe.directory "*"

      - name: Setup Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.24'

      - name: Install dependencies
        shell: cmd
        run: go mod tidy

      - name: Build
        shell: cmd
        run: go build -buildvcs=false -o app.exe ./cmd/api

      - name: Stop service
        continue-on-error: true
        shell: cmd
        run: nssm stop PrintingShopAPI

      - name: Wait for service shutdown
        shell: powershell
        run: Start-Sleep -Seconds 3

      - name: Copy binary
        shell: cmd
        run: copy /Y app.exe C:\apps\printing-shop\app.exe

      - name: Start service
        shell: cmd
        run: nssm start PrintingShopAPI
```

---

# Recommended Project Structure

```text
cmd/
  api/
    main.go

internal/
  config/
  database/
  dto/
  handler/
  middleware/
  repository/
  routes/
  service/
  utils/

migrations/
queries/
sqlc/

storage/
  temp/

scripts/

.env
```

---

# Important Commands

## Create Migration

```powershell
goose -dir migrations create migration_name sql
```

---

## Run Migrations

```powershell
goose -dir migrations postgres $env:DATABASE_URL up
```

---

## Rollback Migration

```powershell
goose -dir migrations postgres $env:DATABASE_URL down
```

---

## Generate sqlc

```powershell
sqlc generate
```

---

# Current API Plan

## Customer Routes

```text
POST   /api/v1/print-requests
GET    /api/v1/my-requests
GET    /api/v1/my-requests/:id
```

## Admin Routes

```text
GET    /api/v1/admin/requests
GET    /api/v1/admin/requests/:id
PATCH  /api/v1/admin/requests/:id/status
```

---

# Important Notes

## File Uploads

Do NOT:

* keep large files in memory

Always:

* save temp file
* upload to Supabase
* delete temp file

---

## Add Pagination Immediately

Use:

```text
?page=1&limit=10
```

---

## Required Middleware

```go
app.Use(recover.New())
app.Use(logger.New())
app.Use(cors.New())
```

---

# MVP Priority Order

1. Authentication middleware
2. Layanan/category CRUD
3. Print request submission
4. Upload flow
5. Admin dashboard APIs
6. Status workflow
7. Pagination/filtering

---

# Production Stack Summary

| Component     | Purpose               |
| ------------- | --------------------- |
| Fiber         | API                   |
| Supabase      | Database/Auth/Storage |
| NSSM          | Windows service       |
| Cloudflared   | Public tunnel         |
| GitHub Runner | CI/CD                 |
