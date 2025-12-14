# Claude Code Instructions for tipi-store

You are helping manage a custom AppStore for Runtipi.io with 35+ self-hosted applications. Each app requires strict standards and schema validation.

## Critical Files Reference

**Detailed guides** (in `.github/prompts/`):
- `new-app.prompt.md` (34KB) - Complete app addition guide with 90+ verification points
- `commit-app.prompt.md` (14KB) - Git workflow and commit standards
- `audit-apps.prompt.md` (16KB) - Quality verification procedures

**Quick commands** (in `.claude/commands/`):
- `/add-app` - Guided process to add new application
- `/commit-app` - Guided commit workflow with proper messages

## Core Rules (Never Skip)

### 1. Docker Image Verification
```bash
# ALWAYS verify tag exists before using
docker manifest inspect [image:tag]
```
- ✅ Prefer `ghcr.io` over Docker Hub when available
- ✅ Keep exact tag format (keep 'v' prefix if present: `v1.1.3`)
- ✅ Use clean tags without build numbers (`1.1.3` not `1.1.3-ls382`)
- ✅ Version MUST match exactly between config.json and docker-compose.json

### 2. Environment Variables
- ✅ **ALL variables MUST be prefixed**: `APPNAME_*` (e.g., `PAPERLESS_API_KEY`)
- ✅ Use `${VARIABLE}` syntax in docker-compose.json (NOT `{{VARIABLE}}`)
- ✅ Leverage built-in vars: `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}`, `${APP_DATA_DIR}`

### 3. config.json Requirements
- ✅ Follow schema v2 property order (25 properties in exact order)
- ✅ `tipi_version: 1` for new apps, increment +1 for ANY modification
- ✅ ALL `form_fields` MUST have `hint`
- ✅ `short_desc`: 4-5 words max (e.g., "AI document analyzer")
- ✅ Use native types: `true`/`false`, `8` (NOT `"true"`, `"8"`)
- ✅ Add `uid`/`gid` ONLY if PUID/PGID supported by image
- ✅ Current timestamps from https://currentmillis.com

### 4. docker-compose.json Requirements
- ✅ Array format: `"services": [...]` (NOT object)
- ✅ Main service: `"isMain": true` + `"internalPort": 8080`
- ✅ PUID/PGID: hardcoded `"1000"` strings (NOT variables)

### 5. README Updates (MOST FORGOTTEN!)
- ✅ Update `/README.md`: Add to table + increment counter
- ✅ Update `/apps/README.md`: Add to category + increment counter

### 6. Research Before Creating
**MANDATORY checks before creating files:**
1. Read official README.md thoroughly
2. Examine original `docker-compose.yml` (all env vars)
3. Check `.env.example` (comprehensive variable list)
4. Verify PUID/PGID support in docker-compose.yml
5. Check wiki/docs for features (webhooks, API keys, etc.)

## Required File Structure

Every app needs exactly these files:
```
apps/[app-name]/
├── config.json              # Tipi metadata + form fields
├── docker-compose.json      # Docker service definition (Runtipi v2 format)
└── metadata/
    ├── description.md       # Standardized markdown documentation
    └── logo.jpg            # Official logo (< 100KB)
```

## Schema v2 Property Order (config.json)

**CRITICAL**: Follow this exact order:
1. `$schema` 2. `id` 3. `available` 4. `port` 5. `name`
6. `description` 7. `version` 8. `tipi_version` 9. `short_desc` 10. `author`
11. `source` 12. `website` 13. `categories` 14. `url_suffix` (optional) 15. `form_fields`
16. `exposable` 17. `no_gui` (optional) 18. `supported_architectures` 19. `uid` (optional) 20. `gid` (optional)
21. `dynamic_config` 22. `min_tipi_version` 23. `created_at` 24. `updated_at` 25. `deprecated` (optional)

## Valid Categories

Choose from: `network`, `media`, `development`, `automation`, `social`, `utilities`, `photography`, `security`, `featured`, `books`, `data`, `music`, `finance`, `gaming`, `ai`

## Advanced Docker Properties (When Needed)

Runtipi supports 40+ Docker Compose properties. Use when appropriate:

