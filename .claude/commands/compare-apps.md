---
description: Compare two apps to learn patterns and best practices
---

# Compare Apps

Compare two applications side-by-side to understand differences, learn patterns, and identify best practices.

Useful for learning from existing apps before creating similar ones.

## Process

### Step 1: Select Apps

Ask user for two apps to compare:
- **App A** (your app or template)
- **App B** (reference app for comparison)

### Step 2: Load Configurations

Read both apps:
- `config.json`
- `docker-compose.json`
- `metadata/description.md`
- `metadata/logo.jpg` (size)

### Step 3: Generate Comparison Report

Compare across multiple dimensions.

---

## Comparison Report Structure

### 1. Basic Information

```
COMPARISON: sonarr vs radarr
=====================================

SONARR                          RADARR
------                          ------
Version: 4.0.10                 Version: 5.8.3
Port: 8989                      Port: 7878
Categories: media, automation   Categories: media, automation
Tipi version: 12                Tipi version: 8
Created: 2023-01-15             Created: 2023-02-20
```

### 2. Docker Configuration

```
DOCKER CONFIGURATION
=====================================

Image Source:
sonarr:  lscr.io/linuxserver/sonarr:4.0.10
radarr:  lscr.io/linuxserver/radarr:5.8.3
         ↑ Same registry (linuxserver.io)

Services:
sonarr:  1 service (simple)
radarr:  1 service (simple)
         ✓ Both use single-service pattern

PUID/PGID:
sonarr:  ✓ Supported (uid: 1000, gid: 1000)
radarr:  ✓ Supported (uid: 1000, gid: 1000)
         ✓ Identical configuration

Volumes:
sonarr:  2 volumes (config, data)
radarr:  2 volumes (config, data)
         ✓ Same volume pattern
```

### 3. Environment Variables

```
ENVIRONMENT VARIABLES
=====================================

Variable Count:
sonarr:  5 variables
radarr:  6 variables (+1)

Prefixing:
sonarr:  ✓ All prefixed with SONARR_
radarr:  ✓ All prefixed with RADARR_
         ✓ Both follow prefixing standard

Unique to sonarr:
- SONARR_API_TIMEOUT

Unique to radarr:
- RADARR_TMDB_API_KEY
- RADARR_CUSTOM_FORMATS

Common variables:
- APP_URL (both)
- API_KEY (both)
- LOG_LEVEL (both)
```

### 4. Form Fields

```
FORM FIELDS
=====================================

Field Count:
sonarr:  8 fields
radarr:  10 fields (+2)

Field Types Used:
sonarr:  text(3), boolean(2), url(1), random(2)
radarr:  text(4), boolean(2), url(2), random(2)

Hints:
sonarr:  ✓ All fields have hints (8/8)
radarr:  ✓ All fields have hints (10/10)

Random Passwords:
sonarr:  2 fields use "type: random"
radarr:  2 fields use "type: random"
         ✓ Both use secure password generation

Unique fields in radarr:
- TMDB API Key (text)
- Custom Formats Enabled (boolean)
```

### 5. Best Practices Comparison

```
BEST PRACTICES SCORE
=====================================

                        sonarr   radarr
Schema v2 order         ✓        ✓
Variable prefixing      ✓        ✓
Native types           ✓        ✓
All hints present      ✓        ✓
short_desc ≤ 5 words   ✓        ✓
Docker tag verified    ✓        ✓
Logo < 100KB           ✓        ✓
Description format     ✓        ✓
Health check           ✗        ✓  ← radarr has it
ReadOnly mode          ✗        ✗
Advanced Docker props  ✗        ✗

SCORE: 8/11              9/11 ✓ Winner
```

### 6. Differences Highlighted

```
KEY DIFFERENCES
=====================================

1. Health Check
   sonarr:  ✗ No health check
   radarr:  ✓ Has health check

   Recommendation: Add health check to sonarr
   Template:
   {
     "healthCheck": {
       "test": "curl -f http://localhost:8989/ping",
       "interval": "30s",
       "timeout": "10s",
       "retries": 3
     }
   }

2. API Configuration
   sonarr:  Basic API key only
   radarr:  API key + TMDB integration

   Recommendation: Consider adding TMDB for sonarr if relevant

3. Volume Structure
   sonarr:  ${APP_DATA_DIR}/config, ${APP_DATA_DIR}/data
   radarr:  ${APP_DATA_DIR}/config, ${APP_DATA_DIR}/data

   ✓ Identical - good consistency

4. Description Complexity
   sonarr:  150 lines (standard)
   radarr:  180 lines (detailed)

   radarr has more usage examples
```

---

## Use Cases

### 1. Learning Before Creating

