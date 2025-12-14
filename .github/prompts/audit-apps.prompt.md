---
agent: "agent"
---

# 🔍 Audit and refactor tipi-store applications

Audit and refactor tipi-store applications to ensure they comply with the latest standards and best practices.

**Target**: {{APP_NAME}} (if specified) or **ALL** applications (if no app specified)

## 🎯 Audit scope

### 🔍 Single application audit
If `{{APP_NAME}}` is specified:
- Focus exclusively on `apps/{{APP_NAME}}/`
- Perform deep analysis of the specified application
- Generate detailed report for this application only
- Apply all standards and refactoring to this single app

### 🌐 Global audit (default)
If no application is specified:
- Audit **ALL** applications in `/apps/`
- Follow execution plan by priority (Media → Automation → Utilities → Specialized)
- Generate comprehensive reports for all applications
- Apply systematic refactoring across the entire tipi-store

## 📋 Audit objectives

### 🏗️ Mandatory structural verifications
- `apps/[app-name]/config.json` - Schema compliance and current standards
- `apps/[app-name]/docker-compose.json` - Optimized Docker configuration
- `apps/[app-name]/metadata/description.md` - Standardized documentation
- `apps/[app-name]/metadata/logo.jpg` - Official logo present

### 🔧 Priority technical validations

#### 1. Environment variables (CRITICAL)
- **Mandatory prefixing**: All variables must be prefixed with `APP_NAME_*`
- **PUID/PGID verification**: Check presence in documentation AND original docker-compose.yml
- **Native types**: Use `true`/`false` for booleans, numbers for numeric values
- **Config/compose consistency**: Variables aligned between config.json and docker-compose.json

#### 2. Docker images (PRIORITY)
- **GitHub Container Registry preference**: Migrate to ghcr.io when available
- **Official tags**: Verify absence of "v" prefix in tags
- **Official images**: Ensure using official project images

#### 3. Schema compliance
- **Schema compliance**: Validation against `https://schemas.runtipi.io/app-info.json`
- **Dynamic compose**: Validation against `https://schemas.runtipi.io/dynamic-compose.json`
- **Timestamps**: currentmillis.com format for created_at/updated_at
- **tipi_version**: Check version consistency
- **tipi_version increment**: MANDATORY - Increment tipi_version by +1 before each GitHub commit of a modified app

#### 4. Documentation and metadata
- **Standardized format**: description.md following official template
- **Consistency**: Documentation reflecting ALL configuration options
- **Official logo**: Presence and appropriate size (< 100KB)

## 🔍 Detailed audit process

### Phase 1: Target identification and inventory
```bash
# If APP_NAME specified:
if [ -n "{{APP_NAME}}" ]; then
    echo "🎯 Single app audit: {{APP_NAME}}"
    TARGET_APPS=("{{APP_NAME}}")
    AUDIT_MODE="single"
else
    echo "🌐 Global audit: ALL applications"
    TARGET_APPS=($(ls apps/ | grep -v README.md))
    AUDIT_MODE="global"
fi

# Verify target application exists
if [ "$AUDIT_MODE" = "single" ] && [ ! -d "apps/{{APP_NAME}}" ]; then
    echo "❌ Error: Application '{{APP_NAME}}' not found in apps/"
    exit 1
fi
```

### Phase 2: Per-application analysis
For each application in TARGET_APPS, verify:

#### A. config.json
```bash
# Mandatory verifications:
- [ ] Variables prefixed with APP_NAME (ex: SONARR_*, RADARR_*)
- [ ] Native types (true/false for boolean, 8 for number)
- [ ] uid/gid present ONLY if PUID/PGID supported
- [ ] Complete form_fields with appropriate hints
- [ ] min/max validation for number fields
- [ ] Predefined options for multiple choices
- [ ] Timestamps in currentmillis format
- [ ] tipi_version incremented by +1 if modifications are committed to GitHub
```

#### B. docker-compose.json
```bash
# Critical controls:
- [ ] Official image (preference ghcr.io > Docker Hub)
- [ ] Environment variables aligned with config.json
- [ ] PUID/PGID present ONLY if supported by image
- [ ] Health checks implemented when applicable
- [ ] Volumes following conventions (${APP_DATA_DIR}/data)
- [ ] External ports via addPorts if necessary
```

