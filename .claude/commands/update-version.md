---
description: Update app Docker image version with validation and automatic tipi_version increment
---

# Update Application Version

Guide user through updating an app's Docker image version safely. This covers 60% of typical tipi-store commits.

## Process

### Step 1: Gather Information

Ask user:
- **App name** (e.g., "beszel", "paperless-ngx")

### Step 2: Get Current State

Read `apps/[app-name]/config.json` and show user:
- Current version
- Current tipi_version
- Docker image being used

**Example output:**
```
Current state for beszel:
- Version: 0.16.0
- tipi_version: 3
- Docker image: ghcr.io/henrygd/beszel/beszel:v0.16.0
```

### Step 3: Ask for New Version

Ask user:
- **New version** (e.g., "0.17.0")

### Step 4: Verify Docker Tag Exists (CRITICAL)

**Before making ANY changes**, verify the Docker tag exists:

```bash
# Extract image name from docker-compose.json
# Build new tag with user's version
# Verify it exists
docker manifest inspect [image]:[new-tag]
```

**If tag doesn't exist:**
- ❌ STOP process
- Show error: "Docker tag [image]:[tag] not found"
- Ask user to verify the version number

**If tag exists:**
- ✅ Continue

### Step 5: Update Files

Update these files in order:

#### A. Update config.json
```json
{
  "version": "0.17.0",        // ← Update this
  "tipi_version": 4,          // ← Increment (+1): 3 → 4
  "updated_at": 1734177600000 // ← Current timestamp from https://currentmillis.com
}
```

**Critical:**
- Increment `tipi_version` by exactly +1
- Get current timestamp: `date +%s%3N` or https://currentmillis.com
- Keep version format (with or without 'v' prefix as appropriate)

#### B. Update docker-compose.json
```json
{
  "services": [
    {
      "image": "ghcr.io/henrygd/beszel/beszel:v0.17.0"  // ← Update tag here
    }
  ]
}
```

**Critical:**
- Keep exact image name (registry, owner, repo)
- Update ONLY the tag part
- Match tag format from registry (keep 'v' prefix if present)

### Step 6: Validate Changes

Run validation:

```bash
# JSON syntax
cat apps/[app-name]/config.json | jq .
cat apps/[app-name]/docker-compose.json | jq .

# Verify version matching
# Extract version from config.json
# Extract tag from docker-compose.json
# Confirm they match (accounting for 'v' prefix)
```

**Show user validation results:**
- ✓ JSON syntax valid
- ✓ tipi_version incremented: 3 → 4
- ✓ Timestamp updated
- ✓ Version matches between files
- ✓ Docker tag verified exists

### Step 7: Generate Commit Message

Based on the Docker image, generate proper commit message:

**Format:** `chore(deps): update [image-path] docker tag to [version]`

**Examples:**
```bash
# For ghcr.io image
chore(deps): update ghcr.io/henrygd/beszel/beszel docker tag to v0.17.0

# For Docker Hub image
chore(deps): update paperless-ngx/paperless-ngx docker tag to 2.20.2

# For linuxserver.io image
chore(deps): update lscr.io/linuxserver/sonarr docker tag to 4.0.10
```

**Pattern:**
- Use full image path from docker-compose.json
- Include version with exact tag format (with or without 'v')

### Step 8: Commit and Push

```bash
# Stage changes
git add apps/[app-name]/config.json apps/[app-name]/docker-compose.json

# Commit with generated message
git commit -m "[generated-message]"

# Push to main
git push origin main
```

### Step 9: Summary

Show user:
```
✅ Version update complete!

App: beszel
Old version: 0.16.0 (tipi_version: 3)
New version: 0.17.0 (tipi_version: 4)

Files updated:
- apps/beszel/config.json
- apps/beszel/docker-compose.json

Commit message:
chore(deps): update ghcr.io/henrygd/beszel/beszel docker tag to v0.17.0

✓ Committed and pushed to main
```

---

## Common Scenarios

### Scenario 1: Simple Version Update
**User:** "Update beszel to 0.17.0"
**Steps:** Verify tag → Update files → Increment tipi_version → Commit

### Scenario 2: Tag Format Mismatch
**Issue:** User says "1.2.0" but actual tag is "v1.2.0"
**Solution:** Verify with `docker manifest inspect`, use exact tag format from registry

### Scenario 3: Multiple Updates
**User:** "Update beszel, paperless-ngx, and sonarr"
**Solution:** Process one at a time, separate commit for each

### Scenario 4: Tag Doesn't Exist
**Issue:** `docker manifest inspect` fails
**Solution:** Stop process, inform user, ask them to verify version

---

## Validation Checklist

Before committing:
- [ ] Docker tag verified with `docker manifest inspect`
- [ ] config.json `version` updated
- [ ] docker-compose.json `image` tag updated
- [ ] tipi_version incremented (+1)
- [ ] updated_at timestamp current
- [ ] Version matches between files
- [ ] JSON syntax valid
- [ ] Commit message follows pattern

---

## Tag Format Reference

### Common Tag Patterns

**GitHub Container Registry (ghcr.io):**
- Format: `ghcr.io/owner/repo:vX.Y.Z` or `ghcr.io/owner/repo:X.Y.Z`
- Example: `ghcr.io/henrygd/beszel/beszel:v0.17.0`

**Docker Hub:**
- Format: `owner/repo:X.Y.Z` or `owner/repo:vX.Y.Z`
- Example: `paperless-ngx/paperless-ngx:2.20.2`

**LinuxServer.io:**
- Format: `lscr.io/linuxserver/repo:X.Y.Z`
- Example: `lscr.io/linuxserver/sonarr:4.0.10`

**Important:** Always keep the exact tag format from the registry!

---

## Error Handling

### Error: Tag Not Found
```
❌ Docker tag not found: ghcr.io/owner/app:v1.2.3

Possible causes:
1. Version number incorrect
2. Tag format wrong (check if 'v' prefix needed)
3. Release not published yet

Please verify:
- https://github.com/owner/repo/releases
- https://github.com/owner/repo/pkgs/container/app
```

### Error: JSON Syntax Invalid
```
❌ JSON syntax error in config.json

Run manually to see error:
cat apps/[app]/config.json | jq .

Fix syntax error before continuing.
```

### Error: Version Mismatch
```
⚠️ Version mismatch detected:
- config.json: "1.2.0"
- docker-compose.json: "v1.2.3"

These must match! Updating both to v1.2.3
```

---

**Ready! Which app version would you like to update?**
