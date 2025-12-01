---
mode: agent
---

# 📝 Commit application changes to tipi-store

Handle proper Git workflow and commit formatting for tipi-store application changes, following **Keep a Changelog** standards with **Gitmoji** prefixes.

## 🔄 Git workflow decision tree

### 🆕 New application integration
```bash
# 1. Create dedicated feature branch
git checkout -b feat/add-[app-name]
git push -u origin feat/add-[app-name]

# 2. Make changes and commit
git add apps/[app-name]/
git commit -m "🎉 Added: [app-name] application to tipi-store"
git commit -m "✨ Added: comprehensive configuration options for [app-name]"
git commit -m "📚 Docs: add complete [app-name] documentation"

# 3. Push and create PR
git push origin feat/add-[app-name]
# Create Pull Request for review
```

### 🔧 Existing application modification
```bash
# 1. Work directly on main or create feature branch for major changes
git checkout main
git pull origin main

# 2. Make changes locally
# 3. Before commit: increment tipi_version and update timestamp
# 4. Commit with proper format
git add apps/[app-name]/
git commit -m "[gitmoji] [category]: [description] for [app-name]"
git push origin main
```

## 📋 Pre-commit checklist

### ⚠️ **CRITICAL: tipi_version and timestamp management**
> **Remember**: Every configuration change MUST increment tipi_version and update timestamp
> **Common mistake**: Forgetting to bump tipi_version after Docker image fixes or config changes

### ✅ Mandatory verifications before any commit
- [ ] **tipi_version incremented** (+1 from previous version) - **NEVER SKIP THIS**
- [ ] **updated_at timestamp** updated to current millis - **ALWAYS UPDATE**
- [ ] **Schema validation** passed (config.json + docker-compose.json)
- [ ] **Environment variables** correctly prefixed with APP_NAME_*
- [ ] **Documentation updated** to reflect configuration changes
- [ ] **Files staged** correctly (only modified app files)

### 🔍 Additional checks for new apps
- [ ] **Branch created** with `feat/add-[app-name]` format
- [ ] **All required files** present (config.json, docker-compose.json, description.md, logo.jpg)
- [ ] **README files updated** (main README.md + apps/README.md with counter incremented)
- [ ] **Official image verified** and ghcr.io preferred when available
- [ ] **PUID/PGID support** properly validated against original docker-compose.yml
- [ ] **Config.json property order** follows schema v2 specification
- [ ] **Description.md format** follows standardized template with badges and sections

## 🎓 Lessons learned and best practices

### 🚨 **Common pitfalls to avoid**
1. **Forgetting tipi_version bump**: Always increment after ANY configuration change
2. **Incorrect Docker image tags**: Verify upstream tags (e.g., `3.6.1` vs `v3.6.1`)
3. **Mixed commits**: Keep commits atomic - one logical change per commit
4. **Incomplete staging**: Only stage files related to the specific change
5. **Missing timestamp updates**: Always update `updated_at` with tipi_version

### 📈 **Improved workflow pattern**
```bash
# 1. Make technical changes first
git add apps/[app-name]/docker-compose.json
git commit -m "🔧 Fixed: correct Docker image tag from 3.6.1 to v3.6.1 for [app-name]"

# 2. THEN increment version (separate atomic commit)
git add apps/[app-name]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app-name] Docker image corrections"

# 3. Finally push all changes
git push origin main
```

### 💡 **Enhanced commit message templates**
```bash
# Docker image fixes
🔧 Fixed: correct Docker image tag from [old-tag] to [new-tag] for [app-name]

# Version management (always separate commit)
🔧 Fixed: increment tipi_version for [app-name] [change-description]

# Configuration improvements
🔄 Changed: prefix all environment variables with [APP_NAME]_ in [app-name]
🐛 Fixed: correct boolean types in [app-name] form fields
🩹 Fixed: schema validation errors in [app-name] config

# Documentation updates
📚 Docs: update [app-name] environment variables section
📝 Docs: add [feature] usage notes to [app-name] description
```

### 🔄 **Atomic commit examples for common scenarios**
```bash
# Scenario: Docker image tag correction + version bump
git commit -m "🔧 Fixed: correct Docker image tag from 3.6.1 to v3.6.1 for tinyauth"
git commit -m "🔧 Fixed: increment tipi_version for tinyauth Docker image corrections"

# Scenario: Environment variable prefixing + version bump
git commit -m "🔄 Changed: prefix all environment variables with SONARR_ in sonarr"
git commit -m "🔧 Fixed: increment tipi_version for sonarr variable prefixing"

# Scenario: Schema compliance + version bump
git commit -m "🩹 Fixed: schema validation errors in prowlarr config"
git commit -m "🔧 Fixed: increment tipi_version for prowlarr schema compliance"
```