#### C. Documentation
```bash
# Documentation standards:
- [ ] description.md in standardized format
- [ ] All mandatory sections present
- [ ] Environment variables documented
- [ ] Consistency with current configuration
- [ ] Official logo present and optimized
```

### Phase 3: Systematic refactoring

#### 1. Environment variables
```json
// BEFORE (problematic)
{
  "env_variable": "API_KEY",
  "env_variable": "LOG_LEVEL"
}

// AFTER (corrected)
{
  "env_variable": "SONARR_API_KEY",
  "env_variable": "SONARR_LOG_LEVEL"
}
```

#### 2. Docker image migration
```json
// BEFORE
{
  "image": "linuxserver/sonarr:latest"
}

// AFTER (if available on ghcr.io)
{
  "image": "ghcr.io/linuxserver/sonarr:latest"
}
```

#### 3. Native data types
```json
// BEFORE (string for boolean)
{
  "type": "boolean",
  "default": "true"
}

// AFTER (native type)
{
  "type": "boolean",
  "default": true
}
```

#### 4. PUID/PGID support
```bash
# Verification process:
1. Consult official application documentation
2. Examine original project docker-compose.yml
3. If PUID/PGID present in original:
   - Add "uid": 1000, "gid": 1000 in config.json
   - Include PUID/PGID in docker-compose.json
4. If PUID/PGID absent from original:
   - Remove uid/gid from config.json
   - Remove PUID/PGID from docker-compose.json
```

## 🛠️ Execution plan

### 🎯 Single application mode ({{APP_NAME}} specified)
```bash
# Focused audit workflow:
1. **Deep analysis** of apps/{{APP_NAME}}/
2. **Comprehensive verification** against all standards
3. **Immediate refactoring** of identified issues
4. **Detailed reporting** with specific recommendations
5. **Validation and testing** of corrected configuration

# Priority checks for single app:
- Environment variables prefixing and types
- Docker image optimization (ghcr.io preference)
- PUID/PGID support validation
- Schema compliance verification
- Documentation synchronization
```

### 🌐 Global audit mode (no app specified)
#### Step 1: Priority applications (Media/Featured)
Start with most used applications:
- `plex` - Main media server
- `sonarr` - TV series management
- `radarr` - Movie management
- `prowlarr` - Indexer
- `overseerr` - Request interface

#### Step 2: Automation applications
- `tautulli` - Plex statistics
- `recyclarr` - Automatic configuration
- `transmission-vpn` - Torrent client
- `autobrr` - RSS automation

#### Step 3: Utility applications
- `paperless-ngx` - Document management
- `homebox` - Home inventory
- `lubelogger` - Vehicle log
- `beszel` / `beszel-agent` - Monitoring

#### Step 4: Specialized applications
- All other applications in alphabetical order

## 📊 Audit report

### 🎯 Single application report format
If auditing a specific app ({{APP_NAME}}):

