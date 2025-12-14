---
description: Add a new application to tipi-store with guided workflow
---

# Add New Application to tipi-store

Guide user through adding a new application following all tipi-store requirements.

## Process

### Step 1: Gather Information

Ask user for:
- **Application name** (e.g., "Paperless-AI")
- **Official GitHub/documentation URL**

### Step 2: Research Phase (CRITICAL - Don't Skip!)

**Before creating ANY files, verify:**

1. **Docker Image**
   ```bash
   # Check for ghcr.io image (prefer over Docker Hub)
   docker manifest inspect ghcr.io/owner/app:tag

   # Note exact tag format (keep 'v' prefix if present)
   # Example: v1.1.3 NOT 1.1.3 if that's the actual tag
   ```

2. **Source Repository Analysis**
   - Read README.md completely
   - Examine `docker-compose.yml` (note ALL env vars)
   - Check `.env.example` (comprehensive variable list)
   - Check wiki/docs for features (webhooks, API, integrations)

3. **PUID/PGID Verification**
   - Check original docker-compose.yml for PUID/PGID variables
   - Add uid/gid to config.json ONLY if supported

4. **Variable Planning**
   - List ALL configurable variables
   - **ALL MUST be prefixed**: `APPNAME_*`

### Step 3: Create Files

#### A. Create Structure
```bash
mkdir -p apps/[app-name]/metadata
```

#### B. Create config.json

**Template (minimal)**:
```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description of functionality and purpose.",
  "version": "1.0.0",
  "tipi_version": 1,
  "short_desc": "4-5 words max only",
  "author": "OriginalAuthor",
  "source": "https://github.com/owner/repo",
  "website": "https://example.com",
  "categories": ["utilities"],
  "form_fields": [],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1700000000000,
  "updated_at": 1700000000000
}
```

**With form fields**:
```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description.",
  "version": "1.0.0",
  "tipi_version": 1,
  "short_desc": "Max 5 words here",
  "author": "OriginalAuthor",
  "source": "https://github.com/owner/repo",
  "website": "https://example.com",
  "categories": ["utilities"],
  "form_fields": [
    {
      "type": "text",
      "label": "Application URL",
      "hint": "Full URL where this app will be accessible (e.g., https://app.yourdomain.com). Leave empty for auto-detection.",
      "required": false,
      "env_variable": "APPNAME_APP_URL",
      "placeholder": "https://app.yourdomain.com"
    },
    {
      "type": "random",
      "label": "Database Password",
      "hint": "Secure password for database. Auto-generated if not set.",
      "required": true,
      "encoding": "hex",
      "env_variable": "APPNAME_DB_PASSWORD"
    },
    {
      "type": "boolean",
      "label": "Enable Debug Mode",
      "hint": "Enable detailed logging for troubleshooting. Only enable if experiencing issues.",
      "required": false,
      "default": false,
      "env_variable": "APPNAME_DEBUG_MODE"
    }
  ],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1700000000000,
  "updated_at": 1700000000000
}
```

**Critical requirements**:
- Schema v2 property order (see instructions.md)
- `tipi_version: 1`
- ALL `env_variable` prefixed: `APPNAME_*`
- Every form_field has `hint`
- `short_desc` ≤ 5 words
- Native types: `true`, `false`, `8` (not `"true"`, `"8"`)
- Current timestamps from https://currentmillis.com

#### C. Create docker-compose.json

