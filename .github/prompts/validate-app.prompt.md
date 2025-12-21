---
agent: "agent"
---

# Validate Application Configuration

Run comprehensive validation on **$ARGUMENTS** to catch errors before committing.

## Validation Checks

### 1. File Structure
```
apps/[app-name]/
├── config.json           ✓ Required
├── docker-compose.json   ✓ Required
└── metadata/
    ├── description.md    ✓ Required
    └── logo.jpg          ✓ Required (< 100KB)
```

### 2. JSON Syntax
```powershell
cat apps/[app-name]/config.json | ConvertFrom-Json
cat apps/[app-name]/docker-compose.json | ConvertFrom-Json
```

### 3. Docker Tag Exists
```powershell
# Extract image from docker-compose.json and verify
docker manifest inspect [image:tag]
```

### 4. config.json Checks

| Check | Rule |
|-------|------|
| `$schema` | Must be `https://schemas.runtipi.io/v2/app-info.json` |
| Property order | Follow schema v2 order exactly |
| `short_desc` | ≤ 5 words |
| `tipi_version` | Integer ≥ 1 |
| `form_fields[].hint` | ALL fields must have hint |
| `form_fields[].env_variable` | Must be prefixed `APPNAME_*` |
| `uid`/`gid` | Only if PUID/PGID supported |
| Native types | `true`/`false` not `"true"`/`"false"` |

### 5. docker-compose.json Checks

| Check | Rule |
|-------|------|
| `$schema` | Must be `https://schemas.runtipi.io/v2/dynamic-compose.json` |
| `services` | Must be array format `[...]` |
| Main service | Must have `"isMain": true` |
| Port config | Use `internalPort` (not `addPorts` for main) |
| Variable syntax | `${VARIABLE}` not `{{VARIABLE}}` |
| **⚠️ Variable coherence** | Every `${APPNAME_*}` must exist in config.json form_fields |

### 5b. Variable Coherence Check (CRITICAL)

**Extract all variables from docker-compose.json and verify each exists in form_fields:**

```powershell
# Built-in Tipi variables (no form_field needed):
# TZ, APP_DATA_DIR, APP_DOMAIN, APP_PROTOCOL, APP_EXPOSED, APP_HOST, APP_PORT, LOCAL_DOMAIN

# All other ${APPNAME_*} variables MUST have a form_field!
# Common missing variables that cause container failures:
# - APPNAME_DB_PASSWORD (PostgreSQL/MySQL)
# - APPNAME_SECRET_KEY (Django/Flask apps)
# - APPNAME_JWT_SECRET (Auth apps)
```

**Failure symptom**: `container [app]-db-1 is unhealthy` = missing DB password variable

### 6. Version Consistency
- Version in config.json must match tag in docker-compose.json
- Account for `v` prefix differences

### 7. README Updates (for new apps)
- `/README.md` table updated
- `/apps/README.md` category updated
- Counters incremented

## Report Format

```
Validation Report: [app-name]
=============================

✓ File structure complete
✓ JSON syntax valid
✓ Docker tag exists: [image:tag]
✓ Schema v2 property order
✓ All form_fields have hints
✓ Variable prefix correct
✓ Version consistency
✗ short_desc too long (6 words, max 5)

Status: 1 issue found
```

## Auto-Fix Suggestions

For common issues, suggest `/fix-app` command or show inline fix.