```markdown
# {{APP_NAME}} - Complete Audit Report

## 📋 Executive Summary
- **App Name**: {{APP_NAME}}
- **Current tipi_version**: [current]
- **Audit Date**: [timestamp]
- **Compliance Status**: ✅ Compliant | ⚠️ Issues Found | ❌ Major Issues

## 🔍 Detailed Analysis

### Environment Variables
- **Prefixing Status**: ✅/❌ All variables prefixed with {{APP_NAME}}_*
- **Type Compliance**: ✅/❌ Native types used (boolean/number)
- **Missing Variables**: [list any found in .env.example but not configured]
- **Deprecated Variables**: [list any that should be removed]

### Docker Configuration
- **Image Source**: [current] → [recommended if different]
- **ghcr.io Available**: ✅/❌
- **PUID/PGID Support**: ✅ Supported | ❌ Not Supported | ⚠️ Incorrectly Configured
- **Health Checks**: ✅ Present | ❌ Missing | ⚠️ Needs Improvement

### Schema Compliance
- **config.json**: ✅/❌ Valid against app-info.json
- **docker-compose.json**: ✅/❌ Valid against dynamic-compose.json
- **Validation Errors**: [list specific errors if any]

### Documentation
- **Format Compliance**: ✅/❌ Follows standardized template
- **Variable Documentation**: ✅/❌ All env vars documented
- **Logo Status**: ✅ Present | ❌ Missing | ⚠️ Wrong format/size

## ✅ Applied Corrections
- [List all changes made during audit]
- Variables prefixed: [count] variables updated
- Image migration: [old] → [new]
- Type corrections: [count] fields corrected
- PUID/PGID: [added/removed/corrected]
- Documentation: [sections updated]
- tipi_version: [old] → [new]

## ⚠️ Manual Actions Required
- [List any issues that need manual intervention]
- [Configuration options that need validation]
- [External dependencies to verify]

## 🧪 Recommended Testing
- [ ] Clean installation test
- [ ] Configuration validation
- [ ] Data persistence verification
- [ ] Feature functionality testing
- [ ] Documentation accuracy check

## 📝 Commit Commands
```bash
git add apps/{{APP_NAME}}/
git commit -m "[emoji] [action]: [description] for {{APP_NAME}}"
```

### 🌐 Global audit summary report
For complete tipi-store audit:

```markdown
# Tipi-Store Global Audit Report

## 📊 Overall Statistics
- **Total Applications**: [count]
- **Fully Compliant**: [count] ✅
- **Issues Found**: [count] ⚠️
- **Major Problems**: [count] ❌
- **Audit Duration**: [time]

## 🏆 Compliance Overview
| Application | Variables | Docker | Schema | Docs | Status |
|-------------|-----------|--------|--------|------|--------|
| plex        | ✅        | ⚠️     | ✅     | ✅   | FIXED  |
| sonarr      | ❌        | ✅     | ❌     | ⚠️   | ISSUES |
| ...         | ...       | ...    | ...    | ...  | ...    |

## 🔧 Global Corrections Applied
- **Variable Prefixing**: [count] apps updated
- **Docker Migration**: [count] apps migrated to ghcr.io
- **Type Corrections**: [count] apps with type fixes
- **PUID/PGID**: [count] apps corrected
- **Documentation**: [count] apps updated

## ⚠️ Priority Issues Remaining
1. **Critical**: [list apps with critical issues]
2. **High**: [list apps with important fixes needed]
3. **Medium**: [list apps with minor improvements]

## 📈 Next Steps
1. Address critical issues in priority order
2. Test all modified applications
3. Update documentation for breaking changes
4. Monitor for regression issues
```

## 🚀 Usage examples

### 🎯 Single application audit
```bash
# Audit specific application
./audit-app.sh sonarr
./audit-app.sh paperless-ngx
./audit-app.sh plex

# Results in focused analysis of just that app
# with detailed report and immediate fixes
```

### 🌐 Global audit
```bash
# Audit all applications
./audit-app.sh
# or explicitly
./audit-app.sh --all

# Results in systematic audit of entire tipi-store
# with priority-based execution plan
```

### 🔧 Command line integration
```bash
#!/bin/bash
# audit-app.sh script example

APP_NAME="$1"

if [ -n "$APP_NAME" ]; then
    echo "🎯 Starting focused audit for: $APP_NAME"
    echo "📁 Target: apps/$APP_NAME/"
    
    # Verify app exists
    if [ ! -d "apps/$APP_NAME" ]; then
        echo "❌ Error: Application '$APP_NAME' not found"
        exit 1
    fi
    
    # Run single app audit
    echo "🔍 Analyzing $APP_NAME configuration..."
    # ... audit logic for single app
    
else
    echo "🌐 Starting global audit for ALL applications"
    echo "📁 Target: apps/* (excluding README.md)"
    
    # Run global audit
    echo "🔍 Analyzing all applications..."
    # ... audit logic for all apps
