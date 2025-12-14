---
description: Detect and fix common configuration issues in apps
---

# Fix Application Issues

Automatically detect and fix common configuration issues. This covers ~20% of commits that are fixes.

## Process

### Step 1: Gather Information

Ask user:
- **App name** (e.g., "beszel", "sonarr")
- **Mode**: Interactive (ask before each fix) or Auto (apply all fixes)

### Step 2: Detect Issues

Run detection for all common issues and collect results.

---

## Auto-Fix Capabilities

### Fix 1: Schema v2 Property Order

**Issue:** Properties in config.json not in correct schema v2 order

**Detection:**
```bash
# Check if properties are in this exact order:
1. $schema  2. id  3. available  4. port  5. name
6. description  7. version  8. tipi_version  9. short_desc  10. author
11. source  12. website  13. categories  14. url_suffix  15. form_fields
16. exposable  17. no_gui  18. supported_architectures  19. uid  20. gid
21. dynamic_config  22. min_tipi_version  23. created_at  24. updated_at
```

**Fix:**
- Read config.json
- Extract all properties
- Reorder according to schema v2
- Preserve all values exactly
- Write back to file

**Show user:**
```
✓ Fixed: Reordered properties to schema v2
  - Moved 'website' before 'categories'
  - Moved 'uid' after 'supported_architectures'
```

---

### Fix 2: String to Native Types

**Issue:** Boolean/number values as strings instead of native types

**Detection:**
```bash
# In form_fields, check for:
"default": "true"    # Should be: true
"default": "false"   # Should be: false
"default": "8"       # Should be: 8
"default": "100"     # Should be: 100
```

**Fix:**
- Scan all form_fields
- Convert `"true"` → `true`
- Convert `"false"` → `false`
- Convert `"8"` → `8` (for number fields)
- Preserve actual string values (like `"admin"`)

**Show user:**
```
✓ Fixed: Converted string types to native types
  - Field "Enable Debug": "true" → true
  - Field "Port": "8080" → 8080
  - Field "Max Connections": "100" → 100
```

---

### Fix 3: Missing Hints

**Issue:** form_fields missing hint property

**Detection:**
```bash
# Check each form_field for hint property
for field in form_fields:
  if not field.has("hint") or field.hint == "":
    # Missing or empty hint
```

**Fix:**
- Cannot auto-generate meaningful hints
- **Action:** Report to user with suggestions

**Show user:**
```
⚠️  Cannot auto-fix: Missing hints (requires human input)

  Please add hints for these fields:
  - Field "API Key": Add hint explaining what this is for
  - Field "Webhook URL": Add hint with example URL

  Template:
  "hint": "Description of what this field does and example if applicable"
```

---

### Fix 4: Variable Prefixing

**Issue:** Environment variables not prefixed with APPNAME_

**Detection:**
```bash
# Get app name (e.g., "sonarr")
# Expected prefix: "SONARR_"

# Check all env_variable in form_fields
for field in form_fields:
  if not field.env_variable.startswith("SONARR_"):
    # Not prefixed

# Check environment in docker-compose.json
# (exclude built-ins: TZ, APP_PROTOCOL, APP_DOMAIN, APP_DATA_DIR, PUID, PGID)
```

**Fix:**
- Add prefix to all non-prefixed variables
- Update in BOTH config.json AND docker-compose.json
- Preserve variable name after prefix

**Example:**
```
API_KEY → SONARR_API_KEY
DB_URL → SONARR_DB_URL
WEBHOOK_URL → SONARR_WEBHOOK_URL
```

**Show user:**
```
✓ Fixed: Added SONARR_ prefix to variables
  config.json:
  - API_KEY → SONARR_API_KEY
  - DB_URL → SONARR_DB_URL

  docker-compose.json:
  - ${API_KEY} → ${SONARR_API_KEY}
  - ${DB_URL} → ${SONARR_DB_URL}
```

---

### Fix 5: Version Mismatch

**Issue:** Version different between config.json and docker-compose.json

**Detection:**
```bash
# Extract version from config.json
config_version = "1.2.0"

# Extract tag from docker-compose.json
compose_tag = "v1.2.3"

# Normalize (remove 'v' prefix) and compare
if normalize(config_version) != normalize(compose_tag):
  # Mismatch detected
```

**Fix:**
- Ask user which version is correct
- Update the incorrect file
- Increment tipi_version (+1)
- Update timestamp

**Show user:**
```
⚠️  Version mismatch detected:
  - config.json: "1.2.0"
  - docker-compose.json: "v1.2.3"

Which version is correct?
1. Use 1.2.3 (update config.json)
2. Use 1.2.0 (update docker-compose.json)
3. Specify different version

Choice: 1

✓ Fixed: Updated config.json version to 1.2.3
✓ Incremented tipi_version: 5 → 6
✓ Updated timestamp
```

---

### Fix 6: Docker Compose Variable Syntax

**Issue:** Using {{VARIABLE}} instead of ${VARIABLE}

**Detection:**
```bash
# Scan docker-compose.json environment values
# Look for pattern: {{...}}
```

**Fix:**
- Replace all `{{VAR}}` with `${VAR}`
- Preserve variable names

**Show user:**
```
✓ Fixed: Updated variable syntax in docker-compose.json
  - {{APP_URL}} → ${APP_URL}
  - {{API_KEY}} → ${API_KEY}
  - {{DB_PASSWORD}} → ${DB_PASSWORD}
```

