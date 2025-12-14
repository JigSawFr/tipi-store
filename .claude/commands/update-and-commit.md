---
description: Update app version and commit automatically (orchestrates update-version + validate + commit)
---

# Update and Commit

Complete workflow to update app version with automatic validation and commit.

This is a **meta-command** that chains together:
1. `/update-version` - Update Docker image version
2. `/validate` - Quick validation (critical checks only)
3. Auto-commit with proper message

## Process

### Step 1: Update Version

Execute `/update-version` workflow:
- Ask app name and new version
- Verify Docker tag exists
- Update config.json and docker-compose.json
- Increment tipi_version
- Update timestamp

### Step 2: Quick Validation

Run quick validation (critical checks only):
- ✓ JSON syntax
- ✓ Docker tag exists
- ✓ Version consistency
- ✓ tipi_version incremented

**If validation fails:**
- Show errors
- Abort (don't commit)

**If validation passes:**
- Continue to commit

### Step 3: Auto-Commit

Automatically commit with generated message:
- Stage files: `apps/[app]/config.json` and `docker-compose.json`
- Commit: `chore(deps): update [image] docker tag to [version]`
- Push to main

---

## Complete Example

```
User: /update-and-commit

Claude: Let's update an app version with automatic commit!

=== STEP 1: UPDATE VERSION ===
Which app? beszel
Current version: 0.16.0
New version? 0.17.0

Verifying Docker tag...
✓ Tag exists: ghcr.io/henrygd/beszel/beszel:v0.17.0

Updating files...
✓ config.json: version 0.16.0 → 0.17.0
✓ docker-compose.json: tag v0.16.0 → v0.17.0
✓ tipi_version: 3 → 4
✓ updated_at: [timestamp]

=== STEP 2: QUICK VALIDATION ===
Running critical checks...

✓ JSON syntax valid
✓ Docker tag exists
✓ Version consistency
✓ tipi_version incremented

Status: READY TO COMMIT ✓

=== STEP 3: AUTO-COMMIT ===
Staging: apps/beszel/config.json, apps/beszel/docker-compose.json
Committing: chore(deps): update ghcr.io/henrygd/beszel/beszel docker tag to v0.17.0
Pushing to main...

✓ Complete! Version updated and committed.
```

---

## Batch Mode

Can update multiple apps in sequence:

```
User: /update-and-commit

Claude: Update single app or batch mode?
1. Single app
2. Batch (multiple apps)

User: 2

Claude: Enter apps and versions (format: app:version):
beszel:0.17.0
paperless-ngx:2.20.2
sonarr:4.0.10

Processing 3 apps...

[1/3] beszel → 0.17.0
✓ Updated, validated, committed

[2/3] paperless-ngx → 2.20.2
✓ Updated, validated, committed

[3/3] sonarr → 4.0.10
✓ Updated, validated, committed

Summary:
✓ 3 apps updated successfully
✓ 3 commits created
✓ All pushed to main
```

---

## Error Handling

### Docker Tag Not Found

```
=== STEP 1: UPDATE VERSION ===
Which app? beszel
New version? 0.99.0

Verifying Docker tag...
❌ Tag not found: ghcr.io/henrygd/beszel/beszel:v0.99.0

Possible issues:
- Version doesn't exist yet
- Wrong tag format (try without 'v'?)
- Release not published

Workflow aborted. No changes made.
```

### Validation Fails

```
=== STEP 2: QUICK VALIDATION ===
Running critical checks...

✓ JSON syntax valid
✓ Docker tag exists
❌ Version consistency FAILED
   - config.json: "0.17.0"
   - docker-compose.json: "v0.17.0"
   - Mismatch detected!

Workflow aborted. Please run /fix-app or fix manually.
```

---

## Advantages

**Fastest Workflow:**
- Single command for most common task (60% of commits)
- No manual validation step
- No manual commit message
- Immediate push to main

**Safety:**
- Validates before committing
- Aborts on errors
- No partial commits

**Efficiency:**
- Batch mode for multiple updates
- Saves significant time
- Consistent messages

---

## When to Use

**Use `/update-and-commit` when:**
- Updating app versions (most common task)
- Want fastest workflow
- Trust automated validation
- Standard version update only

**Use `/update-version` separately when:**
- Want to review changes before commit
- Testing new version
- Need to make additional changes
- Want more control

---

**Ready to update and commit automatically?**
