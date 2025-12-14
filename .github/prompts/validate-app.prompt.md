---
mode: agent
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
