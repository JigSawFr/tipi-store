---
mode: agent
---

# Update App Version and Commit

Update Docker image version for **$ARGUMENTS** with automatic validation and commit.

## Workflow

### Step 1: Get Current State

Read `apps/[app-name]/config.json` and `docker-compose.json`:
- Show current version
- Show current tipi_version
- Show Docker image

### Step 2: Ask New Version

Ask user for the new version number.

### Step 3: Verify Docker Tag (CRITICAL)

```powershell
docker manifest inspect [image]:[new-tag]
```

**If tag doesn't exist**: STOP and show error
**If tag exists**: Continue

### Step 4: Update Files

**config.json**:
```json
{
  "version": "[new-version]",
  "tipi_version": [current + 1],
  "updated_at": [current-timestamp]
}
```

**docker-compose.json**:
```json
{
  "image": "[image]:[new-tag]"
}
```

### Step 5: Quick Validation

- ✓ JSON syntax valid
- ✓ Docker tag exists
- ✓ Version matches in both files
- ✓ tipi_version incremented

### Step 6: Auto-Commit

```bash
git add apps/[app-name]/config.json apps/[app-name]/docker-compose.json
git commit -m "⬆️ Updated: [app-name] to version [new-version]"
```

## Commands

```powershell
# Get timestamp
[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()

# Verify Docker tag
docker manifest inspect ghcr.io/org/image:tag
```
