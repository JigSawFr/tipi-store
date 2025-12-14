---
description: Validate app configuration before committing to catch errors early
---

# Validate Application

Run comprehensive validation checks on an app to catch errors before committing.

## Process

### Step 1: Gather Information

Ask user:
- **App name** (e.g., "beszel", "paperless-ai")

### Step 2: Run Validation Checks

Run all checks and collect results. Show progress to user.

---

## Validation Checks

### ✅ Check 1: File Structure

**Verify all required files exist:**

```bash
# Check existence
apps/[app-name]/config.json
apps/[app-name]/docker-compose.json
apps/[app-name]/metadata/description.md
apps/[app-name]/metadata/logo.jpg
```

**Report:**
- ✓ All required files present
- ✗ Missing: [file-name]

---

### ✅ Check 2: JSON Syntax

**Validate JSON is well-formed:**

```bash
# config.json
cat apps/[app-name]/config.json | jq . > /dev/null

# docker-compose.json
cat apps/[app-name]/docker-compose.json | jq . > /dev/null
```

**Report:**
- ✓ JSON syntax valid
- ✗ JSON syntax error in [file]: [error-message]

---

### ✅ Check 3: Schema Compliance

**Verify schema validation (check for errors in VS Code or manual validation):**

Read both files and check:
- `$schema` property present
- All required properties present
- Property order (for config.json schema v2)

**Report:**
- ✓ Schema compliance: 0 errors
- ✗ Schema errors detected: [count] errors
  - Missing property: [property-name]
  - Wrong property order at: [property-name]

---

### ✅ Check 4: Docker Tag Verification

**Verify Docker image tag exists on registry:**

```bash
# Extract image from docker-compose.json
# Run docker manifest inspect
docker manifest inspect [image:tag]
```

**Report:**
- ✓ Docker tag exists: [image:tag]
- ✗ Docker tag not found: [image:tag]
  - Verify release exists
  - Check tag format (v prefix?)

---

### ✅ Check 5: Version Consistency

**Verify version matches between config.json and docker-compose.json:**

```bash
# Extract version from config.json
config_version="1.2.0"

# Extract tag from docker-compose.json image
compose_tag="v1.2.0"

# Compare (accounting for 'v' prefix)
# Remove 'v' from both and compare
```

**Report:**
- ✓ Version matches: config.json (1.2.0) ↔ docker-compose.json (v1.2.0)
- ✗ Version mismatch:
  - config.json: "1.2.0"
  - docker-compose.json: "1.2.3"

---

### ✅ Check 6: Variable Prefixing

**Verify ALL env_variable are prefixed with APPNAME_:**

Read config.json form_fields and docker-compose.json environment:

```bash
# Check all env_variable in form_fields
for field in form_fields:
  env_var = field.env_variable
  if not env_var.startswith("APPNAME_"):
    ✗ Not prefixed: env_var

# Check environment variables in docker-compose.json
# (excluding built-in vars like TZ, APP_PROTOCOL, etc.)
```

**Report:**
- ✓ All variables prefixed correctly (15/15)
- ✗ Variables not prefixed:
  - API_KEY (should be: APPNAME_API_KEY)
  - DB_PASSWORD (should be: APPNAME_DB_PASSWORD)

**Built-in vars to exclude from check:**
- `TZ`, `APP_PROTOCOL`, `APP_DOMAIN`, `APP_DATA_DIR`
- `PUID`, `PGID` (when using uid/gid)

---

### ✅ Check 7: Form Field Hints

**Verify ALL form_fields have hint property:**

```bash
# Check each form field
for field in form_fields:
  if not field.has("hint"):
    ✗ Missing hint: field.label
  elif field.hint == "":
    ✗ Empty hint: field.label
```

**Report:**
- ✓ All form fields have hints (8/8)
- ✗ Missing hints:
  - Field "API Key" has no hint
  - Field "Database URL" has empty hint

---

### ✅ Check 8: Short Description Length

**Verify short_desc is 5 words or less:**

```bash
# Count words in short_desc
word_count = len(short_desc.split())
```

**Report:**
- ✓ short_desc: "AI document analyzer" (3 words)
- ✗ short_desc too long: "Secure self-hosted file sync and collaboration platform" (8 words)
  - Limit: 5 words
  - Suggestion: "Self-hosted file sync platform"

---

### ✅ Check 9: Native Types

**Verify form_fields use native types (not strings for boolean/number):**

```bash
# Check each form field
for field in form_fields:
  if field.type == "boolean":
    if field.default is string:  # "true" instead of true
      ✗ String instead of boolean
  elif field.type == "number":
    if field.default is string:  # "8" instead of 8
      ✗ String instead of number
```

**Report:**
- ✓ All form fields use native types
- ✗ Type errors:
  - Field "Enable Debug": default is "true" (should be: true)
  - Field "Port": default is "8080" (should be: 8080)

---

