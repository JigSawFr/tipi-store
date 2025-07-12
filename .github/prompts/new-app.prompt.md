---
mode: agent
---

# 🚀 Add a new application to tipi-store

Add the **{{APPLICATION_NAME}}** application (link to documentation/official site) based 5. **Optimal form fields**
- [ ] All important parameters configurable
- [ ] Explanatory hints for each field
- [ ] Appropriate types (text, password, boolean, number)
- [ ] Predefined options if applicable
- [ ] Sensible default values with native types
- [ ] Min/max validation for numbers
- [ ] Grouped labeling for related settings
- [ ] **short_desc follows strict 4-5 word maximum rule** applications in the tipi-store.

## 📋 Required specifications

### 🏗️ Mandatory structure
- `apps/[app-name]/config.json` - Tipi configuration with detailed form_fields
- `apps/[app-name]/docker-compose.json` - Optimized Docker configuration
- `apps/[app-name]/metadata/description.md` - Standardized documentation
- `apps/[app-name]/metadata/logo.jpg` - Official logo downloaded

### 🔧 Technical validations
- **Docker Image**: Verify official image, correct tags, WITHOUT "v" prefix
- **Image preference**: Prefer GitHub Container Registry (ghcr.io) over Docker Hub when available
- **Version consistency**: Ensure EXACT version match between config.json and docker-compose.json
- **Tag format**: Use clean version tags without build numbers (e.g., `31.0.6` not `31.0.6-ls382`)
- **Tag verification**: Always verify tag exists on registry before using
- **Environment variables**: Check PUID/PGID support via official documentation AND docker-compose.yml
- **Variable syntax**: Use `"${VARIABLE}"` format in docker-compose.json (NOT `"{{VARIABLE}}"`)
- **Runtipi built-in vars**: Leverage `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}` for auto-detection
- **Service architecture**: Mark main service with `"isMain": true` and use `"internalPort"`
- **tipi_version**: Always 1 for a new application, increment by +1 before each commit to GitHub
- **Timestamps**: Use https://currentmillis.com for `created_at` and `updated_at`
- **uid/gid**: Add to config.json ONLY if PUID/PGID supported by image
- **Schema compliance**: Follow official Runtipi schemas (app-info.json, dynamic-compose.json)
- **Volume structure**: Use `${APP_DATA_DIR}/data` for single volume, `${APP_DATA_DIR}/data/<folder>` for multiple volumes
- **Documentation verification**: Always check wiki/documentation for missing features (webhooks, API keys, etc.)

### 📝 config.json configuration
```json
{
  "name": "AppName",
  "id": "app-name",
  "available": true,
  "short_desc": "Concise app description (max 4-5 words)",
  "author": "OriginalAuthor",
  "port": 8080,
  "categories": ["category1", "category2"],
  "description": "Detailed description...",
  "tipi_version": 1,
  "version": "x.y.z",
  "source": "https://github.com/...",
  "exposable": true,
  "supported_architectures": ["arm64", "amd64"],
  "created_at": 1750582018046,
  "updated_at": 1750582018046,
  "dynamic_config": true,
  "form_fields": [
    {
      "type": "text|password|email|number|boolean|fqdn|ip|url|random",
      "label": "Descriptive label",
      "hint": "Helpful explanation",
      "required": true,
      "env_variable": "APP_VARIABLE_NAME",
      "default": "value", // Use native types: true/false for boolean, 8 for number
      "min": 1, // For number type
      "max": 100, // For number type
      "options": [{"label": "Display", "value": "internal"}] // For select lists
    }
  ]
}
```

