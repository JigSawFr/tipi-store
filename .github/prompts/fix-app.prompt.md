---
agent: "agent"
---

# Fix Application Issues

Detect and auto-fix common configuration issues in **$ARGUMENTS**.

## Auto-Fix Capabilities

### Fix 1: Schema v2 Property Order

Reorder config.json properties to match:
```
$schema → id → available → port → name → description → version →
tipi_version → short_desc → author → source → website → categories →
url_suffix → form_fields → exposable → no_gui → supported_architectures →
uid → gid → dynamic_config → min_tipi_version → created_at → updated_at
```

### Fix 2: String to Native Types

Convert string booleans/numbers to native types:
- `"true"` → `true`
- `"false"` → `false`
- `"8080"` → `8080` (for number fields)

### Fix 3: Variable Prefix

Add `APPNAME_` prefix to environment variables:
- `API_KEY` → `APPNAME_API_KEY`
- Update both config.json and docker-compose.json

### Fix 4: Missing Hints

Add generic hints to form_fields missing them:
```json
{
  "env_variable": "APPNAME_API_KEY",
  "hint": "Enter your API key for APPNAME"
}
```

### Fix 5: Variable Syntax

Replace Jinja syntax with shell syntax in docker-compose.json:
- `{{VARIABLE}}` → `${VARIABLE}`

### Fix 6: Add Missing Schema

Add `$schema` if missing:
- config.json: `"$schema": "https://schemas.runtipi.io/v2/app-info.json"`
- docker-compose.json: `"$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json"`

### Fix 7: Increment tipi_version

If files were modified but tipi_version not incremented:
- Increment `tipi_version` by +1
- Update `updated_at` timestamp

### Fix 8: Missing Environment Variables (CRITICAL)

Scan docker-compose.json for `${APPNAME_*}` variables not defined in config.json form_fields:

**Built-in Tipi variables (skip these):**
- `TZ`, `APP_DATA_DIR`, `APP_DOMAIN`, `APP_PROTOCOL`, `APP_EXPOSED`, `APP_HOST`, `APP_PORT`, `LOCAL_DOMAIN`

**Auto-add missing variables:**
```json
// For database passwords (PostgreSQL, MySQL, Redis)
{
  "env_variable": "APPNAME_DB_PASSWORD",
  "label": "Database Password",
  "type": "random",
  "hint": "PostgreSQL/MySQL database password (auto-generated)",
  "encoding": "hex"
}

// For secret keys / JWT secrets
{
  "env_variable": "APPNAME_SECRET_KEY",
  "label": "Secret Key",
  "type": "random",
  "hint": "Application secret key (auto-generated)",
  "encoding": "hex"
}
```

**Failure symptom**: `container [app]-db-1 is unhealthy` = missing DB password

## Process

1. **Detect all issues** - Scan both config files
2. **Show summary** - List all detected issues
3. **Ask mode** - Interactive (confirm each) or Auto (apply all)
4. **Apply fixes** - Make changes
5. **Show diff** - Display what changed
6. **Validate** - Run validation to confirm fixes

## Report Format

```
Fix Report: [app-name]
======================

Detected Issues:
1. ⚠️ Property order incorrect
2. ⚠️ 3 variables missing APPNAME_ prefix
3. ⚠️ 2 form_fields missing hints
4. ⚠️ tipi_version not incremented

Apply all fixes? [Y/n]

Applying fixes...
✓ Reordered 5 properties
✓ Prefixed 3 variables: API_KEY, DB_PASSWORD, SECRET
✓ Added hints to 2 fields
✓ Incremented tipi_version: 2 → 3

All fixes applied! Run /validate to confirm.
```
