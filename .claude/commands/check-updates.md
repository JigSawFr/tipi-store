---
description: Check for available updates for all or specific apps by comparing with GitHub releases
---

# Check Updates

Check for available Docker image updates by comparing current versions with latest GitHub releases.

## Process

### Mode 1: Single App Check

Ask user for app name, check for updates.

```bash
# 1. Read current version from config.json
current_version = "0.16.0"

# 2. Get image info from docker-compose.json
image = "ghcr.io/henrygd/beszel/beszel"

# 3. Extract GitHub repo from config.json source
repo = "henrygd/beszel"

# 4. Check GitHub releases API
# GET https://api.github.com/repos/henrygd/beszel/releases/latest

# 5. Compare versions
latest_version = "0.17.0"

# 6. Report if update available
if latest_version > current_version:
  → Update available!
```

### Mode 2: Check All Apps

Scan all apps in `/apps/` directory and check for updates.

---

## Example: Single App

```
User: /check-updates

Claude: Check updates for:
1. Single app
2. All apps
3. Specific apps (list)

User: 1

Claude: Which app? beszel

Checking for updates...

App: beszel
Current version: 0.16.0
Image: ghcr.io/henrygd/beszel/beszel
GitHub: henrygd/beszel

Fetching latest release from GitHub...
Latest version: 0.17.0

✓ UPDATE AVAILABLE!
  Current: 0.16.0
  Latest:  0.17.0
  Released: 2024-12-10

Update now?
1. Yes, update and commit (/update-and-commit)
2. Yes, update only (/update-version)
3. No, just notify

User: 1

[Launches /update-and-commit beszel 0.17.0]
```

---

## Example: All Apps

```
User: /check-updates

Claude: Check updates for:
1. Single app
2. All apps
3. Specific apps

User: 2

Claude: Scanning all 35 apps...

Checking updates:
[████████████████████] 35/35

Results:
=====================================

✓ UPDATES AVAILABLE (5 apps):

1. beszel
   Current: 0.16.0 → Latest: 0.17.0
   Released: 2 days ago

2. paperless-ngx
   Current: 2.20.1 → Latest: 2.20.2
   Released: 1 day ago

3. autobrr
   Current: 1.70.0 → Latest: 1.71.0
   Released: 3 hours ago

4. gotenberg
   Current: 8.25.0 → Latest: 8.25.1
   Released: 1 week ago

5. lubelogger-mcp
   Current: 0.0.4 → Latest: 0.0.5
   Released: 2 days ago

✓ UP TO DATE (30 apps):
sonarr, radarr, prowlarr, ... (list all)

What would you like to do?
1. Update all 5 apps automatically
2. Update specific apps (select)
3. Just report, no updates

User: 1

Claude: Updating 5 apps in batch mode...

[1/5] beszel → 0.17.0
✓ Updated and committed

[2/5] paperless-ngx → 2.20.2
✓ Updated and committed

[3/5] autobrr → 1.71.0
✓ Updated and committed

[4/5] gotenberg → 8.25.1
✓ Updated and committed

[5/5] lubelogger-mcp → 0.0.5
✓ Updated and committed

Summary:
✓ 5 apps updated
✓ 5 commits created
✓ All pushed to main

All apps are now up to date! ✓
```

---

## Example: Specific Apps

```
User: /check-updates

Claude: Check updates for:
1. Single app
2. All apps
3. Specific apps

User: 3

Claude: Enter app names (comma-separated):
beszel, paperless-ngx, sonarr

Checking 3 apps...

Results:
=====================================

✓ UPDATES AVAILABLE (1):
beszel: 0.16.0 → 0.17.0

✓ UP TO DATE (2):
paperless-ngx: 2.20.2 (latest)
sonarr: 4.0.10 (latest)

Update beszel now? (y/n): y

[Launches update workflow]
```

---

## Version Comparison Methods

### Method 1: GitHub Releases API (Preferred)