### ✅ Check 10: tipi_version

**Check tipi_version is appropriate:**

For new apps:
- Should be 1

For existing apps (check git history):
- Should be incremented if files modified

**Report:**
- ✓ tipi_version: 1 (new app)
- ✓ tipi_version: 5 (existing app)
- ⚠️ tipi_version: 3 (no changes detected - OK if validating before modification)

---

### ✅ Check 11: Docker Compose Format

**Verify Runtipi v2 format:**

```bash
# Check docker-compose.json structure
- services is array (not object)
- Has $schema property
- schemaVersion is 2
- Main service has "isMain": true
- Main service has "internalPort" (not "addPorts")
- Environment uses array format with key/value
- Variables use ${VAR} syntax (not {{VAR}})
```

**Report:**
- ✓ Runtipi v2 format correct
- ✗ Format issues:
  - services is object (should be array)
  - Main service missing "isMain": true
  - Using {{VARIABLE}} instead of ${VARIABLE}

---

### ✅ Check 12: PUID/PGID Consistency

**If config.json has uid/gid, verify docker-compose.json has PUID/PGID:**

```bash
# If config.json has:
"uid": 1000,
"gid": 1000

# Then docker-compose.json should have:
"PUID": "1000",
"PGID": "1000"
```

**Report:**
- ✓ PUID/PGID consistent
- ✗ config.json has uid/gid but docker-compose.json missing PUID/PGID
- ✗ docker-compose.json has PUID/PGID but config.json missing uid/gid

---

### ✅ Check 13: Logo File

**Verify logo file:**

```bash
# Check logo exists and size
logo_path="apps/[app-name]/metadata/logo.jpg"
logo_size=$(stat -f%z "$logo_path" 2>/dev/null || stat -c%s "$logo_path" 2>/dev/null)

# Recommended: < 100KB (102400 bytes)
```

**Report:**
- ✓ Logo exists: 45 KB
- ⚠️ Logo large: 250 KB (recommended: < 100 KB)
- ✗ Logo missing

---

### ✅ Check 14: Description Format

**Verify description.md follows standardized format:**

Check for required sections:
- Has GitHub badges
- Has "SYNOPSIS" section
- Has "MAIN FEATURES" section
- Has "DOCKER IMAGE DETAILS" section
- Has "ENVIRONMENT" section
- Has "PROVIDED WITH LOVE" signature

**Report:**
- ✓ Description follows standard format
- ✗ Missing sections:
  - Missing "SYNOPSIS" section
  - Missing "PROVIDED WITH LOVE" signature

---

### ✅ Check 15: README Updates (for new apps only)

**If this is a new app, verify READMEs updated:**

Check git status for:
- /README.md modified
- /apps/README.md modified

**Report:**
- ✓ README.md updated
- ✓ apps/README.md updated
- ✗ README.md not updated (required for new apps)

---

## Final Report

### Summary Format

```
Validation Report for: [app-name]
=====================================

✅ Passed: 13/15 checks
⚠️  Warnings: 1
❌ Failed: 1

CRITICAL ISSUES (Must Fix):
❌ Docker tag not found: ghcr.io/owner/app:v1.2.3
   → Verify release exists and tag format

WARNINGS (Should Fix):
⚠️  Logo file large: 250 KB (recommended: < 100 KB)
   → Consider optimizing logo file size

PASSED CHECKS:
✓ File structure complete
✓ JSON syntax valid
✓ Schema compliance
✓ Version consistency
✓ All variables prefixed
✓ All form fields have hints
✓ short_desc length OK (3 words)
✓ Native types used
✓ tipi_version appropriate
✓ Docker compose format
✓ PUID/PGID consistent
✓ Description format standard

OVERALL STATUS: ⚠️  READY WITH WARNINGS
Fix critical issues before committing.
```

---

## Quick Validation (Express Mode)

For quick checks, offer express mode that runs only critical validations:

```
Quick validation (critical checks only):
✓ JSON syntax
✓ Docker tag exists
✓ Version matches
✓ Variables prefixed

Status: ✅ READY TO COMMIT
```

---

## Usage Examples

### Example 1: New App (All Checks Pass)
```
/validate

App name? beszel

Running validation...

✅ All 15 checks passed!

Status: ✅ READY TO COMMIT
```

### Example 2: App with Issues
```
/validate

App name? myapp

Running validation...

✅ Passed: 10/15 checks
❌ Failed: 5

CRITICAL ISSUES:
❌ Variables not prefixed: API_KEY, DB_URL
❌ Docker tag not found: ghcr.io/owner/myapp:v1.0.0
❌ short_desc too long (8 words, max 5)

Fix these issues before committing.
```

---

## Command Options

Ask user which mode:
1. **Full validation** (all 15 checks) - Recommended
2. **Quick validation** (critical checks only) - Fast
3. **Specific check** (run single check) - Targeted

---

**Ready! Which app would you like to validate?**