## 🎨 Commit message standards

### 📝 Format: `[Gitmoji] [Category]: [Description] for [app-name]`

#### 🎯 Keep a Changelog categories
- **Added** - New features, apps, configurations
- **Changed** - Improvements, migrations, updates  
- **Fixed** - Bug fixes, corrections, compliance
- **Removed** - Deprecated features, cleanup
- **Security** - Security improvements, image updates
- **Docs** - Documentation, guides, descriptions

#### 🎨 Gitmoji mapping by category

```bash
# 🎉 ADDED - New applications and major features
🎉 Added: [app-name] application to tipi-store
✨ Added: webhook support configuration for [app-name]
📦 Added: environment variable [VAR_NAME] for [app-name]
🔧 Added: health check configuration for [app-name]

# ⚡ CHANGED - Improvements and modifications
⚡ Changed: migrate [app-name] to ghcr.io container registry
🔄 Changed: prefix all environment variables with [APP_NAME]_ in [app-name]
📈 Changed: improve health checks for [app-name]
🎨 Changed: optimize configuration structure for [app-name]

# 🔧 FIXED - Bug fixes and corrections
🔧 Fixed: remove unsupported PUID/PGID from [app-name] config
🐛 Fixed: correct boolean types in [app-name] form fields
🩹 Fixed: schema validation errors in [app-name] config
🚑 Fixed: critical configuration issue in [app-name]

# 🗑️ REMOVED - Deprecations and cleanup
🗑️ Removed: deprecated [VARIABLE_NAME] from [app-name]
🔥 Removed: unused volume mounts in [app-name]
💥 Removed: breaking change - [description] in [app-name]

# 🔒 SECURITY - Security improvements
🔒 Security: update [app-name] image to latest secure tag
🛡️ Security: enhance API key validation in [app-name]
🔐 Security: improve environment variable handling in [app-name]

# 📚 DOCS - Documentation updates
📚 Docs: update [app-name] environment variables section
📝 Docs: add PUID/PGID usage notes to [app-name] description
📖 Docs: improve [app-name] configuration guide
```

## 💡 Commit message examples by scenario

### 🆕 New application commits
```bash
# Initial integration
git commit -m "🎉 Added: paperless-ai application to tipi-store"

# Configuration and features
git commit -m "✨ Added: comprehensive API configuration for paperless-ai"
git commit -m "📦 Added: webhook support and custom prompts for paperless-ai"
git commit -m "🔧 Added: health checks and volume persistence for paperless-ai"

# Documentation
git commit -m "📚 Docs: add complete paperless-ai setup and configuration guide"
git commit -m "📝 Docs: document paperless-ai environment variables and usage"

# Fixes during development
git commit -m "🔧 Fixed: schema validation for paperless-ai config"
git commit -m "🐛 Fixed: correct PUID/PGID support validation in paperless-ai"
```

### 🔄 Application refactoring commits
```bash
# Migration improvements
git commit -m "⚡ Changed: migrate sonarr to ghcr.io container registry"
git commit -m "🔄 Changed: prefix all environment variables with SONARR_ in sonarr"

# Configuration fixes
git commit -m "🔧 Fixed: remove unsupported PUID/PGID from beszel config"
git commit -m "🐛 Fixed: correct boolean types in prowlarr form fields"
git commit -m "🩹 Fixed: schema compliance issues in tautulli config"

# Feature additions
git commit -m "✨ Added: webhook configuration support for overseerr"
git commit -m "📦 Added: custom timeout settings for radarr API"

# Documentation updates
git commit -m "📚 Docs: update plex environment variables documentation"
git commit -m "📝 Docs: add advanced configuration notes for transmission-vpn"

# Security improvements
git commit -m "🔒 Security: update recyclarr image to latest version"
git commit -m "🛡️ Security: enhance API validation in autobrr"

# Cleanup
git commit -m "🗑️ Removed: deprecated DEBUG_MODE variable from lubelogger"
git commit -m "🔥 Removed: unused configuration options in homebox"
```

## 📊 Multi-commit benefits

### ✅ **Advantages of multiple commits:**
- **Clearer history**: Each commit addresses one specific concern
- **Easier reviews**: Reviewers can understand changes step by step
- **Better debugging**: `git bisect` works more effectively with atomic commits
- **Selective rollbacks**: Can revert specific changes without affecting others
- **Improved traceability**: Clear understanding of what changed and why
- **Incremental progress**: Can pause/resume work at logical boundaries
- **Collaborative development**: Multiple people can work on different aspects

### 🎯 **Commit granularity guidelines:**
#### 🔬 **Atomic commits** (1 logical change each):
```bash
✨ Added: webhook URL configuration for sonarr
⚡ Changed: migrate sonarr to ghcr.io container registry  
🔧 Fixed: remove unsupported PUID/PGID from sonarr config
📚 Docs: update sonarr environment variables section
🔧 Fixed: increment tipi_version for sonarr changes
```