**Template (simple)**:
```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "APP_URL",
          "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

**With PUID/PGID**:
```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "PUID",
          "value": "1000"
        },
        {
          "key": "PGID",
          "value": "1000"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

**Critical requirements**:
- Array format: `"services": [...]`
- Main service: `"isMain": true` + `"internalPort"`
- Variables: `${VARIABLE}` (NOT `{{VARIABLE}}`)
- Version matches config.json EXACTLY
- PUID/PGID hardcoded `"1000"` if applicable

#### D. Create metadata/description.md

**Template**:
```markdown
# AppName

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/owner/repo) [<img src="https://img.shields.io/github/issues/owner/repo?color=7842f5">](https://github.com/owner/repo/issues)

Brief one-sentence description of what the app does.

---

## 📖 SYNOPSIS

Detailed overview of functionality and purpose. Explain what the app does and who it's for.

---

## ✨ MAIN FEATURES

- **Feature 1**: Description
- **Feature 2**: Description
- **Feature 3**: Description

---

## 🐳 DOCKER IMAGE DETAILS

- **Based on [owner/repo](https://github.com/owner/repo)**
- Docker image: `ghcr.io/owner/app:version`
- Supported architectures: `amd64`, `arm64`

---

## 📁 VOLUMES

| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `${APP_DATA_DIR}/data` | `/app/data` | Application data |

---

## 📝 ENVIRONMENT

| Variable | Required | Description |
| --- | --- | --- |
| `APPNAME_APP_URL` | No | Full URL (default: auto-detected) |
| `APPNAME_DB_PASSWORD` | Yes | Database password (auto-generated) |
| `TZ` | No | Timezone (auto-detected) |

---

## ⚙️ CONFIGURATION

### First Setup

1. Install through Runtipi
2. Configure environment variables
3. Access at `http://<your-ip>:8080`
4. Complete setup wizard

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For questions or issues, open an issue on the official GitHub repository.
```

#### E. Download Logo

**Priority**:
1. Check runtipi-appstore first:
   ```bash
   curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg"
   ```

2. If exists (HTTP 200), download:
   ```bash
   curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"
   ```

3. Otherwise, download from official source (< 100KB)

### Step 4: Update READMEs (CRITICAL - OFTEN FORGOTTEN!)

#### A. Update /README.md
- Add app to table (alphabetical order)
- Increment counter (35 → 36)

#### B. Update /apps/README.md
- Add to appropriate category section
- Increment "Total Applications" counter

### Step 5: Validate

```bash
# JSON syntax
cat apps/[app-name]/config.json | jq .
cat apps/[app-name]/docker-compose.json | jq .

# Docker image exists
docker manifest inspect [image:tag]

# VS Code: Check for schema errors (should be 0)
```

**Show user this checklist**:
- [ ] config.json schema v2 property order ✓
- [ ] tipi_version = 1 ✓
- [ ] ALL env_variable prefixed APPNAME_ ✓
- [ ] All form_fields have hint ✓
- [ ] short_desc ≤ 5 words ✓
- [ ] Native types (not strings) ✓
- [ ] docker-compose array format ✓
- [ ] isMain: true on main service ✓
- [ ] Version matches config.json ✓
- [ ] ${} variable syntax ✓
- [ ] description.md standard format ✓
- [ ] Logo valid < 100KB ✓
- [ ] README.md updated ✓
- [ ] apps/README.md updated ✓
- [ ] Docker tag verified ✓

### Step 6: Git Workflow

```bash
# Create feature branch
git checkout -b feat/add-[app-name]

# Stage files
git add apps/[app-name]/ README.md apps/README.md

# Commit
git commit -m "🎉 Added: [app-name] application to tipi-store"

# Push
git push -u origin feat/add-[app-name]
```

### Step 7: Summary

Present to user:
- ✅ Files created: config.json, docker-compose.json, description.md, logo.jpg
- ✅ READMEs updated
- ✅ Validation passed
- ✅ Ready to push and create PR

---

## Form Field Reference

**Text**:
```json
{
  "type": "text",
  "label": "Username",
  "hint": "Username for the app (3-20 characters)",
  "required": true,
  "env_variable": "APPNAME_USERNAME",
  "placeholder": "admin"
}
```

**Password**:
```json
{
  "type": "password",
  "label": "Password",
  "hint": "Secure password (minimum 8 characters)",
  "required": true,
  "env_variable": "APPNAME_PASSWORD"
}
```

**Email**:
```json
{
  "type": "email",
  "label": "Email",
  "hint": "Email for notifications and recovery",
  "required": true,
  "env_variable": "APPNAME_EMAIL",
  "placeholder": "user@example.com"
}
```

**Number**:
```json
{
  "type": "number",
  "label": "Port",
  "hint": "Port number for service (1024-65535)",
  "required": false,
  "default": 8080,
  "min": 1024,
  "max": 65535,
  "env_variable": "APPNAME_PORT"
}
```

**Boolean**:
```json
{
  "type": "boolean",
  "label": "Enable Feature",
  "hint": "Enable for additional functionality",
  "required": false,
  "default": false,
  "env_variable": "APPNAME_ENABLE_FEATURE"
}
```

**Random** (secure passwords):
```json
{
  "type": "random",
  "label": "Secret Key",
  "hint": "Auto-generated secure key for encryption",
  "required": true,
  "encoding": "hex",
  "env_variable": "APPNAME_SECRET_KEY"
}
```

**URL**:
```json
{
  "type": "url",
  "label": "Callback URL",
  "hint": "Full URL for callbacks (must be internet-accessible)",
  "required": false,
  "env_variable": "APPNAME_CALLBACK_URL",
  "placeholder": "https://app.example.com/callback"
}
```

---

## DO / DON'T

### ✅ DO
- Research thoroughly before creating files
- Verify Docker tag with `manifest inspect`
- Prefix ALL env variables with `APPNAME_`
- Add `hint` to every form field
- Use native types (boolean, number)
- Update BOTH README files
- Follow schema v2 property order
- Check PUID/PGID support before adding uid/gid
- Keep short_desc to 4-5 words
- Use `${VARIABLE}` syntax

### ❌ DON'T
- Skip research phase
- Forget to update READMEs
- Use string types for boolean/number
- Forget variable prefixing
- Skip logo download
- Add uid/gid without verifying PUID/PGID
- Use `{{VARIABLE}}` syntax
- Forget to verify Docker tag
- Skip schema validation

---

**Ready! What application would you like to add?**