**Form field best practices:**
- **Variable naming**: Always prefix with APP_NAME (e.g., PAPERLESS_AI_API_URL)
- **Auto-detection defaults**: Use `${APP_PROTOCOL}://${APP_DOMAIN}` for URL auto-detection in docker-compose.json, NOT in config.json defaults
- **Timezone inheritance**: Use `${TZ}` to inherit system timezone automatically
- **Random passwords**: Use `"type": "random"` with `"encoding": "hex"` for secure auto-generated passwords
- **Placeholder examples**: Add `"placeholder"` fields for better UX (e.g., `"https://auth.yourdomain.com"`)
- **Website field**: Always add `"website"` field when available for better discoverability
- **Short descriptions**: Keep short_desc concise and impactful (MAXIMUM 4-5 words, focus on core function)
  - ✅ Perfect: "Self-hosted cloud platform", "AI document analyzer", "Media streaming server", "Personal finance tracker", "Code repository manager"
  - ✅ Good: "Document management system", "Password manager app", "Network monitoring tool"
  - ❌ Too long: "Secure self-hosted file sync and collaboration platform" (11 words)
  - ❌ Too vague: "Great application for users" (generic, not descriptive)
  - ❌ Too technical: "RESTful API gateway with microservices orchestration" (complex jargon)
  - **Rule**: Core function + context (if space allows). Avoid marketing language.
- Use native data types: `true`/`false` for booleans, `8` for numbers, not strings
- Include `min`/`max` validation for number fields
- Provide helpful `hint` for each field
- Group related fields with consistent labeling (e.g., "DNS Settings >", "Security >")
- Use `options` array for predefined choices
```

### 🐳 docker-compose.json configuration
- **Service structure**: Use array format with `"isMain": true` for primary service
- **Port configuration**: Use `"internalPort"` instead of `"addPorts"` for main service
- **Variable syntax**: Use `"${VARIABLE}"` format (NOT `"{{VARIABLE}}"`)
- **Auto-detection patterns**: Use `"${VAR:-${DEFAULT}}"` for fallback values
- **Built-in variables**: Leverage `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}`, `${APP_DATA_DIR}`
- Environment variables aligned with form_fields
- Appropriate volumes according to application
- Verified official image
- **Version consistency**: Use EXACT same version as config.json (e.g., `31.0.6` not `31.0.6-ls382`)
- **Clean tags**: Avoid build numbers, use clean version tags only
- Health checks when applicable
- **Multi-service apps**: Use `"dependsOn": ["service-name"]` for service dependencies
- **Read-only security**: Add `"readOnly": true` when supported by image
- Use native data types (boolean, number) not strings
- Follow volume pattern: single=`${APP_DATA_DIR}/data`, multiple=`${APP_DATA_DIR}/data/<folder>`

**Docker-compose.json structure example:**
```json
{
  "services": [
    {
      "name": "app-name",
      "image": "vendor/image:version",
      "isMain": true,
      "internalPort": 8080,
      "readOnly": true,
      "environment": {
        "APP_URL": "${APP_NAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}",
        "TZ": "${TZ}",
        "VARIABLE": "${APP_NAME_VARIABLE}"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ],
      "healthCheck": {
        "test": "curl -f http://localhost:8080/health",
        "interval": "30s",
        "timeout": "10s",
        "retries": 3
      }
    }
  ]
}
```

### 📖 description.md documentation
Standardized format with mandatory sections:
```markdown
# APP_NAME

[GitHub badges]

Short description.

---

## 📖 SYNOPSIS
## ✨ MAIN FEATURES  
## 🌟 ADVANTAGES
## 🐳 DOCKER IMAGE DETAILS
## 📁 VOLUMES
## 🗃️ DEFAULT PARAMETERS
## 📝 ENVIRONMENT
## ⚠️ IMPORTANT
## 💾 SOURCE
## ❤️ PROVIDED WITH LOVE
```

### 🎨 Official logo
**Priority order for logo sources:**
1. **First**: Check if logo exists in runtipi-appstore: `https://github.com/runtipi/runtipi-appstore/tree/master/apps/[app-name]/metadata/logo.jpg`
2. **If found**: Download from runtipi-appstore: `curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"`
3. **If not found**: Download from official site/GitHub repository
- Named `logo.jpg`
- Reasonable size (< 100KB recommended)
- **Always verify logo exists before using**: Test URL accessibility

### 🎨 Logo verification and download process

**Step 1: Check runtipi-appstore first**
```bash
# Check if logo exists in official runtipi-appstore
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg"

# If HTTP 200 (exists), download it:
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"
```

