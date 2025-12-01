# Copilot Instructions for tipi-store

## 🚀 Creating New Applications

When asked to create/add a new application to the store, **ALWAYS** follow the instructions in `.github/prompts/new-app.prompt.md`.

Key points to remember:
1. **Config.json property order** - Follow schema v2 order exactly ($schema, id, available, port, name, description, version, tipi_version, short_desc, author, source, website, categories, form_fields, exposable, no_gui, supported_architectures, uid, gid, dynamic_config, min_tipi_version, created_at, updated_at)
2. **Version consistency** - Same version in config.json and docker-compose.json (with v prefix if needed)
3. **Logo sources** - Check runtipi-appstore first, then related apps in this store, then official sources
4. **README updates** - Update BOTH `/README.md` AND `/apps/README.md` with new app and increment counters
5. **Description.md format** - Follow standardized format with badges, sections, and separators

## 📋 Committing Changes

When committing app changes, follow `.github/prompts/commit-app.prompt.md`.

## 🔍 Auditing Apps

When auditing/verifying apps, follow `.github/prompts/audit-apps.prompt.md`.

## 📁 Store Structure

- Each app is in `apps/{app-name}/`
- Required files: `config.json`, `docker-compose.json`, `metadata/description.md`, `metadata/logo.jpg`
- Schema v2: `https://schemas.runtipi.io/v2/app-info.json` and `https://schemas.runtipi.io/v2/dynamic-compose.json`
- Current app count: Check README.md for current total

## ⚠️ Common Mistakes to Avoid

- Forgetting to update README files
- Wrong property order in config.json
- Version mismatch between config.json and docker-compose.json
- Missing $schema in config.json
- Forgetting to increment "Total Applications" counter in apps/README.md
