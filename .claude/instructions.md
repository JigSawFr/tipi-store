# Claude Code Instructions for tipi-store

You are helping manage a custom AppStore for Runtipi.io with 35+ self-hosted applications. Each app requires strict standards and schema validation.

## Critical Files Reference

**Detailed guides** (in `.github/prompts/`):
- `new-app.prompt.md` (34KB) - Complete app addition guide with 90+ verification points
- `commit-app.prompt.md` (14KB) - Git workflow and commit standards
- `audit-apps.prompt.md` (16KB) - Quality verification procedures

**Quick commands** (in `.claude/commands/`):

*Basic Commands:*
- `/add-app` - Guided process to add new application
- `/update-version` - Update app Docker image version (60% of commits)
- `/validate` - Comprehensive validation before committing
- `/fix-app` - Detect and fix common configuration issues
- `/commit-app` - Guided commit workflow with proper messages

*Workflow Commands (Orchestrated):*
- `/add-app-complete` - Complete workflow: create → validate → commit
- `/update-and-commit` - Update version → validate → auto-commit (fastest!)

*Utility Commands:*
- `/check-updates` - Check for available updates (all apps or specific)
- `/compare-apps` - Compare two apps to learn patterns

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

## Tool Usage Guidelines

### Use Task Tool When:
- Exploring codebase structure (multiple files)
- Complex searches requiring context
- Multi-step research operations
- Searching for patterns across many files
- Need to understand how something works globally

**Example:** "How does authentication work in this repo?"

### Use Read Tool Directly When:
- Reading specific known file path
- Looking at example apps to learn patterns
- Checking existing configurations
- Viewing documentation files

**Example:** Reading `apps/beszel/config.json` for reference

### Use Grep Tool Directly When:
- Simple keyword search in known location
- Finding specific pattern
- Searching for variable usage

**Example:** Finding where `PAPERLESS_API_KEY` is used

### Use Bash Tool Directly When:
- Validating JSON: `cat file | jq .`
- Verifying Docker tags: `docker manifest inspect [image:tag]`
- Git operations: `git status`, `git diff`
- Getting timestamps: `date +%s%3N`

**Example:** Verifying a Docker tag exists before using it

## Multi-Service Apps Pattern

When app requires database or additional services:

### Main Service
```json
{
  "name": "app-name",
  "image": "ghcr.io/owner/app:1.0.0",
  "isMain": true,              // ← Required for main service
  "internalPort": 8080,        // ← Port for web UI
  "dependsOn": ["app-db"],     // ← Wait for database
  "environment": [
    {
      "key": "DATABASE_HOST",
      "value": "app-db"        // ← Reference service name
    }
  ]
}
```

### Dependent Service (Database)
```json
{
  "name": "app-db",
  "image": "postgres:16",
  "environment": [
    {
      "key": "POSTGRES_PASSWORD",
      "value": "${APPNAME_DB_PASSWORD}"
    }
  ],
  "volumes": [
    {
      "hostPath": "${APP_DATA_DIR}/db",
      "containerPath": "/var/lib/postgresql/data"
    }
  ]
}
```

**Key points:**
- Only main service has `isMain: true` and `internalPort`
- Use `dependsOn` to control startup order
- Services communicate using service names as hostnames
- Each service can have separate volumes

## Common Troubleshooting

### Issue: Schema Validation Errors

**Symptoms:** VS Code shows schema errors, validation fails

**Solutions:**
1. Check property order (must follow schema v2 exact order)
2. Verify native types used (not strings for boolean/number)
3. Ensure all required fields present
4. Run `/validate` to identify issues
5. Run `/fix-app` to auto-correct common issues

**Example:**
```json
// ❌ Wrong
"default": "true"

// ✅ Correct
"default": true
```

### Issue: Docker Tag Not Found

**Symptoms:** `docker manifest inspect` fails, image pull errors

**Solutions:**
1. Check tag format - does it need 'v' prefix?
2. Verify image registry (ghcr.io vs docker.io vs lscr.io)
3. Check release exists on GitHub
4. Try browsing to container registry URL

**Example:**
```bash
# Try with v prefix
docker manifest inspect ghcr.io/owner/app:v1.2.0

# Try without v prefix
docker manifest inspect ghcr.io/owner/app:1.2.0
```

### Issue: Variables Not Working

**Symptoms:** App can't read environment variables, configuration fails

**Solutions:**
1. Verify prefixed with `APPNAME_` in config.json
2. Check syntax: `${VAR}` not `{{VAR}}` in docker-compose.json
3. Ensure variable in BOTH config.json form_fields AND docker-compose.json environment
4. Check spelling matches exactly

**Example:**
```json
// config.json
"env_variable": "SONARR_API_KEY"

// docker-compose.json
"key": "API_KEY",
"value": "${SONARR_API_KEY}"  // ← Must match exactly
```

### Issue: App Won't Start

**Symptoms:** Container exits, health check fails

**Solutions:**
1. Check logs: `docker logs [container-name]`
2. Verify all required environment variables present
3. Check volume permissions
4. Verify PUID/PGID if used
5. Check for port conflicts

### Issue: Version Mismatch

**Symptoms:** Validation fails on version check

**Solutions:**
1. Ensure EXACT match between files
2. Account for 'v' prefix: config="1.2.0" can match compose="v1.2.0"
3. Run `/fix-app` to detect and fix mismatch
4. Always increment tipi_version when fixing

## Workflow

### Adding New App (~20% of tasks)
1. Use `/add-app` slash command (recommended)
2. Follow guided process with validation
3. Commit with `/commit-app`

**Alternative:** Manually follow `.github/prompts/new-app.prompt.md`

### Updating App Version (~60% of tasks)
1. Use `/update-version` slash command (recommended)
2. Provide app name and new version
3. Claude verifies Docker tag, updates files, increments tipi_version
4. Auto-generates commit message: `chore(deps): update [image] to [version]`
5. Commit and push

**Alternative:** Manual update + `/commit-app`

### Fixing App Issues (~20% of tasks)
1. Use `/validate` to detect issues
2. Use `/fix-app` to auto-correct common problems
3. Review changes with `git diff`
4. Commit with `/commit-app`

**Alternative:** Manual fixes + validation

### General Modification Workflow
1. Make changes
2. **CRITICAL**: Increment `tipi_version` (+1)
3. Update `updated_at` timestamp
4. Run `/validate` to check for errors
5. Use `/commit-app` for proper commit messages

### Commit Message Patterns
- **New app**: `🎉 Added: [app-name] application to tipi-store`
- **Version update**: `chore(deps): update [image] docker tag to [version]`
- **Fix**: `🔧 Fixed: [description] for [app-name]`
- **Change**: `🔄 Changed: [description] for [app-name]`
- **Docs**: `📚 Docs: [description] for [app-name]`

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

## Available Slash Commands

**Primary Workflows:**
- `/add-app` - Add new application (complete guided process)
- `/update-version` - Update Docker image version (most common task)
- `/validate` - Comprehensive validation before committing
- `/fix-app` - Detect and auto-fix common issues
- `/commit-app` - Commit changes with proper messages

**When to Use Each:**
- **New app?** → `/add-app`
- **Update version?** → `/update-version`
- **Not sure if ready?** → `/validate`
- **Have errors?** → `/fix-app`
- **Ready to commit?** → `/commit-app`

For detailed reference, see `.github/prompts/new-app.prompt.md`