**Step 2: If not found, use official sources**
```bash
# Download from official website or GitHub
curl -L "[official-logo-url]" -o "apps/[app-name]/metadata/logo.jpg"

# Verify file size (should be < 100KB)
ls -la apps/[app-name]/metadata/logo.jpg
```

**Logo verification checklist:**
- [ ] Logo exists in runtipi-appstore (check first)
- [ ] If not found, obtained from official source
- [ ] File named exactly `logo.jpg`
- [ ] File size < 100KB (recommended)
- [ ] Image quality appropriate for UI display
- [ ] Downloads successfully with curl command

## 🔍 Mandatory verification points

### 1. Official schemas compliance
- [ ] Validate against `https://schemas.runtipi.io/app-info.json`
- [ ] Validate against `https://schemas.runtipi.io/dynamic-compose.json`
- [ ] Use VS Code with schema validation enabled

### 2. Docker Image
- [ ] **Prefer GitHub Container Registry (ghcr.io) packages over Docker Hub when available**
- [ ] Verify image existence on official registry
- [ ] Confirm available versions/tags
- [ ] Verify absence of "v" prefix in tags
- [ ] **Test tag availability with clean version format (no build numbers)**
- [ ] **Ensure version consistency between config.json and docker-compose.json**
- [ ] Test supported environment variables
- [ ] **Check PUID/PGID support in BOTH documentation AND original docker-compose.yml**
- [ ] **Examine original .env.example for additional variables**

### 3. Environment variables
- [ ] **Always prefix ALL variables with APP_NAME (e.g., PAPERLESS_AI_*)**
- [ ] **Use correct variable syntax `"${VARIABLE}"` in docker-compose.json**
- [ ] **Leverage Runtipi built-ins: `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}`**
- [ ] **Use auto-detection patterns: `"${VAR:-${DEFAULT}}"` for fallback values**
- [ ] Read official documentation thoroughly
- [ ] **Check wiki/documentation for advanced features (webhooks, API keys, system prompts)**
- [ ] Verify PUID/PGID support (often not supported)
- [ ] **Examine original .env.example file for comprehensive variable list**
- [ ] **Examine original docker-compose.yml for missing environment variables**
- [ ] List all configurable variables
- [ ] Define appropriate default values
- [ ] Use native data types in form_fields
- [ ] **Add placeholders for better UX**
- [ ] **Use "type": "random" with "encoding": "hex" for secure passwords**

### 4. Ports and volumes
- [ ] Application default port
- [ ] **Use `"internalPort"` for main service, not `"addPorts"`**
- [ ] **Mark main service with `"isMain": true`**
- [ ] Required volumes for persistence
- [ ] Correct container paths
- [ ] Follow volume naming convention
- [ ] **Add `"readOnly": true` when supported for security**
- [ ] Add health checks when possible
- [ ] **Use `"dependsOn": ["service"]` for multi-service dependencies**
- [ ] Configure external ports via `addPorts` only for additional services

### 5. Optimal form fields
- [ ] All important parameters configurable
- [ ] Explanatory hints for each field
- [ ] Appropriate types (text, password, boolean, number)
- [ ] Predefined options if applicable
- [ ] Sensible default values with native types
- [ ] Min/max validation for numbers
- [ ] Grouped labeling for related settings

## 🛠️ Schema validation setup

Configure VS Code for automatic validation by ensuring `.vscode/settings.json` contains:

```json
{
  "json.schemas": [
    {
      "fileMatch": [
        "**/apps/*/config.json"
      ],
      "url": "https://schemas.runtipi.io/app-info.json"
    },
    {
      "fileMatch": [
        "**/apps/*/docker-compose.json"
      ],
      "url": "https://schemas.runtipi.io/dynamic-compose.json"
    }
  ]
}
```

This provides real-time validation and IntelliSense for both config.json and docker-compose.json files.

## 📋 Creation process

1. **Preliminary research**
   - Analyze official documentation and GitHub repository
   - **Check for GitHub Container Registry packages (ghcr.io) first, then Docker Hub**
   - **Check wiki/documentation for ALL features (webhooks, integrations, API endpoints)**
   - Identify official Docker image and verify tags
   - **Examine original docker-compose.yml AND .env.example files**
   - List environment variables and their types
   - Check PUID/PGID support in documentation AND docker files
   - Review health check possibilities