```
User: /compare-apps

Claude: I'll help you compare apps! What's your use case?
1. Learn before creating similar app
2. Check consistency across apps
3. Find best practices to apply
4. Identify missing features

User: 1

Claude: What app are you planning to create?
User: A media app like Sonarr

Claude: Great! Let me compare similar apps:
- sonarr (media automation)
- radarr (media automation)
- prowlarr (indexer management)

Which would you like to compare?
User: sonarr and radarr

[... generates comparison ...]

Based on this comparison, for your new media app:
✓ Use PUID/PGID (both use it)
✓ Add health check (radarr best practice)
✓ Use 2 volumes pattern (config + data)
✓ Prefix all variables
✓ Include API key configuration
```

### 2. Consistency Check

```
User: /compare-apps

Claude: Compare which apps?
App A: sonarr
App B: radarr

Comparing sonarr vs radarr...

INCONSISTENCIES DETECTED:
=====================================

1. Health Check
   sonarr: missing
   radarr: present

   → Should add to sonarr for consistency

2. Short Description
   sonarr: "TV series automation" (3 words) ✓
   radarr: "Movie collection automation" (3 words) ✓
   → Consistent ✓

3. Variable Naming
   Both use APP_* prefix consistently ✓

Recommendation: Add health check to sonarr
```

### 3. Migration Planning

```
User: /compare-apps

Claude: Compare which apps?
App A: old-app
App B: new-app

Comparing old-app vs new-app...

MIGRATION CHECKLIST:
=====================================

Variables to migrate:
- OLD_API_KEY → NEW_API_KEY
- OLD_DB_URL → NEW_DB_URL

New variables in new-app:
- NEW_WEBHOOK_URL (add to migration guide)
- NEW_FEATURE_FLAG (add to migration guide)

Volume changes:
- old: /data
- new: /config, /data (split volumes)

Action items for migration:
1. Add new variables to form_fields
2. Update volume structure
3. Create migration script
4. Update documentation
```

---

## Advanced Comparisons

### Pattern Detection

```
Analyzing patterns...

COMMON PATTERNS (both apps):
=====================================

1. LinuxServer.io Images
   Both use: lscr.io/linuxserver/*
   Pattern: Consistent image source

2. PUID/PGID Support
   Both: uid: 1000, gid: 1000
   Pattern: User permission management

3. Two-Volume Structure
   Both: config + data volumes
   Pattern: Separation of config and data

4. API Key Management
   Both: Random generated API keys
   Pattern: Security best practice

RECOMMENDATIONS for future apps:
- Continue using LinuxServer.io images
- Always include PUID/PGID
- Use two-volume pattern
- Generate API keys with type: random
```

### Category Analysis

```
CATEGORY: media apps
Comparing: sonarr, radarr, prowlarr, jellyfin

COMMON FEATURES:
- All use PUID/PGID
- All have 2+ volumes
- All expose port 8000-9000 range
- All use native types in form_fields

UNIQUE FEATURES:
- jellyfin: Hardware acceleration support
- prowlarr: Multiple API key support
- radarr: TMDB integration

RECOMMENDATION for new media app:
Must have: PUID/PGID, 2 volumes, API key
Consider: Hardware acceleration (if video)
Optional: Multiple API support (if aggregator)
```

---

## Output Options

Ask user preference:

1. **Full Report** (all sections)
2. **Summary** (key differences only)
3. **Specific Aspect** (e.g., just Docker config)
4. **Checklist** (what to copy from reference app)

---

## Practical Examples

### Example 1: Simple vs Complex

```
Comparing: beszel (simple) vs paperless-ngx (complex)

COMPLEXITY COMPARISON:
=====================================

beszel:
- 3 files total
- 0 form fields (no configuration)
- 1 service
- Simplest possible configuration

paperless-ngx:
- 3 files total
- 20+ form fields
- 1 service + database
- Complex configuration

LESSONS:
- Not all apps need form fields
- Simple apps can be just as valid
- Form fields depend on app requirements
- Both follow same file structure
```

### Example 2: Single vs Multi-Service

```
Comparing: sonarr (single) vs nextcloud (multi-service)

SERVICE ARCHITECTURE:
=====================================

sonarr:
- 1 service (app only)
- Self-contained
- No dependencies

nextcloud:
- 2 services (app + database)
- Uses dependsOn
- Inter-service communication

PATTERNS:
sonarr: Simple deployment
nextcloud: Complex with postgres

When to use each:
- Single service: App is self-contained
- Multi-service: App needs database
```

---

## Benefits

**Learning:**
- Understand patterns from existing apps
- See best practices in action
- Learn from differences

**Quality:**
- Ensure consistency across apps
- Identify missing features
- Improve configurations

**Efficiency:**
- Don't reinvent the wheel
- Copy proven patterns
- Avoid common mistakes

---

## When to Use

**Use `/compare-apps` when:**
- Creating similar app
- Checking consistency
- Learning best practices
- Planning improvements
- Migration planning

**Don't use when:**
- Apps are completely different
- Just need single app info (use Read)
- Looking for specific value (use Grep)

---

**Ready to compare apps?**
