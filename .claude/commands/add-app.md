---
description: Add a new application to tipi-store with guided process
---

# Add New Application to tipi-store

You will help the user add a new application to the tipi-store following all requirements and best practices.

## Process Overview

Follow these steps in order, being thorough at each stage:

### 1. GATHER INFORMATION

Ask the user for:
- **Application name** (e.g., "Paperless-AI", "Beszel")
- **Official documentation/GitHub URL** (to research the app)

### 2. RESEARCH PHASE

**CRITICAL: Do thorough research before creating any files**

1. **Check for GitHub Container Registry (ghcr.io) image**
   - Prefer ghcr.io over Docker Hub
   - Verify tag exists: `docker manifest inspect [image:tag]`
   - Note exact version format (with or without 'v' prefix)

2. **Examine official repository**
   - Read README.md thoroughly
   - Check for docker-compose.yml (note all environment variables)
   - Check for .env.example (comprehensive variable list)
   - Check wiki/docs for features like webhooks, API keys, etc.

3. **Verify PUID/PGID support**
   - Check original docker-compose.yml for PUID/PGID variables
   - Only add uid/gid to config.json if supported

4. **List all configurable variables**
   - From documentation
   - From docker-compose.yml
   - From .env.example
   - **ALL must be prefixed with APPNAME_**

### 3. CREATE FILE STRUCTURE

Create the following files in order:

#### A. Create directory
```bash
mkdir -p apps/[app-name]/metadata
```

#### B. Create config.json

**CRITICAL REQUIREMENTS:**
- Follow schema v2 property order EXACTLY (see checklist)
- `tipi_version: 1` for new app
- ALL `env_variable` prefixed: `APPNAME_*`
- `short_desc`: 4-5 words max (ex: "AI document analyzer")
- Each `form_field` MUST have `hint`
- Use native types: `true`/`false`, `8` (not `"true"`, `"8"`)
- Current timestamps from https://currentmillis.com
- uid/gid ONLY if PUID/PGID supported

**Schema v2 property order:**
1. $schema
2. id
3. available
4. port
5. name
6. description
7. version
8. tipi_version
9. short_desc
10. author
11. source
12. website
13. categories
14. url_suffix (optional)
15. form_fields
16. exposable
17. no_gui (optional)
18. supported_architectures
19. uid (optional)
20. gid (optional)
21. dynamic_config
22. min_tipi_version
23. created_at
24. updated_at

#### C. Create docker-compose.json

**CRITICAL REQUIREMENTS:**
- Array format: `"services": [...]` (NOT object)
- Main service: `"isMain": true`
- Port: `"internalPort": 8080` (NOT addPorts)
- Variables: `"${VARIABLE}"` (NOT `{{VARIABLE}}`)
- Version must EXACTLY match config.json
- PUID/PGID hardcoded `"1000"` if uid/gid in config.json

**Example structure:**
```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "image": "ghcr.io/owner/app:VERSION",
      "name": "app-name",
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
      ],
      "healthCheck": {
        "test": "curl -f http://localhost:8080/health",
        "interval": "30s",
        "timeout": "10s",
        "retries": 3
      }
    }
  ]
}
```

#### D. Create metadata/description.md

Follow standardized format:
```markdown
# APP_NAME

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](GITHUB_URL) [<img src="https://img.shields.io/github/issues/OWNER/REPO?color=7842f5">](GITHUB_ISSUES_URL)

Brief description.

---

## 📖 SYNOPSIS
Detailed overview.

---

## ✨ MAIN FEATURES
- Feature 1
- Feature 2

---

## 🐳 DOCKER IMAGE DETAILS
- **Based on [owner/repo](https://github.com/...)**

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| path | path | description |

---

## 📝 ENVIRONMENT
| Variable | Required | Description |
| --- | --- | --- |
| `VAR_NAME` | Yes/No | Description |

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
```

#### E. Download logo

**Priority order:**
1. Check runtipi-appstore first:
```bash
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg"
```

2. If exists (HTTP 200), download:
```bash
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"
```

3. If not found, download from official source (< 100KB)

### 4. UPDATE README FILES

**CRITICAL - OFTEN FORGOTTEN!**

#### A. Update /README.md
1. Add app to table (alphabetical order)
2. Increment counter (ex: 35 → 36)

#### B. Update /apps/README.md
1. Add to appropriate category section
2. Increment "Total Applications" counter

### 5. VALIDATION

Run these validations:

1. **JSON syntax**
```bash
cat apps/[app-name]/config.json | jq .
cat apps/[app-name]/docker-compose.json | jq .
```

2. **VS Code schema validation**
   - Open files in VS Code
   - Check for schema errors (should be zero)

3. **Docker image exists**
```bash
docker manifest inspect [image:tag]
```

4. **Checklist verification** (show to user):
   - [ ] config.json schema v2 property order
   - [ ] tipi_version = 1
   - [ ] All env_variable prefixed APPNAME_
   - [ ] Each form_field has hint
   - [ ] short_desc 4-5 words max
   - [ ] Native types (not strings)
   - [ ] Timestamps current
   - [ ] uid/gid only if PUID/PGID supported
   - [ ] docker-compose array format
   - [ ] isMain: true on main service
   - [ ] Version matches config.json
   - [ ] Variables use ${} syntax
   - [ ] description.md standardized format
   - [ ] Logo downloaded and valid
   - [ ] README.md updated (table + counter)
   - [ ] apps/README.md updated (category + counter)

### 6. GIT WORKFLOW

**Create feature branch and commit:**

```bash
# 1. Create feature branch
git checkout -b feat/add-[app-name]

# 2. Stage files
git add apps/[app-name]/ README.md apps/README.md

# 3. Commit
git commit -m "🎉 Added: [app-name] application to tipi-store"

# 4. Push
git push -u origin feat/add-[app-name]
```

### 7. FINAL REVIEW

Present to user:
- Summary of what was created
- All files created
- Checklist status
- Next steps (push, create PR)

## Important Reminders

### DO
✅ Research thoroughly before creating files
✅ Verify Docker tag exists with `docker manifest inspect`
✅ Prefix ALL env variables with APPNAME_
✅ Add hint to every form field
✅ Use native types (boolean, number)
✅ Update BOTH README files
✅ Follow schema v2 property order exactly
✅ Check PUID/PGID support before adding uid/gid
✅ Keep short_desc to 4-5 words
✅ Use ${VARIABLE} syntax in docker-compose

### DON'T
❌ Skip research phase
❌ Forget to update README files
❌ Use string types for boolean/number
❌ Forget variable prefixing
❌ Skip logo download
❌ Add uid/gid without verifying PUID/PGID
❌ Use {{VARIABLE}} syntax
❌ Forget to verify Docker tag
❌ Skip schema validation

---

**Ready to start!** What application would you like to add?
