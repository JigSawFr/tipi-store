---
agent: "agent"
---

# Check for Available Updates

Check for Docker image updates for **$ARGUMENTS** (or all apps if not specified).

## Process

### For Single App

1. Read `apps/[app-name]/docker-compose.json`
2. Extract Docker image and current tag
3. Check registry for latest tag
4. Compare versions

### For All Apps

1. List all directories in `apps/`
2. For each app, check for updates
3. Generate summary report

## Checking Methods

### GitHub Container Registry (ghcr.io)
```powershell
# Get latest release from GitHub API
$repo = "owner/repo"
$latest = (Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest").tag_name
```

### Docker Hub
```powershell
# Get tags from Docker Hub
$image = "library/image"
$tags = (Invoke-RestMethod "https://hub.docker.com/v2/repositories/$image/tags").results
```

## Report Format

### Single App
```
Update Check: beszel
====================

Current: 0.16.0
Latest:  0.17.0

Status: ⬆️ Update available!

To update, run:
/update-and-commit beszel 0.17.0
```

### All Apps
```
Update Check: All Applications
==============================

⬆️ Updates Available (3):
  beszel: 0.16.0 → 0.17.0
  radarr: 5.14.0 → 5.15.0
  sonarr: 4.0.10 → 4.0.11

✓ Up to date (32):
  paperless-ngx, plex, prowlarr, ...

Total: 35 apps checked
```

## Notes

- Some images use `v` prefix (v1.0.0), others don't (1.0.0)
- Check GitHub releases for changelog before updating
- Major version updates may have breaking changes
