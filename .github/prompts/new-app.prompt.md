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
- **Variable prefixing**: Always prefix env_variables with APP_NAME (e.g., PAPERLESS_AI_*)
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
- Environment variables aligned with form_fields
- Appropriate volumes according to application
- Verified official image
- **Version consistency**: Use EXACT same version as config.json (e.g., `31.0.6` not `31.0.6-ls382`)
- **Clean tags**: Avoid build numbers, use clean version tags only
- Correct internal port
- Health checks when applicable
- Port mappings via `addPorts` for external services
- Use native data types (boolean, number) not strings
- Follow volume pattern: single=`${APP_DATA_DIR}/data`, multiple=`${APP_DATA_DIR}/data/<folder>`

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
- [ ] Read official documentation thoroughly
- [ ] **Check wiki/documentation for advanced features (webhooks, API keys, system prompts)**
- [ ] Verify PUID/PGID support (often not supported)
- [ ] **Examine original .env.example file for comprehensive variable list**
- [ ] List all configurable variables
- [ ] Define appropriate default values
- [ ] Use native data types in form_fields

### 4. Ports and volumes
- [ ] Application default port
- [ ] Required volumes for persistence
- [ ] Correct container paths
- [ ] Follow volume naming convention
- [ ] Add health checks when possible
- [ ] Configure external ports via `addPorts` if needed

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

### MANDATORY verification checklist (based on paperless-ai experience)
1. **Check for GitHub Container Registry (ghcr.io) packages first**
2. **Check original docker-compose.yml for PUID/PGID support**
3. **Examine .env.example for complete variable list**
4. **Review wiki/documentation for advanced features**
5. **Prefix ALL variables with APP_NAME**
6. **Verify EXACT version consistency between config.json and docker-compose.json**
7. **Use clean version tags without build numbers**
8. **Test Docker tag availability on registry**
9. **Verify documentation matches final configuration**

### Variable naming pattern
```json
// CORRECT - Always prefix with app name
{
  "env_variable": "PAPERLESS_AI_API_URL",
  "env_variable": "PAPERLESS_AI_CUSTOM_MODEL",
  "env_variable": "PAPERLESS_AI_SCAN_INTERVAL"
}

// INCORRECT - No prefix
{
  "env_variable": "API_URL",
  "env_variable": "CUSTOM_MODEL", 
  "env_variable": "SCAN_INTERVAL"
}
```

### Volume patterns
```json
// Single volume
"volumes": [
  {
    "hostPath": "${APP_DATA_DIR}/data",
    "containerPath": "/app/data"
  }
]

// Multiple volumes
"volumes": [
  {
    "hostPath": "${APP_DATA_DIR}/data/config",
    "containerPath": "/app/config"
  },
  {
    "hostPath": "${APP_DATA_DIR}/data/logs",
    "containerPath": "/app/logs"
  }
]
```

### PUID/PGID verification examples
```yaml
# If found in original docker-compose.yml:
environment:
  - PUID=1000
  - PGID=1000
# Then ADD to config.json: "uid": 1000, "gid": 1000

# If NOT found in original docker-compose.yml:
# Then DO NOT add uid/gid to config.json
```

### Advanced features detection
```bash
# Always check these sources:
1. /wiki documentation for webhooks, API keys
2. .env.example for complete variable list  
3. Original docker-compose.yml for PUID/PGID
4. Dockerfile for exposed ports and volumes
```

## 🔄 Version Management Best Practices

### Version consistency rules
```json
// Rule 1: EXACT match between files
// config.json
{
  "version": "31.0.6"
}
// docker-compose.json
{
  "image": "lscr.io/linuxserver/nextcloud:31.0.6"
}

// Rule 2: Clean version format (no build numbers)
"31.0.6"     // ✅ Clean version
"31.0.6-ls382" // ❌ Has build number
"v31.0.6"    // ❌ Has "v" prefix
"latest"     // ❌ Not specific

// Rule 3: Use semantic versioning when available
"2.12.1"     // ✅ Semantic version
"release-2.12" // ❌ Non-standard format
"stable"     // ❌ Not specific
```

### Tag verification process
```bash
# Step 1: Check official releases
curl -s "https://api.github.com/repos/owner/repo/releases/latest"

# Step 2: Verify Docker tag exists
curl -s "https://registry.hub.docker.com/v2/repositories/owner/repo/tags/"

# Step 3: Test pull (optional)
docker pull owner/repo:31.0.6

# Step 4: For LinuxServer images, prefer clean over build numbers
# Available: 31.0.6, 31.0.6-ls382
# Choose: 31.0.6 (clean version)
```

### Common version mistakes to avoid
```json
// ❌ WRONG: Inconsistent versions
// config.json: "version": "31.0.6"
// docker-compose.json: "image": "app:31.0.5"

// ❌ WRONG: Using latest in config
// config.json: "version": "latest"

// ❌ WRONG: Build numbers in config
// config.json: "version": "31.0.6-ls382"

// ❌ WRONG: Different tag formats
// config.json: "version": "31.0.6"
// docker-compose.json: "image": "app:v31.0.6"

// ✅ CORRECT: Perfect consistency
// config.json: "version": "31.0.6"
// docker-compose.json: "image": "app:31.0.6"
```