2. **Schema validation setup**
   - Ensure VS Code has schema validation configured
   - Reference official Runtipi schemas for validation
   - Prepare data type mappings (string → boolean/number)

3. **Structure creation**
   - Create `apps/[app-name]` and `metadata/` folders
   - **Generate config.json with ALL variables prefixed with APP_NAME**
   - Generate config.json with complete form_fields using native types
   - **Add uid/gid ONLY if PUID/PGID supported (verify in original docker-compose.yml)**
   - Create optimized docker-compose.json with health checks
   - Follow volume naming conventions

4. **Documentation and assets**
   - Write description.md following standard format
   - **Logo download priority**: 
     1. Check runtipi-appstore first: `https://github.com/runtipi/runtipi-appstore/tree/master/apps/[app-name]/metadata/`
     2. If exists, download: `curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"`
     3. If not found, download from official source (< 100KB recommended)
   - Update volume paths in documentation

5. **Integration and testing**
   - Add to main README (table + counter)
   - Add to apps README (`apps/README.md`) in appropriate category
   - Test JSON syntax validation
   - Verify schema compliance

6. **Final validation**
   - Run schema validation tools
   - Test environment variables consistency
   - **Verify ALL environment variables are prefixed with APP_NAME**
   - **Verify EXACT version match between config.json and docker-compose.json**
   - **Check Docker tag exists and uses clean format (no build numbers)**
   - **Validate short_desc is 4-5 words maximum and follows guidelines**
   - **Check description.md is updated with correct variable names**
   - Validate complete structure
   - Verify all native data types are used correctly

7. **Pre-commit preparation**
   - **Increment tipi_version by +1 before committing to GitHub**
   - Update `updated_at` timestamp with current millis
   - Final schema validation check
   - **Create feature branch for new app: `feat/add-[app-name]`**
   - Follow commit standards (see commit-app.prompt.md)
   - Push to repository and create Pull Request

## 🔄 Git workflow for new applications

```bash
# New application workflow:
1. Create feature branch: git checkout -b feat/add-[app-name]
2. Make all changes for the new app
3. Test functionality locally
4. Before committing:
   - Increment tipi_version to 1 in config.json
   - Update updated_at timestamp
   - Run final validations
5. Follow commit message standards from commit-app.prompt.md
6. Push branch and create Pull Request for review

# Example workflow:
git checkout -b feat/add-paperless-ai
# ... make all changes ...
git add apps/paperless-ai/
git commit -m "🎉 Added: paperless-ai application to tipi-store"
git commit -m "✨ Added: comprehensive configuration options for paperless-ai"
git commit -m "📚 Docs: add complete paperless-ai documentation"
git push origin feat/add-paperless-ai
# Create Pull Request
```

### 📝 Commit message standards (see commit-app.prompt.md)

For detailed commit standards, branch management, and automated workflows, refer to the dedicated **commit-app.prompt.md** file which covers:
- Branch strategy for new apps vs. modifications
- Complete Gitmoji + Keep a Changelog mapping
- Pre-commit checklists and validation
- Automated commit scripts
- Pull Request workflow

## 🎯 Objective

"Perfect" configuration allowing:
- One-click installation
- Complete configuration via interface
- Compliance with tipi-store standards
- Clear and professional documentation
- Perfect integration in the ecosystem

## ⚠️ Important constraints

- **Docker image preference**: Always prefer GitHub Container Registry (ghcr.io) over Docker Hub when available
- **Version consistency**: Ensure EXACT version match between config.json and docker-compose.json
- **Clean tag format**: Use clean version tags without build numbers (e.g., `31.0.6` not `31.0.6-ls382`)
- **Tag verification**: Always verify tag exists on registry before configuration
- **Short descriptions**: Keep short_desc concise and impactful (STRICT 4-5 words maximum)
  - Focus on core function, avoid marketing language
  - Examples: "Self-hosted cloud platform", "AI document analyzer", "Personal finance tracker"
  - Forbidden: Long descriptions, generic terms, complex jargon
