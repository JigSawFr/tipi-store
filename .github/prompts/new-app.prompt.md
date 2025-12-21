---
agent: "agent"
---

# 🚀 Add a new application to tipi-store

Add the **{{APPLICATION_NAME}}** application (link to documentation/official site) based on complete analysis and verification.

## 📋 Required specifications

### 🏗️ Mandatory structure
- `apps/[app-name]/config.json` - Tipi configuration with detailed form_fields
- `apps/[app-name]/docker-compose.json` - Optimized Docker configuration
- `apps/[app-name]/metadata/description.md` - Standardized documentation
- `apps/[app-name]/metadata/logo.jpg` - Official logo downloaded

### 🔧 Technical validations
- **Docker Image**: Verify official image, correct tags - **KEEP original prefixes if they exist** (e.g., use `v1.1.3` if that's the real tag, not `1.1.3`)
- **Image preference**: Prefer GitHub Container Registry (ghcr.io) over Docker Hub when available
- **Version consistency**: Ensure EXACT version match between config.json and docker-compose.json
- **Tag format**: Use clean version tags without build numbers (e.g., `31.0.6` not `31.0.6-ls382`)
- **Tag verification**: **ALWAYS verify tag exists on registry before using** with `docker manifest inspect`
- **Environment variables**: Check PUID/PGID support via official documentation AND docker-compose.yml
- **Variable syntax**: Use `"${VARIABLE}"` format in docker-compose.json (NOT `"{{VARIABLE}}"`)
- **Runtipi built-in vars**: Leverage `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}` for auto-detection
- **Service architecture**: Mark main service with `"isMain": true` and use `"internalPort"`
- **tipi_version**: Always 1 for a new application, increment by +1 before each commit to GitHub
- **Timestamps**: Use https://currentmillis.com for `created_at` and `updated_at` (current date)
- **uid/gid**: Add to config.json ONLY if PUID/PGID supported by image
- **Schema compliance**: Follow official Runtipi schemas (app-info.json, dynamic-compose.json)
- **Volume structure**: Use `${APP_DATA_DIR}/data` for single volume, `${APP_DATA_DIR}/data/<folder>` for multiple volumes
- **Documentation verification**: Always check wiki/documentation for missing features (webhooks, API keys, etc.)

### 📝 config.json configuration

**CRITICAL: Property order must follow schema v2 specification:**
```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description...",
  "version": "x.y.z",
  "tipi_version": 1,
  "short_desc": "Concise app description (max 4-5 words)",
  "author": "OriginalAuthor",
  "source": "https://github.com/...",
  "website": "https://...",
  "categories": ["category1", "category2"],
  "form_fields": [
    {
      "type": "text|password|email|number|boolean|fqdn|ip|url|random",
      "label": "Descriptive label",
      "hint": "Helpful explanation (ALWAYS add hints)",
      "required": true,
      "env_variable": "APPNAME_VARIABLE_NAME",
      "default": "value",
      "min": 1,
      "max": 100,
      "placeholder": "Example value for better UX",
      "options": [{"label": "Display", "value": "internal"}]
    }
  ],
  "exposable": true,
  "no_gui": false,
  "supported_architectures": ["amd64", "arm64"],
  "uid": 1000,
  "gid": 1000,
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1724160000000,
  "updated_at": 1724160000000
}
```

**Schema v2 property order (MANDATORY):**
1. `$schema`
2. `id`
3. `available`
4. `port`
5. `name`
6. `description`
7. `version`
8. `tipi_version`
9. `short_desc`
10. `author`
11. `source`
12. `website`
13. `categories`
14. `url_suffix` (optional)
15. `form_fields`
16. `exposable`
17. `no_gui` (optional)
18. `supported_architectures`
19. `uid` (optional, only if PUID/PGID supported)
20. `gid` (optional, only if PUID/PGID supported)
21. `dynamic_config`
22. `min_tipi_version`
23. `created_at`
24. `updated_at`
25. `deprecated` (optional)

**CRITICAL Form field requirements:**
- **Variable naming**: **ALWAYS prefix with APPNAME_** (e.g., DECYPHARR_API_USERNAME, not API_USERNAME)
- **Hints mandatory**: Every field MUST have a `"hint"` for user guidance
- **Random passwords**: Use `"type": "random"` with `"encoding": "hex"` for secure auto-generated passwords
- **⚠️ VARIABLE COHERENCE (CRITICAL)**: Every `${APPNAME_*}` variable used in docker-compose.json MUST have a corresponding form_field in config.json. Missing variables cause container startup failures!
  - Built-in Tipi variables (no form_field needed): `${TZ}`, `${APP_DATA_DIR}`, `${APP_DOMAIN}`, `${APP_PROTOCOL}`, `${APP_EXPOSED}`, `${APP_HOST}`, `${APP_PORT}`, `${LOCAL_DOMAIN}`
  - Database passwords: If using PostgreSQL/MySQL/Redis, add a `"type": "random"` field for `APPNAME_DB_PASSWORD`
  - API keys/secrets: Add `"type": "random"` or `"type": "password"` fields as appropriate
- **Placeholder examples**: Add `"placeholder"` fields for better UX (e.g., `"admin"`, `"https://auth.yourdomain.com"`)
- **Website field**: Always add `"website"` field when available for better discoverability
- **Short descriptions**: Keep short_desc concise and impactful (STRICT 4-5 words maximum, focus on core function)
  - ✅ Perfect: "Self-hosted cloud platform", "AI document analyzer", "Media streaming server", "Personal finance tracker", "Debrid QBittorrent API"
  - ✅ Good: "Document management system", "Password manager app", "Network monitoring tool"
  - ❌ Too long: "Secure self-hosted file sync and collaboration platform" (11 words)
  - ❌ Too vague: "Great application for users" (generic, not descriptive)
  - ❌ Too technical: "RESTful API gateway with microservices orchestration" (complex jargon)
  - **Rule**: Core function + context (if space allows). Avoid marketing language.
- **Native data types**: Use `true`/`false` for booleans, `8` for numbers, not strings
- **Validation**: Include `min`/`max` validation for number fields
- **Group labeling**: Use consistent labeling (e.g., "DNS Settings >", "Security >")
- **uid/gid placement**: Add ONLY if PUID/PGID supported, place after form_fields

### 🐳 docker-compose.json configuration
- **Service structure**: Use array format with `"isMain": true` for primary service
- **Port configuration**: Use `"internalPort"` instead of `"addPorts"` for main service
- **Variable syntax**: Use `"${VARIABLE}"` format (NOT `"{{VARIABLE}}"`)
- **Auto-detection patterns**: Use `"${VAR:-${DEFAULT}}"` for fallback values
- **Built-in variables**: Leverage `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}`, `${APP_DATA_DIR}`
- Environment variables aligned with form_fields
- Appropriate volumes according to application
- Verified official image
- **Version consistency**: Use EXACT same version as config.json (e.g., `v1.1.3` matching config.json version `1.1.3`)
- **Clean tags**: Avoid build numbers, use clean version tags only
- Health checks when applicable
- **Multi-service apps**: Use `"dependsOn": ["service-name"]` for service dependencies
- **Read-only security**: Add `"readOnly": true` when supported by image
- Use native data types (boolean, number) not strings
- Follow volume pattern: single=`${APP_DATA_DIR}/data`, multiple=`${APP_DATA_DIR}/data/<folder>`
- **PUID/PGID values**: Use hardcoded `"1000"` strings, NOT variables if uid/gid are in config.json

#### 🔒 Advanced Docker Compose Properties (ServiceBuilder Support)
**Runtipi supports 40+ Docker Compose properties via ServiceBuilder. Use when needed:**

**Security & Capabilities:**
- `"capAdd": ["SYS_ADMIN", "NET_ADMIN"]` - Linux capabilities to add
- `"capDrop": ["ALL"]` - Linux capabilities to drop for security
- `"securityOpt": ["apparmor:unconfined", "no-new-privileges:true"]` - Security options
- `"privileged": true` - Privileged mode (avoid when possible, use specific capabilities)
- `"devices": ["/dev/fuse:/dev/fuse"]` - Device mappings for hardware access

**Network & Communication:**
- `"networkMode": "host|bridge|none|service:name"` - Network mode override
- `"extraHosts": ["host.docker.internal:host-gateway"]` - Additional hosts mapping
- `"dns": ["1.1.1.1", "8.8.8.8"]` - Custom DNS servers
- `"hostname": "custom-hostname"` - Container hostname

**System Resources:**
- `"ulimits": {"nofile": {"soft": 1024, "hard": 2048}}` - Process limits
- `"sysctls": {"net.core.somaxconn": "1024"}` - Kernel parameters
- `"shmSize": "2gb"` - Shared memory size
- `"tmpfs": ["/tmp", "/var/tmp"]` - Temporary filesystems

**Process Control:**
- `"user": "1000:1000"` - User/group ID override
- `"workingDir": "/app"` - Working directory
- `"entrypoint": ["/custom-entrypoint.sh"]` - Custom entrypoint
- `"command": ["--config", "/etc/app.conf"]` - Command override
- `"pid": "host"` - PID namespace mode

**Container Behavior:**
- `"tty": true` - Allocate pseudo-TTY
- `"stdinOpen": true` - Keep STDIN open
- `"stopSignal": "SIGTERM"` - Stop signal override
- `"stopGracePeriod": "30s"` - Graceful stop timeout

**Monitoring & Logging:**
- `"logging": {"driver": "json-file", "options": {"max-size": "10m"}}` - Logging configuration
- `"labels": {"traefik.enable": "true"}` - Container labels

**Docker-compose.json structure example:**
```json
{
  "services": [
    {
      "name": "app-name",
      "image": "vendor/image:version",
      "isMain": true,
      "internalPort": "8080",
      "readOnly": true,
      "environment": {
        "APP_URL": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}",
        "TZ": "${TZ}",
        "PUID": "1000",
        "PGID": "1000",
        "VARIABLE": "${APPNAME_VARIABLE}"
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

**Example with advanced security (FUSE/filesystem apps):**
```json
{
  "services": [
    {
      "name": "secure-app",
      "image": "vendor/image:version",
      "isMain": true,
      "internalPort": "8080",
      "capAdd": ["SYS_ADMIN"],
      "securityOpt": ["apparmor:unconfined"],
      "devices": ["/dev/fuse:/dev/fuse"],
      "environment": {
        "APP_URL": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}",
        "TZ": "${TZ}"
      },
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

**Example with network customization:**
```json
{
  "services": [
    {
      "name": "network-app",
      "image": "vendor/image:version",
      "isMain": true,
      "internalPort": "8080",
      "networkMode": "host",
      "extraHosts": ["host.docker.internal:host-gateway"],
      "dns": ["1.1.1.1", "8.8.8.8"],
      "ulimits": {
        "nofile": {
          "soft": 1024,
          "hard": 2048
        }
      },
      "environment": {
        "TZ": "${TZ}"
      }
    }
  ]
}
```
```

### 📖 description.md documentation
Standardized format with mandatory sections:
```markdown
# APP_NAME

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/OWNER/REPO) [<img src="https://img.shields.io/github/issues/OWNER/REPO?color=7842f5">](https://github.com/OWNER/REPO/issues)

Short description.

---

## 📖 SYNOPSIS
Brief overview of what the application does and its main purpose.

---

## ⚠️ EXPERIMENTAL (if applicable)
Warning about experimental status if the app is still in development.

---

## ✨ MAIN FEATURES
- Feature 1
- Feature 2
- Feature 3

---

## 📋 PREREQUISITES (if applicable)
- Requirement 1
- Requirement 2

---

## 🐳 DOCKER IMAGE DETAILS
- **Based on [owner/repo](https://github.com/...)**
- Additional image details

---

## 📁 VOLUMES (if applicable)
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/path/on/host` | `/path/in/container` | Description |

---

## 📝 ENVIRONMENT
| Variable | Required | Description |
| --- | --- | --- |
| `VAR_NAME` | Yes/No | Description |

---

## ⚙️ CONFIGURATION (if applicable)
Configuration instructions and examples.

---

## 🎯 USAGE EXAMPLES (if applicable)
Usage examples and commands.

---

## ⚠️ IMPORTANT
Important notes, warnings, or tips.

---

## 💾 SOURCE
* [owner/repo](https://github.com/...)
* Related links

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
```

### 🎨 Official logo
**Priority order for logo sources:**
1. **First**: Check if logo exists in runtipi-appstore: `https://github.com/runtipi/runtipi-appstore/tree/master/apps/[app-name]/metadata/logo.jpg`
2. **If found**: Download from runtipi-appstore: `curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"`
3. **If not found**: Check if a related app exists in this store and copy its logo (e.g., `lubelog-mcp` can use `lubelogger`'s logo)
4. **If not found**: Download from official site/GitHub repository
- Named `logo.jpg` (or `logo.png` if JPG not available)
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
- [ ] **ServiceBuilder support**: All 40+ Docker properties are supported including advanced security options
- [ ] Use VS Code with schema validation enabled

### 2. Docker Image & Security
- [ ] **Prefer GitHub Container Registry (ghcr.io) packages over Docker Hub when available**
- [ ] **CRITICAL: Use `docker manifest inspect [image:tag]` to verify tag exists**
- [ ] Verify image existence on official registry
- [ ] Confirm available versions/tags
- [ ] **Keep original tag format - if tag has "v" prefix, keep it (e.g., `v1.1.3`)**
- [ ] **Test tag availability with exact format from registry**
- [ ] **Ensure version consistency between config.json and docker-compose.json**
- [ ] **Security options**: Consider `capAdd`, `securityOpt`, `devices` for specialized apps
- [ ] **Avoid privileged mode**: Use specific capabilities instead when possible
- [ ] Test supported environment variables
- [ ] **Check PUID/PGID support in BOTH documentation AND original docker-compose.yml**
- [ ] **Examine original .env.example for additional variables**

### 3. Advanced Docker Properties (When Needed)
- [ ] **Filesystem access**: Use `capAdd: ["SYS_ADMIN"]`, `devices: ["/dev/fuse:/dev/fuse"]` for FUSE
- [ ] **Network customization**: Consider `networkMode`, `extraHosts`, `dns` for network apps
- [ ] **Resource limits**: Use `ulimits`, `sysctls`, `shmSize` for resource-intensive apps
- [ ] **Process control**: Configure `user`, `workingDir`, `entrypoint` when needed
- [ ] **Security hardening**: Use `capDrop: ["ALL"]`, `securityOpt: ["no-new-privileges:true"]`
- [ ] **Container behavior**: Set `tty`, `stdinOpen`, `stopSignal` as required
- [ ] **Logging options**: Configure custom logging with `logging` property
- [ ] Use VS Code with schema validation enabled

### 2. Docker Image
- [ ] **Prefer GitHub Container Registry (ghcr.io) packages over Docker Hub when available**
- [ ] **CRITICAL: Use `docker manifest inspect [image:tag]` to verify tag exists**
- [ ] Verify image existence on official registry
- [ ] Confirm available versions/tags
- [ ] **Keep original tag format - if tag has "v" prefix, keep it (e.g., `v1.1.3`)**
- [ ] **Test tag availability with exact format from registry**
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
   - **CRITICAL: Update README files (often forgotten!)**
     - Update main `/README.md`: Increment counter (e.g., 27 → 28) and add app to table
     - Update `/apps/README.md`: Add app to appropriate category section
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
- **Advanced Docker properties**: Leverage ServiceBuilder's 40+ properties when needed for specialized apps
- **Security best practices**: Use specific capabilities instead of privileged mode when possible
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

## 🔧 Specialized Application Patterns

### 🔒 Filesystem/FUSE Applications
For apps requiring filesystem access (e.g., file managers, mount tools):
```json
{
  "capAdd": ["SYS_ADMIN"],
  "securityOpt": ["apparmor:unconfined"],
  "devices": ["/dev/fuse:/dev/fuse"]
}
```

### 🌐 Network/VPN Applications  
For network tools requiring host network access:
```json
{
  "networkMode": "host",
  "capAdd": ["NET_ADMIN", "NET_RAW"],
  "extraHosts": ["host.docker.internal:host-gateway"]
}
```

### 🖥️ System Monitoring Tools
For applications needing system access:
```json
{
  "pid": "host",
  "capAdd": ["SYS_PTRACE"],
  "volumes": [
    {
      "hostPath": "/proc",
      "containerPath": "/host/proc",
      "options": "ro"
    }
  ]
}
```

### 📊 Resource-Intensive Applications
For applications with high resource requirements:
```json
{
  "shmSize": "2gb",
  "ulimits": {
    "nofile": {"soft": 65536, "hard": 65536},
    "memlock": {"soft": -1, "hard": -1}
  },
  "sysctls": {
    "net.core.somaxconn": "1024"
  }
}
```

### 🔐 Security-Hardened Applications
For applications requiring enhanced security:
```json
{
  "readOnly": true,
  "capDrop": ["ALL"],
  "securityOpt": ["no-new-privileges:true"],
  "user": "65534:65534",
  "tmpfs": ["/tmp", "/var/tmp"]
}
```

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

// ✅ CORRECT - Runtipi format with advanced properties
{
  "services": [
    {
      "name": "app",
      "isMain": true,
      "internalPort": 8080,
      "capAdd": ["SYS_ADMIN"],
      "securityOpt": ["apparmor:unconfined"],
      "devices": ["/dev/fuse:/dev/fuse"],
      "ulimits": {
        "nofile": {"soft": 1024, "hard": 2048}
      },
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

## 🔥 CRITICAL FINAL CHECKLIST (Based on Real Implementation Experience)

**Before submitting any application, verify ALL of these points:**

### ✅ Docker Image Verification
- [ ] Used `docker manifest inspect [image:tag]` to verify tag exists
- [ ] Kept original tag format (including "v" prefix if present)
- [ ] Version consistency: config.json `"version": "1.1.3"` matches docker-compose.json `"image": "vendor/app:v1.1.3"`
- [ ] Preferred GitHub Container Registry (ghcr.io) over Docker Hub when available

### ✅ Configuration Files
- [ ] `tipi_version: 1` for new applications
- [ ] All environment variables prefixed with APPNAME_ (e.g., `DECYPHARR_API_USERNAME`)
- [ ] Every form field has `hint` for user guidance
- [ ] Used `"type": "random"` with `"encoding": "hex"` for secure passwords
- [ ] `uid/gid` only added if PUID/PGID supported by image
- [ ] `short_desc` is 4-5 words maximum
- [ ] Current timestamps from currentmillis.com
- [ ] PUID/PGID hardcoded to `"1000"` strings in docker-compose.json

### ✅ Advanced Docker Properties (When Applicable)
- [ ] Used specific capabilities (`capAdd`) instead of `privileged: true` when possible
- [ ] Applied security options (`securityOpt`) for specialized requirements
- [ ] Configured device mappings (`devices`) for hardware access
- [ ] Set resource limits (`ulimits`, `sysctls`, `shmSize`) for performance
- [ ] Used network customization (`networkMode`, `extraHosts`) when needed
- [ ] Applied security hardening (`capDrop`, `readOnly`, `user`) when appropriate
- [ ] Configured process control (`entrypoint`, `command`, `workingDir`) as required

### ✅ File Structure
- [ ] `config.json` with complete form_fields
- [ ] `docker-compose.json` in Runtipi array format
- [ ] `metadata/description.md` with standardized sections
- [ ] `metadata/logo.jpg` verified and downloaded

### ✅ README Updates (OFTEN FORGOTTEN!)
- [ ] Main `/README.md`: Incremented counter (e.g., 27 → 28)
- [ ] Main `/README.md`: Added app to alphabetical table
- [ ] `/apps/README.md`: Added app to appropriate category section
- [ ] `/apps/README.md`: Incremented "Total Applications" counter
- [ ] Verified links and descriptions are correct

### ✅ Schema Validation
- [ ] No errors in VS Code with schemas enabled
- [ ] All required properties present
- [ ] Native data types used (boolean, number, not strings)

### ✅ Final Quality Check
- [ ] Logo < 100KB recommended
- [ ] All placeholders provide good examples
- [ ] Environment variables follow consistent naming
- [ ] Volume structure follows single/multiple pattern
- [ ] Health checks added when applicable

**🚨 REMEMBER: Test with `docker manifest inspect` before finalizing any Docker image tag!**

## 🔧 ServiceBuilder Property Reference

**Runtipi ServiceBuilder supports 40+ Docker Compose properties. Complete list:**
- **Basic**: `setImage`, `setName`, `setRestartPolicy`, `setNetwork`
- **Ports**: `setPort`, `setPorts`, `setInternalPort`
- **Storage**: `setVolume`, `setVolumes`
- **Environment**: `setEnvironment`, `setCommand`, `setEntrypoint`
- **Health**: `setHealthCheck`
- **Metadata**: `setLabels`
- **Dependencies**: `setDependsOn`
- **Network**: `setNetworkMode`, `setExtraHosts`, `setDNS`
- **Resources**: `setUlimits`, `setShmSize`, `setSysctls`
- **Security**: `setCapAdd`, `setCapDrop`, `setPrivileged`, `setSecurityOpt`, `setDevices`
- **Process**: `setHostname`, `setPid`, `setTty`, `setUser`, `setWorkingDir`
- **Container**: `setReadOnly`, `setStopSignal`, `setStopGracePeriod`, `setStdinOpen`
- **Logging**: `setLogging`
- **Deployment**: `setDeploy`

**Use these properties when your application requires specialized Docker configuration beyond basic web services.**

**🎯 Key Takeaway**: Runtipi's dynamic compose system supports the full Docker Compose specification through ServiceBuilder. Don't hesitate to use advanced properties when they improve security, performance, or functionality for specialized applications.