#### ⚠️ **Avoid mixed commits** (multiple unrelated changes):
```bash
# ❌ BAD - mixes multiple concerns
🔧 Fixed: update sonarr variables, migrate to ghcr.io, fix docs, and increment version

# ✅ GOOD - separate logical commits
⚡ Changed: prefix all environment variables with SONARR_ in sonarr
⚡ Changed: migrate sonarr to ghcr.io container registry
📚 Docs: update sonarr environment variables documentation
🔧 Fixed: increment tipi_version for sonarr refactoring
```

### 🚀 **Usage examples with multiple commits:**
#### Example 1: Using the multi-commit script
```bash
./multi-commit-app.sh prowlarr \
  'changed:variables:prefix all env vars with PROWLARR_' \
  'changed:docker:migrate to ghcr.io container registry' \
  'fixed:types:correct boolean field types' \
  'docs:update:environment variables documentation' \
  'fixed:version:increment tipi_version for changes'
```

#### Example 2: Interactive workflow
```bash
./interactive-commit.sh tautulli
# Guides you through each logical commit step by step
```

#### Example 3: Manual multi-commit workflow
```bash
# Stage and commit variable changes
git add apps/overseerr/config.json apps/overseerr/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with OVERSEERR_ in overseerr"

# Stage and commit Docker changes
git add apps/overseerr/docker-compose.json  
git commit -m "⚡ Changed: migrate overseerr to ghcr.io container registry"

# Stage and commit documentation
git add apps/overseerr/metadata/description.md
git commit -m "📚 Docs: update overseerr configuration and setup guide"

# Stage and commit version increment
git add apps/overseerr/config.json
git commit -m "🔧 Fixed: increment tipi_version for overseerr improvements"
```

## 🎯 Enhanced workflow summary

### 🔧 **Quick validation commands**
```bash
# Validate JSON syntax before commit
Get-Content 'apps/[app-name]/config.json' | ConvertFrom-Json | Out-Null
Get-Content 'apps/[app-name]/docker-compose.json' | ConvertFrom-Json | Out-Null

# Check current tipi_version
grep -o '"tipi_version": [0-9]*' apps/[app-name]/config.json

# Generate current timestamp (Unix milliseconds)
[DateTimeOffset]::Now.ToUnixTimeMilliseconds()
```

### 🚀 **Streamlined commit workflow**
```bash
# 1. Make and validate changes
# 2. Stage specific files
git add apps/[app-name]/[specific-file]
# 3. Commit with proper message
git commit -m "[gitmoji] [category]: [description] for [app-name]"
# 4. Repeat for each logical change
# 5. ALWAYS end with version bump if config changed
git add apps/[app-name]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app-name] [change-summary]"
```

### 📝 **Mandatory version bump scenarios**
- Docker image tag changes
- Environment variable modifications
- Configuration schema updates
- Health check adjustments
- Volume mount changes
- Port modifications
- Any docker-compose.json changes
- Any config.json form field updates
- Property reordering in config.json or docker-compose.json

### 📂 **Single-commit for new apps**
When adding a new application, you can use a single comprehensive commit:
```bash
git add apps/[app-name]/ README.md apps/README.md
git commit -m "feat: add [app-name] application to tipi-store"
git push origin main
```

### 🔀 **Separate commits by scope**
**IMPORTANT**: Always separate commits by their scope/purpose:

```bash
# ❌ BAD - mixing app changes with infrastructure changes
git add apps/lubelog-mcp/ .github/prompts/
git commit -m "feat: add lubelog-mcp and update prompts"

# ✅ GOOD - separate commits by scope
# 1. First commit: the new app
git add apps/lubelog-mcp/ README.md apps/README.md
git commit -m "feat: add lubelog-mcp application to tipi-store"

# 2. Second commit: documentation/infrastructure updates
git add .github/prompts/
git commit -m "docs: update prompts with lessons learned from lubelog-mcp"

# 3. Third commit (if any): workflow changes
git add .github/workflows/
git commit -m "ci: improve validation workflow"
```

**Scope separation rules:**
| Scope | Files | Commit prefix |
|-------|-------|---------------|
| **App** | `apps/[app-name]/`, `README.md`, `apps/README.md` | `feat:` or `fix:` |
| **Docs/Prompts** | `.github/prompts/`, `.github/copilot-instructions.md` | `docs:` |
| **CI/Workflows** | `.github/workflows/`, `.github/scripts/` | `ci:` |
| **Config** | `.github/renovate.json`, `.vscode/` | `chore:` |

---

**Objective**: Maintain a clean, professional Git history with clear traceability of all application changes in the tipi-store.
