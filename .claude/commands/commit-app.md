---
description: Commit app changes with proper Git workflow and message format
---

# Commit Application Changes

You will help the user commit application changes following tipi-store standards.

## CRITICAL: Pre-Commit Checklist

**BEFORE any commit, verify:**

### For ANY app modification:
- [ ] **tipi_version incremented** (+1 from previous value) - **NEVER SKIP**
- [ ] **updated_at timestamp** updated to current millis - **ALWAYS UPDATE**
- [ ] Schema validation passed (no VS Code errors)
- [ ] Environment variables correctly prefixed APPNAME_*
- [ ] JSON syntax valid

### For new apps:
- [ ] tipi_version = 1
- [ ] All required files present
- [ ] README.md updated (table + counter)
- [ ] apps/README.md updated (category + counter)
- [ ] Logo downloaded and valid

## Git Workflow Decision

### 🆕 New Application

```bash
# 1. Create feature branch
git checkout -b feat/add-[app-name]

# 2. Stage files
git add apps/[app-name]/ README.md apps/README.md

# 3. Commit
git commit -m "🎉 Added: [app-name] application to tipi-store"

# 4. Push
git push -u origin feat/add-[app-name]

# 5. Create Pull Request
```

### 🔧 Existing Application Modification

**Use ATOMIC commits** - one logical change per commit

```bash
# Example: Fix Docker tag + increment version

# 1. Commit Docker changes
git add apps/[app-name]/docker-compose.json
git commit -m "🔧 Fixed: correct Docker image tag from X to Y for [app-name]"

# 2. Commit version increment (SEPARATE commit)
git add apps/[app-name]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app-name] Docker corrections"

# 3. Push
git push origin main
```

## Commit Message Format

### Template
```
[Gitmoji] [Category]: [description] for [app-name]
```

### Gitmoji by Category

#### 🎉 ADDED - New apps and features
```
🎉 Added: [app-name] application to tipi-store
✨ Added: webhook configuration for [app-name]
📦 Added: environment variable support for [app-name]
```

#### 🔧 FIXED - Corrections and fixes
```
🔧 Fixed: remove unsupported PUID/PGID from [app-name] config
🐛 Fixed: correct boolean types in [app-name] form fields
🩹 Fixed: schema validation errors in [app-name] config
🚑 Fixed: critical configuration issue in [app-name]
🔧 Fixed: increment tipi_version for [app-name] changes
```

#### 🔄 CHANGED - Improvements
```
⚡ Changed: migrate [app-name] to ghcr.io registry
🔄 Changed: prefix all environment variables with APPNAME_ in [app-name]
📈 Changed: improve health checks for [app-name]
🎨 Changed: optimize configuration structure for [app-name]
```

#### 🗑️ REMOVED - Deprecations
```
🗑️ Removed: deprecated variable from [app-name]
🔥 Removed: unused volume mounts in [app-name]
💥 Removed: breaking change in [app-name]
```

#### 🔒 SECURITY
```
🔒 Security: update [app-name] image to latest secure tag
🛡️ Security: enhance API key validation in [app-name]
```

#### 📚 DOCS
```
📚 Docs: update [app-name] environment variables section
📝 Docs: add configuration notes to [app-name]
📖 Docs: improve [app-name] setup guide
```

## Common Scenarios

### Scenario 1: Docker Image Tag Correction
```bash
# Problem: Wrong tag format (3.6.1 should be v3.6.1)

# Step 1: Fix docker-compose.json
git add apps/tinyauth/docker-compose.json
git commit -m "🔧 Fixed: correct Docker image tag from 3.6.1 to v3.6.1 for tinyauth"

# Step 2: Increment version in config.json
git add apps/tinyauth/config.json
git commit -m "🔧 Fixed: increment tipi_version for tinyauth Docker corrections"
```

### Scenario 2: Environment Variable Prefixing
```bash
# Problem: Variables not prefixed with APPNAME_

# Step 1: Update config.json and docker-compose.json
git add apps/sonarr/config.json apps/sonarr/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with SONARR_ in sonarr"

# Step 2: Update documentation
git add apps/sonarr/metadata/description.md
git commit -m "📚 Docs: update sonarr environment variables documentation"

# Step 3: Increment version
git add apps/sonarr/config.json
git commit -m "🔧 Fixed: increment tipi_version for sonarr variable refactoring"
```