```bash
# For most apps with GitHub releases
GET https://api.github.com/repos/{owner}/{repo}/releases/latest

# Extract version from tag_name
# Handle different formats: v1.2.3, 1.2.3, version-1.2.3
```

### Method 2: Container Registry Tags

```bash
# For apps without GitHub releases
# Check ghcr.io, Docker Hub, etc.

# GHCR
curl -s "https://ghcr.io/v2/{owner}/{repo}/tags/list"

# Docker Hub
curl -s "https://registry.hub.docker.com/v2/repositories/{owner}/{repo}/tags"
```

### Method 3: Git Tags

```bash
# Fallback if no releases
git ls-remote --tags https://github.com/{owner}/{repo}
```

---

## Smart Features

### 1. Version Parsing

Handle different version formats:
- `v1.2.3` → `1.2.3`
- `release-1.2.3` → `1.2.3`
- `version-1.2.3` → `1.2.3`
- `1.2.3-beta` → `1.2.3` (exclude pre-releases by default)

### 2. Release Age

Show how recent the release is:
- "3 hours ago" → Very recent
- "2 days ago" → Recent
- "1 week ago" → Should update
- "1 month ago" → Needs attention

### 3. Changelogs

Optionally fetch and show changelog:
```
beszel: 0.16.0 → 0.17.0

Changelog:
- Added: New dashboard widget
- Fixed: Memory leak in agent
- Updated: Dependencies
```

### 4. Auto-Update Strategy

Ask user preference:
- **Conservative**: Only patch updates (1.2.3 → 1.2.4)
- **Moderate**: Minor + patch (1.2.3 → 1.3.0)
- **Aggressive**: All updates (1.2.3 → 2.0.0)

---

## Scheduled Checks

Suggest setting up scheduled checks:

```
Would you like to enable scheduled update checks?
1. Daily check
2. Weekly check
3. Manual only

This will create GitHub Action workflow to:
- Check for updates daily/weekly
- Create issues for available updates
- Optionally auto-create PRs
```

---

## Output Formats

### 1. Terminal Output (Default)

Interactive, with colors and emojis.

### 2. Report Format

```markdown
# Update Report - 2024-12-14

## Updates Available (5)
| App | Current | Latest | Age | Priority |
|-----|---------|--------|-----|----------|
| beszel | 0.16.0 | 0.17.0 | 2 days | High |
| paperless-ngx | 2.20.1 | 2.20.2 | 1 day | High |
...

## Up to Date (30)
- sonarr: 4.0.10
- radarr: 5.8.3
...
```

### 3. JSON Format

For automation:
```json
{
  "checked_at": "2024-12-14T10:00:00Z",
  "total_apps": 35,
  "updates_available": 5,
  "apps": [
    {
      "name": "beszel",
      "current": "0.16.0",
      "latest": "0.17.0",
      "update_available": true
    }
  ]
}
```

---

## Error Handling

### Rate Limiting

```
⚠️  GitHub API rate limit reached (60 requests/hour)

Checked 20/35 apps before rate limit.

Options:
1. Wait 45 minutes and resume
2. Use authenticated API (provide GitHub token)
3. Check remaining apps via Docker registry
```

### Network Errors

```
❌ Failed to check updates for: beszel
Reason: Network timeout

Continue with remaining apps? (y/n)
```

---

## Advantages

**Proactive:**
- Find updates before manual checking
- Stay current with latest releases
- Security patches identified quickly

**Efficient:**
- Check all apps at once
- Batch update available
- Save hours of manual work

**Smart:**
- Version comparison logic
- Age-based prioritization
- Changelog integration

---

## When to Use

**Use `/check-updates` when:**
- Want to see what's outdated
- Planning update session
- Regular maintenance
- After Renovate bot updates

**Don't use when:**
- Just updated recently
- In middle of other work
- Rate limits reached

---

**Ready to check for available updates?**
