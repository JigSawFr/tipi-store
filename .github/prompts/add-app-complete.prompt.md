---
agent: "agent"
---

# Add New Application - Complete Workflow

Add the application from **$ARGUMENTS** to tipi-store with full validation and commit.

## Workflow

Execute these steps in order:

### Step 1: Research & Verify

1. **Fetch GitHub page** to understand the application
2. **Find Docker image**: Prefer `ghcr.io` over Docker Hub
3. **Verify tag exists**: `docker manifest inspect [image:tag]`
4. **Check architectures**: amd64, arm64 support
5. **Read docker-compose.yml**: Note ALL environment variables
6. **Check PUID/PGID support**: Only add uid/gid if supported

### Step 2: Create Files

Create `apps/[app-name]/` with:

**config.json** (schema v2 property order):
```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description...",
  "version": "x.y.z",
  "tipi_version": 1,
  "short_desc": "Max 5 words only",
  "author": "OriginalAuthor",
  "source": "https://github.com/...",
  "website": "https://...",
  "categories": ["utilities"],
  "form_fields": [],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "dynamic_config": true,
  "min_tipi_version": "3.0.0",
  "created_at": [timestamp],
  "updated_at": [timestamp]
}
```

**docker-compose.json**:
```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "services": [{
    "name": "app-name",
    "image": "ghcr.io/org/app:version",
    "internalPort": 8080,
    "isMain": true,
    "environment": {},
    "volumes": [{"hostPath": "${APP_DATA_DIR}/data", "containerPath": "/data"}]
  }]
}
```

**metadata/description.md**: Standardized format with badges, SYNOPSIS, FEATURES, ENVIRONMENT sections

**metadata/logo.jpg**: Download from runtipi-appstore or official GitHub

### Step 3: Update READMEs

- `/README.md`: Add to table (alphabetical), increment counter
- `/apps/README.md`: Add to appropriate category section

### Step 4: Validate

Check:
- [ ] JSON syntax valid
- [ ] Docker tag exists
- [ ] All form_fields have `hint`
- [ ] `short_desc` ≤ 5 words
- [ ] Version matches in both files
- [ ] No schema errors

### Step 5: Commit

```bash
git add apps/[app-name]/ README.md apps/README.md
git commit -m "🎉 Added: [app-name] application to tipi-store"
```

## Critical Rules

- **Variable prefix**: ALL env vars must be `APPNAME_*`
- **Variable syntax**: `${VARIABLE}` not `{{VARIABLE}}`
- **Timestamp**: `[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()`
- **tipi_version**: Always `1` for new apps