### Scenario 3: Schema Compliance
```bash
# Problem: Schema validation errors

# Step 1: Fix schema issues
git add apps/prowlarr/config.json
git commit -m "🩹 Fixed: schema validation errors in prowlarr config"

# Step 2: Increment version
git add apps/prowlarr/config.json
git commit -m "🔧 Fixed: increment tipi_version for prowlarr schema compliance"
```

### Scenario 4: PUID/PGID Removal
```bash
# Problem: uid/gid added but PUID/PGID not supported

# Step 1: Remove uid/gid
git add apps/beszel/config.json apps/beszel/docker-compose.json
git commit -m "🔧 Fixed: remove unsupported PUID/PGID from beszel config"

# Step 2: Increment version
git add apps/beszel/config.json
git commit -m "🔧 Fixed: increment tipi_version for beszel PUID/PGID corrections"
```

## Atomic Commits Best Practices

### DO: Separate commits by scope
```bash
# ✅ GOOD - Clear, focused commits
git commit -m "🔄 Changed: prefix env vars with APPNAME_ in sonarr"
git commit -m "⚡ Changed: migrate sonarr to ghcr.io registry"
git commit -m "📚 Docs: update sonarr environment docs"
git commit -m "🔧 Fixed: increment tipi_version for sonarr"
```

### DON'T: Mix multiple changes
```bash
# ❌ BAD - Mixed concerns
git commit -m "🔧 Fixed: update sonarr variables, migrate to ghcr.io, fix docs, and increment version"
```

## Mandatory Version Bump Scenarios

**ALWAYS increment tipi_version (+1) when:**
- Docker image tag changes
- Environment variable modifications
- Configuration schema updates
- Health check adjustments
- Volume mount changes
- Port modifications
- ANY docker-compose.json changes
- ANY config.json form field updates
- Property reordering

## Quick Validation Commands

### Before commit
```bash
# Validate JSON syntax
cat apps/[app]/config.json | jq .
cat apps/[app]/docker-compose.json | jq .

# Check current tipi_version
grep '"tipi_version"' apps/[app]/config.json

# Get current timestamp
date +%s%3N
# Or visit: https://currentmillis.com

# Check git status
git status
```

## Commit Workflow Steps

1. **Make changes to app files**
2. **CRITICAL: Increment tipi_version in config.json**
3. **Update updated_at timestamp in config.json**
4. **Validate changes** (JSON syntax, schema)
5. **Stage files for first logical change**
6. **Commit with proper message**
7. **Repeat steps 5-6 for each logical change**
8. **Push to remote**

## Example Complete Workflow

```bash
# 1. Check current state
git status
git diff apps/overseerr/

# 2. Make technical changes
# ... edit files ...

# 3. Validate
cat apps/overseerr/config.json | jq .
cat apps/overseerr/docker-compose.json | jq .

# 4. Increment tipi_version (e.g., 5 → 6)
# ... edit config.json ...

# 5. Update timestamp
# ... edit config.json updated_at ...

# 6. Commit variable changes
git add apps/overseerr/config.json apps/overseerr/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with OVERSEERR_ in overseerr"

# 7. Commit Docker migration
git add apps/overseerr/docker-compose.json
git commit -m "⚡ Changed: migrate overseerr to ghcr.io registry"

# 8. Commit docs update
git add apps/overseerr/metadata/description.md
git commit -m "📚 Docs: update overseerr environment variables"

# 9. Commit version bump
git add apps/overseerr/config.json
git commit -m "🔧 Fixed: increment tipi_version for overseerr improvements"

# 10. Push
git push origin main
```

## Error Prevention

### Common Mistakes to Avoid
1. ❌ Forgetting tipi_version increment
2. ❌ Not updating updated_at timestamp
3. ❌ Mixed commits (multiple unrelated changes)
4. ❌ Incomplete staging (missing files)
5. ❌ Wrong gitmoji for category
6. ❌ Vague commit messages
7. ❌ Forgetting to validate JSON

### Verification Before Push
- [ ] All commits have proper gitmoji + category
- [ ] tipi_version incremented in final state
- [ ] updated_at timestamp is current
- [ ] JSON syntax valid
- [ ] Schema validation passed
- [ ] No untracked files left
- [ ] Commit messages clear and descriptive

---

**Ask the user:**
1. What app are you committing changes for?
2. What type of changes did you make?
3. Is this a new app or modification?

Then guide them through the appropriate workflow with proper commit messages.