fi
```

## 🎯 Validation criteria

### Automatic validation
- [ ] Official JSON schema compliance
- [ ] Valid YAML syntax for docker-compose
- [ ] Presence of all mandatory files
- [ ] Reasonable image sizes

### Manual validation
- [ ] Consistency between config.json and docker-compose.json
- [ ] Complete and up-to-date documentation
- [ ] Environment variables correctly prefixed
- [ ] PUID/PGID support verified against official source

## 🚀 Recommended automation

### Git workflow and tipi_version
```bash
# Recommended workflow for app modifications:
1. Modify files locally (config.json, docker-compose.json, etc.)
2. Test and validate changes
3. Before final commit:
   - Increment tipi_version in config.json
   - Update updated_at with current timestamp
4. Follow commit standards (see commit-app.prompt.md)
5. Push to GitHub

# For detailed commit workflow, branch management, and message standards,
# refer to commit-app.prompt.md which covers:
# - Branch strategy (main vs. feature branches)
# - Complete Gitmoji + Keep a Changelog guidelines
# - Pre-commit checklists and automated scripts
# - Specific workflows for different change types

# Quick examples:
git add apps/myapp/
git commit -m "⚡ Changed: migrate myapp to ghcr.io Docker image"
git commit -m "🔧 Fixed: correct PUID/PGID support validation in myapp"
git push
```

### Commit standards reference
For comprehensive commit message standards, pre-commit checklists, and automated workflows, see **commit-app.prompt.md**.

### Validation scripts
Create scripts to automate:
1. **Prefix validation** - Verify all variables are prefixed
2. **Image verification** - Check availability on ghcr.io
3. **Schema validation** - Automatic compliance tests
4. **PUID/PGID detection** - Automatic support verification

### VS Code configuration
Ensure workspace configuration for real-time validation:
```json
{
  "json.schemas": [
    {
      "fileMatch": ["**/apps/*/config.json"],
      "url": "https://schemas.runtipi.io/app-info.json"
    },
    {
      "fileMatch": ["**/apps/*/docker-compose.json"],
      "url": "https://schemas.runtipi.io/dynamic-compose.json"
    }
  ]
}
```

## ⚠️ Critical constraints

### Backward compatibility
- **No breaking changes** in existing variables
- **Progressive migration** of configurations
- **Documentation of changes** for users
- **Installation tests** before and after modification

### Refactoring priorities
1. **Security**: Sensitive variables, user access
2. **Functionality**: PUID/PGID support, volumes, ports
3. **Standardization**: Prefixing, native types, documentation
4. **Optimization**: Images, performance, health checks

### Post-refactoring verifications
- [ ] Successful installation with new parameters
- [ ] Data persistence maintained
- [ ] Advanced features operational
- [ ] Documentation consistent with implementation
- [ ] tipi_version correctly incremented (+1 from previous version)

## 🎯 Expected result

### 🎯 Single application audit result
When auditing {{APP_NAME}} specifically:
- **{{APP_NAME}} fully compliant** with current standards
- **All environment variables** correctly prefixed with {{APP_NAME}}_*
- **Docker configuration** optimized (ghcr.io if available)
- **PUID/PGID support** accurately verified and configured
- **Documentation** complete and synchronized
- **Schema validation** passing without errors
- **Detailed report** with specific recommendations and fixes
- **Ready for production** with verified configuration

### 🌐 Global audit result
When auditing all applications:
- **100% of applications** compliant with current standards
- **Environment variables** all correctly prefixed across the store
- **PUID/PGID support** verified and implemented only if supported
- **Docker images** using ghcr.io as priority when available
- **Documentation** complete and standardized for all apps
- **Automatic validation** via JSON schemas for entire store
- **User experience** consistent and optimized across all applications
- **Comprehensive dashboard** showing compliance status of all apps

## 📚 Reference resources

### Official schemas
- [App Info Schema](https://schemas.runtipi.io/app-info.json)
- [Dynamic Compose Schema](https://schemas.runtipi.io/dynamic-compose.json)

### Standard documentation
- Standardized description.md format
- Variable naming conventions
- Docker configuration patterns

### Validation tools
- VS Code with schema validation
- Automated test scripts
- Compliance checkers

---

**Objective**: Harmonize the entire tipi-store according to current best practices, ensuring optimal user experience and simplified maintenance.