**Security**: `capAdd`, `capDrop`, `securityOpt`, `devices`, `privileged`, `readOnly`
**Network**: `networkMode`, `extraHosts`, `dns`, `hostname`
**Resources**: `ulimits`, `shmSize`, `sysctls`, `tmpfs`
**Process**: `user`, `workingDir`, `entrypoint`, `command`, `pid`
**Container**: `tty`, `stdinOpen`, `stopSignal`, `stopGracePeriod`

Example for FUSE/filesystem apps:
```json
{
  "capAdd": ["SYS_ADMIN"],
  "securityOpt": ["apparmor:unconfined"],
  "devices": ["/dev/fuse:/dev/fuse"]
}
```

## Workflow

### Adding New App
1. Use `/add-app` slash command (recommended)
2. OR manually follow `.github/prompts/new-app.prompt.md`

### Modifying Existing App
1. Make changes
2. **CRITICAL**: Increment `tipi_version` (+1)
3. Update `updated_at` timestamp
4. Use `/commit-app` for proper commit messages

### Committing Changes
- New app: `🎉 Added: [app-name] application to tipi-store`
- Fix: `🔧 Fixed: [description] for [app-name]`
- Change: `🔄 Changed: [description] for [app-name]`
- Docs: `📚 Docs: [description] for [app-name]`

**Always increment tipi_version when:**
- Docker image tag changes
- Environment variables modified
- Config schema updates
- Health checks adjusted
- Volume mounts changed
- Port modifications
- ANY docker-compose.json changes
- ANY config.json form field updates

## Top 10 Critical Mistakes to Avoid

1. ❌ Forgetting to update README files
2. ❌ Not prefixing variables with `APPNAME_`
3. ❌ Forgetting to increment `tipi_version` on modifications
4. ❌ Version mismatch between config.json and docker-compose.json
5. ❌ Using `{{VARIABLE}}` instead of `${VARIABLE}`
6. ❌ Adding uid/gid without verifying PUID/PGID support
7. ❌ `short_desc` too long (> 5 words)
8. ❌ Missing `hint` in form_fields
9. ❌ Using strings for boolean/number types
10. ❌ Not verifying Docker tag exists

## Quick Commands

```bash
# Verify Docker image
docker manifest inspect [image:tag]

# Validate JSON
cat apps/[app]/config.json | jq .

# Check logo in runtipi-appstore
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg"

# Download logo
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg" -o "apps/[app]/metadata/logo.jpg"

# Get current timestamp
date +%s%3N
# Or visit: https://currentmillis.com
```

## Validation Checklist (Before Commit)

### Config.json
- [ ] $schema present, schema v2 property order
- [ ] tipi_version = 1 (new) or incremented (modification)
- [ ] ALL env_variable prefixed with `APPNAME_`
- [ ] All form_fields have `hint`
- [ ] short_desc ≤ 5 words
- [ ] Native types (boolean, number, not strings)
- [ ] Current timestamps
- [ ] uid/gid ONLY if PUID/PGID supported

### Docker-compose.json
- [ ] Array format: `"services": [...]`
- [ ] Main service: `"isMain": true` + `"internalPort"`
- [ ] Variables: `${VARIABLE}` syntax
- [ ] Version matches config.json exactly
- [ ] PUID/PGID hardcoded `"1000"` if applicable

### Metadata
- [ ] description.md follows standardized format
- [ ] Logo downloaded, valid, < 100KB

### README
- [ ] /README.md: table + counter updated
- [ ] /apps/README.md: category + counter updated

### Validation
- [ ] VS Code: 0 schema errors
- [ ] JSON syntax valid
- [ ] Docker tag verified with `manifest inspect`

## Examples to Study

**Simple apps** (good baseline):
- `apps/beszel/` - Minimal configuration
- `apps/homebox/` - Standard app

**Complex apps** (advanced reference):
- `apps/paperless-ai/` - Many form_fields
- `apps/paperless-ngx/` - Very comprehensive (400 lines)

---

For guided workflows, use:
- `/add-app` - Add new application
- `/commit-app` - Commit changes with proper messages

For detailed reference, see `.github/prompts/new-app.prompt.md`
