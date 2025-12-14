---
description: Commit app changes with proper Git workflow and messages
---

# Commit Application Changes

Guide user through committing changes with proper workflow and commit messages.

## Pre-Commit Verification (CRITICAL)

**BEFORE any commit, ask user to verify:**

### For ANY app modification:
- [ ] **tipi_version incremented** (+1) - NEVER SKIP
- [ ] **updated_at timestamp** updated (currentmillis.com) - ALWAYS UPDATE
- [ ] Schema validation passed (VS Code: 0 errors)
- [ ] JSON syntax valid

### For new apps:
- [ ] tipi_version = 1
- [ ] All required files present
- [ ] README.md updated (table + counter)
- [ ] apps/README.md updated (category + counter)

## Determine Workflow

Ask user: **"Is this a new app or modification to existing app?"**

### Workflow A: New Application

```bash
# 1. Create feature branch
git checkout -b feat/add-[app-name]

# 2. Stage files
git add apps/[app-name]/ README.md apps/README.md

# 3. Commit
git commit -m "🎉 Added: [app-name] application to tipi-store"

# 4. Push
git push -u origin feat/add-[app-name]

# 5. Create Pull Request on GitHub
```

### Workflow B: Existing App Modification

**Use ATOMIC commits** - one logical change per commit.

Ask user: **"What changes did you make?"** Then guide based on scenario:

#### Scenario 1: Docker Image Tag Fix
```bash
# Commit 1: Technical fix
git add apps/[app]/docker-compose.json
git commit -m "🔧 Fixed: correct Docker image tag from [old] to [new] for [app]"

# Commit 2: Version bump (SEPARATE)
git add apps/[app]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app] Docker corrections"

# Push
git push origin main
```

#### Scenario 2: Environment Variable Prefixing
```bash
# Commit 1: Variable changes
git add apps/[app]/config.json apps/[app]/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with APPNAME_ in [app]"

# Commit 2: Documentation (if updated)
git add apps/[app]/metadata/description.md
git commit -m "📚 Docs: update [app] environment variables section"

# Commit 3: Version bump
git add apps/[app]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app] refactoring"

# Push
git push origin main
```

#### Scenario 3: Schema Compliance Fix
```bash
# Commit 1: Fix schema
git add apps/[app]/config.json
git commit -m "🩹 Fixed: schema validation errors in [app] config"

# Commit 2: Version bump
git add apps/[app]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app] schema compliance"

# Push
git push origin main
```

#### Scenario 4: PUID/PGID Removal
```bash
# Commit 1: Remove unsupported
git add apps/[app]/config.json apps/[app]/docker-compose.json
git commit -m "🔧 Fixed: remove unsupported PUID/PGID from [app] config"

# Commit 2: Version bump
git add apps/[app]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app] PUID/PGID corrections"

# Push
git push origin main
```

## Commit Message Format

**Template**: `[Gitmoji] [Category]: [description] for [app-name]`

### Gitmoji Reference

#### 🎉 ADDED - New apps/features
```
🎉 Added: [app-name] application to tipi-store
✨ Added: webhook configuration for [app]
📦 Added: environment variable support for [app]
```

#### 🔧 FIXED - Corrections
```
🔧 Fixed: remove unsupported PUID/PGID from [app]
🔧 Fixed: increment tipi_version for [app] changes
🐛 Fixed: correct boolean types in [app] form fields
🩹 Fixed: schema validation errors in [app]
🚑 Fixed: critical configuration issue in [app]
```

#### 🔄 CHANGED - Improvements
```
⚡ Changed: migrate [app] to ghcr.io registry
🔄 Changed: prefix environment variables with APPNAME_ in [app]
📈 Changed: improve health checks for [app]
🎨 Changed: optimize configuration structure for [app]
```

#### 📚 DOCS - Documentation
```
📚 Docs: update [app] environment variables section
📝 Docs: add configuration notes to [app]
📖 Docs: improve [app] setup guide
```

#### 🗑️ REMOVED - Cleanup
```
🗑️ Removed: deprecated variable from [app]
🔥 Removed: unused volume mounts in [app]
```

#### 🔒 SECURITY
```
🔒 Security: update [app] image to latest secure tag
🛡️ Security: enhance API validation in [app]
```

## When to Increment tipi_version

**ALWAYS increment (+1) when:**
- Docker image tag changes
- Environment variables modified
- Config schema updates
- Health checks adjusted
- Volume mounts changed
- Port modifications
- ANY docker-compose.json changes
- ANY config.json form field updates
- Property reordering

## Validation Commands

```bash
# Before commit
cat apps/[app]/config.json | jq .
cat apps/[app]/docker-compose.json | jq .

# Check tipi_version
grep '"tipi_version"' apps/[app]/config.json

# Get timestamp
date +%s%3N
# Or: https://currentmillis.com

# Status
git status
git diff apps/[app]/
```

## Complete Example Workflow

**User modified `overseerr` app (env vars + Docker migration + docs)**

```bash
# 1. Check status
git status
git diff apps/overseerr/

# 2. Validate changes
cat apps/overseerr/config.json | jq .
cat apps/overseerr/docker-compose.json | jq .

# 3. Verify tipi_version incremented (e.g., 5 → 6)
grep '"tipi_version"' apps/overseerr/config.json

# 4. Atomic commit 1: Variable changes
git add apps/overseerr/config.json apps/overseerr/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with OVERSEERR_ in overseerr"

# 5. Atomic commit 2: Docker migration
git add apps/overseerr/docker-compose.json
git commit -m "⚡ Changed: migrate overseerr to ghcr.io registry"

# 6. Atomic commit 3: Docs
git add apps/overseerr/metadata/description.md
git commit -m "📚 Docs: update overseerr environment variables"

# 7. Atomic commit 4: Version bump
git add apps/overseerr/config.json
git commit -m "🔧 Fixed: increment tipi_version for overseerr improvements"

# 8. Push
git push origin main
```

## Best Practices

### ✅ DO
- Make atomic commits (one logical change each)
- Separate technical changes from version bumps
- Write clear, descriptive commit messages
- Always increment tipi_version for modifications
- Update timestamp with tipi_version
- Validate JSON before committing
- Check schema validation passes

### ❌ DON'T
- Mix multiple unrelated changes in one commit
- Forget tipi_version increment
- Skip timestamp update
- Use vague commit messages
- Commit without validation

---

**Ask user**:
1. "What app are you committing changes for?"
2. "Is this a new app or modification?"
3. "What type of changes did you make?"

Then guide through appropriate workflow with proper commit messages.