- **Environment variable prefixing**: ALWAYS prefix ALL env_variables with APP_NAME (e.g., PAPERLESS_AI_*)
- **PUID/PGID verification**: Check original docker-compose.yml, add uid/gid ONLY if supported
- **Documentation completeness**: Always verify wiki/docs for missing features (API keys, webhooks, etc.)
- **Never uid/gid** in config.json if PUID/PGID not supported
- **tipi_version always 1** for new apps, **increment by +1** before each commit to GitHub
- **Current timestamps** via currentmillis.com
- **Verified Docker image** and correct tags
- **Standardized documentation** according to established format
- **Exhaustive form fields** for optimal configuration
- **Native data types**: Use `true`/`false` for booleans, numbers for numeric values
- **Volume conventions**: Single volume = `${APP_DATA_DIR}/data`, Multiple = `${APP_DATA_DIR}/data/<folder>`
- **Schema compliance**: All files must validate against official Runtipi schemas
- **Health checks**: Add when applicable for better monitoring
- **Port management**: Use `addPorts` for external service ports (not web UI)
- **Final documentation check**: Ensure description.md reflects ALL configuration options

## 📚 Valid categories

When choosing categories for your application, use only these valid values:
- `network` - Network tools, DNS, VPN, proxies
- `media` - Media servers, streaming, entertainment
- `development` - Development tools, IDEs, version control
- `automation` - Home automation, IoT, smart home
- `social` - Communication, chat, social networks
- `utilities` - General purpose tools, system utilities
- `photography` - Photo management, editing, galleries
- `security` - Security tools, monitoring, firewalls
- `featured` - Featured/recommended applications
- `books` - E-books, reading, libraries
- `data` - Databases, data management, analytics
- `music` - Music servers, players, management
- `finance` - Financial tools, budgeting, accounting
- `gaming` - Gaming servers, game management
- `ai` - AI tools, machine learning, automation

**Example combinations:**
- Plex: `["media", "featured"]`
- Sonarr: `["media", "automation"]`

## 🎯 Common patterns and examples

### MANDATORY verification checklist (based on real implementations)
1. **Check for GitHub Container Registry (ghcr.io) packages first**
2. **Examine original docker-compose.yml for PUID/PGID support AND missing variables**
3. **Check original .env.example for complete variable list**
4. **Review wiki/documentation for advanced features**
5. **Prefix ALL variables with APP_NAME**
6. **Verify EXACT version consistency between config.json and docker-compose.json**
7. **Use clean version tags without build numbers**
8. **Test Docker tag availability on registry**
9. **Use correct Runtipi docker-compose format (services array, not object)**
10. **Leverage built-in variables for auto-detection**

### Docker-compose syntax comparison
```json
// ❌ WRONG - Old Docker Compose format
{
  "version": "3.8",
  "services": {
    "app": {
      "ports": ["{{RUNTIPI_APP_PORT}}:8080"],
      "environment": {
        "VAR": "{{VARIABLE}}"
      }
    }
  }
}

// ✅ CORRECT - Runtipi format
{
  "services": [
    {
      "name": "app",
      "isMain": true,
      "internalPort": 8080,
      "environment": {
        "VAR": "${VARIABLE}"
      }
    }
  ]
}
```

### Auto-detection patterns
```json
// URL auto-detection
"APP_URL": "${APP_NAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"

// Timezone inheritance
"TZ": "${TZ}"

// Custom variable with fallback
"LOG_LEVEL": "${APP_NAME_LOG_LEVEL:-info}"
```

### Form field optimizations
```json
// Random password with encoding
{
  "type": "random",
  "label": "Database Password",
  "encoding": "hex",
  "env_variable": "APP_NAME_DB_PASSWORD"
}

// URL with placeholder
{
  "type": "url",
  "label": "Application URL",
  "placeholder": "https://app.yourdomain.com",
  "required": false,
  "env_variable": "APP_NAME_APP_URL"
}

// Boolean with good default
{
  "type": "boolean",
  "label": "Trust Proxy",
  "default": true,
  "env_variable": "APP_NAME_TRUST_PROXY"
}
```