---

### Fix 7: Docker Compose Array Format

**Issue:** services as object instead of array

**Detection:**
```bash
# Check docker-compose.json structure
if typeof(services) == "object":
  # Wrong format
```

**Fix:**
- Convert object to array
- Wrap service definition in array

**Before:**
```json
{
  "services": {
    "app-name": {
      "image": "...",
      ...
    }
  }
}
```

**After:**
```json
{
  "services": [
    {
      "name": "app-name",
      "image": "...",
      ...
    }
  ]
}
```

**Show user:**
```
✓ Fixed: Converted services object to array format (Runtipi v2)
```

---

### Fix 8: Missing isMain and internalPort

**Issue:** Main service missing required properties

**Detection:**
```bash
# Find main service (first service or service with exposable port)
main_service = services[0]

if not main_service.has("isMain"):
  # Missing isMain

if not main_service.has("internalPort") and main_service.has("addPorts"):
  # Should use internalPort instead of addPorts for main service
```

**Fix:**
- Add `"isMain": true` to main service
- Convert `addPorts` to `internalPort` for main service

**Show user:**
```
✓ Fixed: Added required properties to main service
  - Added "isMain": true
  - Converted "addPorts": [8080] to "internalPort": 8080
```

---

### Fix 9: Timestamp Format

**Issue:** Timestamps not in milliseconds or incorrect

**Detection:**
```bash
# Check created_at and updated_at
# Should be 13-digit number (milliseconds since epoch)

if len(str(created_at)) != 13:
  # Wrong format
```

**Fix:**
- Ask user if they want to update to current timestamp
- Or keep as-is if valid

**Show user:**
```
⚠️  Timestamp check:
  - created_at: 1700000000000 ✓ (valid)
  - updated_at: 1700000 ✗ (invalid - too short)

Fix updated_at to current time?
1. Yes (set to current: 1734177600000)
2. No (keep as-is)

Choice: 1

✓ Fixed: Updated updated_at timestamp
```

---

### Fix 10: Short Description Length

**Issue:** short_desc too long (> 5 words)

**Detection:**
```bash
# Count words
word_count = len(short_desc.split())

if word_count > 5:
  # Too long
```

**Fix:**
- Cannot auto-fix (requires human decision)
- **Action:** Suggest shorter alternatives using AI

**Show user:**
```
⚠️  Cannot auto-fix: short_desc too long (8 words, max 5)

Current: "Secure self-hosted file sync and collaboration platform"

Suggestions:
1. "Self-hosted file sync platform"
2. "Secure file collaboration tool"
3. "Cloud storage alternative"

Which would you like? (or type custom):
```

---

## Fix Process Workflow

### Interactive Mode (Recommended)

```
/fix-app

App name? sonarr
Mode? Interactive

Detecting issues...

Found 5 issues:

1. ✗ Property order incorrect (schema v2)
   Fix: Reorder properties
   Apply this fix? (y/n): y
   ✓ Applied

2. ✗ String types instead of native types (3 fields)
   Fix: Convert "true" → true, "8080" → 8080
   Apply this fix? (y/n): y
   ✓ Applied

3. ✗ Variables not prefixed (2 variables)
   Fix: Add SONARR_ prefix
   Apply this fix? (y/n): y
   ✓ Applied

4. ⚠️  Missing hints (2 fields)
   Cannot auto-fix - requires manual input
   Skip? (y/n): y

5. ✗ Variable syntax {{VAR}} instead of ${VAR}
   Fix: Update syntax
   Apply this fix? (y/n): y
   ✓ Applied

Summary:
✓ Applied: 4 fixes
⚠️  Skipped: 1 (requires manual fix)

Changes made to:
- apps/sonarr/config.json
- apps/sonarr/docker-compose.json

Next steps:
1. Review changes with: git diff apps/sonarr/
2. Validate with: /validate
3. Commit with: /commit-app
```

### Auto Mode

```
/fix-app

App name? sonarr
Mode? Auto

Detecting issues...
Applying all auto-fixable issues...

✓ Fixed property order (schema v2)
✓ Converted string to native types (3 fields)
✓ Added SONARR_ prefix (2 variables)
✓ Updated variable syntax (3 instances)

⚠️  Could not auto-fix (requires manual input):
- Missing hints for 2 fields
- short_desc too long (needs human decision)

Summary:
✓ Applied: 4 fixes
⚠️  Manual fixes needed: 2

Next: Review changes and run /validate
```

---

## Safety Features

### Before Making Changes

1. **Backup**: Create backup of files (optional)
2. **Dry Run**: Show what would be changed without applying
3. **Git Status**: Warn if uncommitted changes exist

### After Changes

1. **Validation**: Run automatic validation
2. **Increment tipi_version**: Remind user to increment
3. **Git Diff**: Show changes made

---

## Command Options

Ask user:
1. **Interactive mode** (ask before each fix) - Safe, recommended
2. **Auto mode** (apply all fixes automatically) - Fast
3. **Dry run** (show what would be fixed without applying) - Preview
4. **Specific fix** (fix only one type of issue) - Targeted

---

## Error Handling

### Cannot Fix Automatically

These issues require human input:
- Missing hints (need meaningful descriptions)
- short_desc too long (need human decision)
- Logo missing (need to find/download)
- Description format (need content)

**Action:** Report these to user with guidance

---

**Ready! Which app would you like to fix?**
