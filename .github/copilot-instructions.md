# Copilot Instructions for tipi-store

A custom Runtipi app store with 35+ self-hosted applications.

## 🎯 Quick Commands (Prompts)

Use these prompts for common tasks (available in `.github/prompts/`):

| Command | Description | Usage |
|---------|-------------|-------|
| `add-app-complete` | Add new app with validation + commit | 60% of work |
| `update-and-commit` | Update version + validate + commit | 30% of work |
| `validate-app` | Check config before committing | Before any commit |
| `fix-app` | Auto-fix common issues | When validation fails |
| `check-updates` | Find available Docker updates | Maintenance |
| `compare-apps` | Learn patterns from existing apps | Learning |

**How to use**: Reference the prompt file or describe the task (e.g., "add ygege app" triggers add-app-complete workflow)

## 🏗️ Architecture Overview

```
apps/{app-name}/
├── config.json              # Tipi metadata (schema v2)
├── docker-compose.json      # Dynamic compose (schema v2)
└── metadata/
    ├── description.md       # Standardized docs with badges
    └── logo.jpg             # Official logo (< 100KB)
```

## 🚀 Creating New Applications

**Follow `.github/prompts/new-app.prompt.md` exactly.** Key requirements:

1. **Verify Docker image first**: `docker manifest inspect image:tag`
2. **Prefer ghcr.io** over Docker Hub when available
3. **Variable naming**: ALL env vars must be prefixed `APPNAME_*` (e.g., `RADARR_API_KEY`)
4. **tipi_version**: Always `1` for new apps
5. **Timestamps**: Use `[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()` for `created_at`/`updated_at`
6. **Logo sources**: Check runtipi-appstore first, then official GitHub repo

### config.json Property Order (MANDATORY)
```
$schema → id → available → port → name → description → version → tipi_version →
short_desc → author → source → website → categories → form_fields → exposable →
no_gui → supported_architectures → uid → gid → dynamic_config → min_tipi_version →
created_at → updated_at
```

### docker-compose.json Requirements
- Use `"services": [...]` array format with `"isMain": true` for primary service
- Use `"internalPort"` for Traefik routing (NOT `"addPorts"`)
- Variable syntax: `${VARIABLE}` (NOT `{{VARIABLE}}`)
- Built-in vars: `${TZ}`, `${APP_DATA_DIR}`, `${APP_DOMAIN}`, `${APP_PROTOCOL}`

## 📝 Modifying Existing Apps

**CRITICAL**: Every modification MUST:
1. Increment `tipi_version` by +1
2. Update `updated_at` timestamp
3. Follow commit format: `🔧 Fixed: [description] for [app-name]`

## 📋 README Updates (NEVER SKIP)

When adding/removing apps, update BOTH:
- `/README.md` - App table + counter in title + TOC anchor
- `/apps/README.md` - Category list + add app to appropriate section

## ✅ Validation Checklist

Before committing:
- [ ] `docker manifest inspect` confirms image/tag exists
- [ ] All form_fields have `hint` property
- [ ] `short_desc` ≤ 5 words
- [ ] Version matches between config.json and docker-compose.json
- [ ] uid/gid ONLY if image supports PUID/PGID
- [ ] No schema validation errors in VS Code

## ⚠️ Common Mistakes

| Mistake | Correct |
|---------|---------|
| `{{VAR}}` syntax | `${VAR}` |
| `addPorts` for main service | `internalPort` |
| Version `3.6.1` when tag is `v3.6.1` | Match exact tag |
| Forgetting `tipi_version` increment | Always +1 on changes |
| Missing README updates | Update BOTH READMEs |

## 🔧 Useful Commands

```powershell
# Verify Docker tag
docker manifest inspect ghcr.io/org/image:tag

# Get timestamp
[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()

# Download logo from runtipi-appstore
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/{app}/metadata/logo.jpg" -o "apps/{app}/metadata/logo.jpg"
```

## 📚 Reference Examples

- **Simple app**: `apps/beszel/` - minimal config, no form fields
- **Complex app**: `apps/paperless-ngx/` - multiple services, many form fields
- **With database**: `apps/readur/` - PostgreSQL + main service pattern