### Docker image preference examples
```json
// PREFERRED - GitHub Container Registry with clean tags
{
  "image": "ghcr.io/linuxserver/plex:1.40.0",
  "image": "ghcr.io/paperless-ngx/paperless-ngx:2.12.1",
  "image": "ghcr.io/sct/overseerr:1.33.2"
}

// ACCEPTABLE - Docker Hub with clean tags (when ghcr.io not available)
{
  "image": "linuxserver/plex:1.40.0",
  "image": "clusterzx/paperless-ai:1.0.0",
  "image": "hotio/sonarr:4.0.10"
}

// AVOID - Build numbers or suffixes
{
  "image": "lscr.io/linuxserver/nextcloud:31.0.6-ls382", // ❌
  "image": "linuxserver/plex:1.40.0.8395-60ff108", // ❌
  "image": "ghcr.io/hotio/sonarr:release-4.0.10.2544" // ❌
}

// How to verify GitHub packages:
// 1. Check repository /packages tab
// 2. Look for "Container registry" section
// 3. Verify ghcr.io/[owner]/[repo] format
// 4. Test tag availability: docker pull ghcr.io/owner/repo:tag
```

### Version consistency examples
```json
// config.json
{
  "version": "31.0.6"
}

// docker-compose.json - MUST match exactly
{
  "image": "lscr.io/linuxserver/nextcloud:31.0.6" // ✅
}

// WRONG examples
{
  "image": "lscr.io/linuxserver/nextcloud:latest" // ❌ Not specific
}
{
  "image": "lscr.io/linuxserver/nextcloud:31.0.6-ls382" // ❌ Build number
}
{
  "image": "lscr.io/linuxserver/nextcloud:v31.0.6" // ❌ "v" prefix
}

// How to verify tag existence:
// 1. Check Docker Hub API: https://hub.docker.com/v2/repositories/owner/repo/tags/
// 2. Test with docker pull: docker pull owner/repo:tag
// 3. For LinuxServer images: prefer clean version over build numbers
```

### Health check examples
```json
// DNS service
"healthCheck": {
  "test": "nslookup google.com 127.0.0.1:53 || exit 1",
  "interval": "30s",
  "timeout": "10s",
  "retries": 3,
  "startPeriod": "40s"
}

// Web service
"healthCheck": {
  "test": "curl -f http://localhost:8080/health || exit 1",
  "interval": "30s",
  "timeout": "10s",
  "retries": 3
}
```

### Form field examples
```json
// Boolean field (native type)
{
  "type": "boolean",
  "label": "Enable feature",
  "hint": "Enable this feature for enhanced functionality",
  "env_variable": "APP_ENABLE_FEATURE",
  "default": true
}

// Number field with validation
{
  "type": "number",
  "label": "Port number",
  "hint": "Port for the service (1024-65535)",
  "min": 1024,
  "max": 65535,
  "env_variable": "APP_PORT",
  "default": 8080
}

// Select field
{
  "type": "text",
  "label": "Log level",
  "hint": "Application logging level",
  "options": [
    {"label": "Debug", "value": "debug"},
    {"label": "Info", "value": "info"},
    {"label": "Warning", "value": "warn"},
    {"label": "Error", "value": "error"}
  ],
  "required": true,
  "env_variable": "APP_LOG_LEVEL",
  "default": "info"
}
```

## 📝 Short Description Guidelines (short_desc)

The `short_desc` field is crucial for user experience and must follow strict guidelines:

### ✅ PERFECT Examples (4-5 words maximum)
```json
"short_desc": "Self-hosted cloud platform"        // Nextcloud
"short_desc": "AI document analyzer"              // Paperless-AI  
"short_desc": "Media streaming server"            // Plex
"short_desc": "Personal finance tracker"          // Firefly III
"short_desc": "Code repository manager"           // Gitea
"short_desc": "Password manager app"              // Vaultwarden
"short_desc": "Network monitoring tool"           // LibreNMS
"short_desc": "Home automation hub"               // Home Assistant
"short_desc": "Photo gallery manager"             // PhotoPrism
"short_desc": "Task management board"             // Kanboard
```

### ❌ AVOID These Patterns
```json
// Too long (exceeds 5 words)
"short_desc": "Secure self-hosted file sync and collaboration platform"

// Too generic (could apply to anything)
"short_desc": "Great application for users"
"short_desc": "Useful software tool"
"short_desc": "Modern web application"

// Too technical/jargon-heavy  
"short_desc": "RESTful API gateway with microservices orchestration"
"short_desc": "Kubernetes-native CI/CD pipeline automation"

// Marketing language
"short_desc": "Revolutionary file management solution"
"short_desc": "Next-generation productivity suite"
"short_desc": "Enterprise-grade security platform"

// Redundant words
"short_desc": "File sync application software"    // "application software" redundant
"short_desc": "Web-based media server system"     // "web-based" and "system" redundant
```

### 🎯 Formula for Perfect short_desc
```
[Core Function] + [Context/Type] = Perfect Description

Examples:
- "Document" + "analyzer" = "AI document analyzer"
- "Media" + "streaming server" = "Media streaming server"  
- "Password" + "manager" = "Password manager app"
- "Photo" + "gallery manager" = "Photo gallery manager"
```

### 📋 Validation Checklist
- [ ] 4-5 words maximum (count carefully)
- [ ] Describes core function clearly
- [ ] Avoids marketing language
- [ ] No redundant words (app, software, system, etc.)
- [ ] Would help user understand purpose immediately
- [ ] Fits naturally in "This is a ___" sentence