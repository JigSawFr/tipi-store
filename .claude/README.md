# Claude Code Instructions for tipi-store

Streamlined documentation for adding applications to tipi-store without missing critical steps.

## Quick Start

### Add New Application
```
/add-app
```
Guided workflow with all templates and validation built-in.

### Commit Changes
```
/commit-app
```
Proper Git workflow with formatted commit messages.

## File Structure

```
.claude/
├── README.md                    # This file
├── instructions.md              # Core rules and quick reference
└── commands/
    ├── add-app.md              # /add-app slash command
    └── commit-app.md           # /commit-app slash command
```

## Documentation Hierarchy

### Level 1: Quick Commands (Use These First!)
- **`/add-app`** - Complete guided workflow for new apps
- **`/commit-app`** - Guided commit process with proper messages

### Level 2: Quick Reference
- **`instructions.md`** - Core rules, validation checklist, common mistakes

### Level 3: Detailed Guides (When You Need Deep Dive)
Located in `.github/prompts/`:
- **`new-app.prompt.md`** (34KB) - Comprehensive app addition guide with 90+ checks
- **`commit-app.prompt.md`** (14KB) - Git workflow and commit standards in detail
- **`audit-apps.prompt.md`** (16KB) - Quality verification procedures

## Critical Rules

### Never Skip These

1. **Docker Image**: Verify with `docker manifest inspect [image:tag]`
2. **Variables**: ALL must be prefixed `APPNAME_*`
3. **tipi_version**: `1` for new apps, increment +1 for ANY modification
4. **README Updates**: Update BOTH `/README.md` AND `/apps/README.md`
5. **Research First**: Read docs, check docker-compose.yml, verify PUID/PGID

### Required Files (Every App)
```
apps/[app-name]/
├── config.json              # Tipi metadata + form fields
├── docker-compose.json      # Docker service (Runtipi v2 format)
└── metadata/
    ├── description.md       # Standardized documentation
    └── logo.jpg            # Official logo (< 100KB)
```

### Schema v2 Property Order (config.json)
1. $schema 2. id 3. available 4. port 5. name 6. description 7. version
8. tipi_version 9. short_desc 10. author 11. source 12. website 13. categories
14. url_suffix 15. form_fields 16. exposable 17. no_gui 18. supported_architectures
19. uid 20. gid 21. dynamic_config 22. min_tipi_version 23. created_at 24. updated_at

## Top 10 Mistakes to Avoid

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

# Check logo availability
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg"

# Download logo
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg" -o "apps/[app]/metadata/logo.jpg"

# Get timestamp
date +%s%3N
# Or: https://currentmillis.com
```

## Validation Checklist (Before Commit)

**Config.json**:
- [ ] Schema v2 property order ✓
- [ ] tipi_version = 1 (new) or incremented ✓
- [ ] ALL env_variable prefixed APPNAME_ ✓
- [ ] All form_fields have hint ✓
- [ ] short_desc ≤ 5 words ✓
- [ ] Native types (boolean, number) ✓

**Docker-compose.json**:
- [ ] Array format: `"services": [...]` ✓
- [ ] Main service: `"isMain": true` + `"internalPort"` ✓
- [ ] Variables: `${VARIABLE}` syntax ✓
- [ ] Version matches config.json ✓

**Metadata**:
- [ ] description.md standardized format ✓
- [ ] Logo valid < 100KB ✓

**README**:
- [ ] /README.md updated (table + counter) ✓
- [ ] /apps/README.md updated (category + counter) ✓

**Validation**:
- [ ] VS Code: 0 schema errors ✓
- [ ] JSON syntax valid ✓
- [ ] Docker tag verified ✓

## Examples to Study

**Simple apps**: `apps/beszel/`, `apps/homebox/`
**Complex apps**: `apps/paperless-ai/`, `apps/paperless-ngx/`

## Workflow

### Adding New App
1. Type `/add-app`
2. Follow guided process
3. Validate with checklist
4. Commit and push

### Modifying Existing App
1. Make changes
2. Increment `tipi_version` (+1)
3. Update `updated_at` timestamp
4. Type `/commit-app`
5. Push changes

## Support

- **Quick help**: Read `instructions.md`
- **Detailed reference**: Check `.github/prompts/new-app.prompt.md`
- **Issues**: [GitHub Issues](https://github.com/JigSawFr/tipi-store/issues)

---

**For guided workflows, always start with the slash commands:** `/add-app` or `/commit-app`
