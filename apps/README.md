# 📦 Applications Directory

This directory contains all available applications for the tipi-store. Each application is self-contained with its own configuration, Docker setup, and metadata.

## 📁 Directory Structure

Each application follows a standardized structure:

```
apps/
├── {app-name}/
│   ├── config.json              # Tipi configuration
│   ├── docker-compose.json      # Docker services definition
│   ├── data/                    # Optional: Default data directories
│   └── metadata/
│       ├── description.md       # Application description
│       └── logo.jpg            # Application logo (512x512px recommended)
```

## 📋 Available Applications

### 🎬 Media Management
- **[Plex](./plex/)** - Media server for streaming movies, TV shows, and music
- **[Overseerr](./overseerr/)** - Request management system for Plex/Jellyfin
- **[Tautulli](./tautulli/)** - Monitoring and analytics for Plex Media Server

### 🏴‍☠️ Download Management
- **[Radarr](./radarr/)** - Movie collection manager for Usenet and BitTorrent
- **[Sonarr](./sonarr/)** - TV series collection manager
- **[Prowlarr](./prowlarr/)** - Indexer manager for *arr applications
- **[Transmission VPN](./transmission-vpn/)** - BitTorrent client with VPN integration
- **[autobrr](./autobrr/)** - Modern autodl-irssi replacement for IRC and RSS

### 🛠️ Utilities & Tools
- **[Configarr](./configarr/)** - Configuration automation for Sonarr, Radarr and other *arr apps
- **[Profilarr](./profilarr/)** - Configuration management with web UI and Git version control for *arr apps
- **[Recyclarr](./recyclarr/)** - Automatically sync TRaSH guides to Sonarr/Radarr
- **[Kometa](./kometa/)** - Python tool for managing Plex libraries and metadata
- **[Homebox](./homebox/)** - Inventory and organization system for the home
- **[LubeLogger](./lubelogger/)** - Vehicle service and maintenance tracker
- **[Mazanoke](./mazanoke/)** - Self-hosted browser image optimizer with privacy-focused design
- **[Pocket ID](./pocket-id/)** - Lightweight identity provider with OAuth2/OpenID Connect support
- **[TinyAuth](./tinyauth/)** - Simple authentication middleware for Docker applications

### 📄 Document Management
- **[Paperless-ngx](./paperless-ngx/)** - Document management system with OCR and full-text search
- **[Paperless-AI](./paperless-ai/)** - AI-powered document analyzer for Paperless-ngx with automated tagging and RAG chat

### 📊 Monitoring & Analytics
- **[Beszel](./beszel/)** - Lightweight server monitoring with web interface
- **[Beszel Agent](./beszel-agent/)** - Data collection agent for Beszel monitoring

### 🔍 Search & Discovery
- **[Huntarr](./huntarr/)** - Automated missing & upgrade search for *arr applications
- **[Byparr](./byparr/)** - Bypass manager for *arr applications

### 🧹 Cleanup & Maintenance
- **[Swaparr](./swaparr/)** - Stalled download cleanup utility for *arr applications

## 📝 File Specifications

### `config.json`
Tipi-specific configuration file containing:
- **Application metadata** (id, name, description, version)
- **Port configuration** and networking setup
- **Category and tags** for organization
- **Installation requirements** and dependencies

**Standard key order:**
```json
{
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "Application Name",
  "description": "Brief description",
  "tipi_version": "1.0.0",
  "version": "latest",
  "categories": ["category"],
  "short_desc": "One-line description",
  "author": "Developer Name",
  "source": "https://github.com/...",
  "website": "https://...",
  "supported_architectures": ["amd64", "arm64"]
}
```

### `docker-compose.json`
Docker Compose configuration defining:
- **Service definitions** with image specifications
- **Volume mappings** for persistent data
- **Network configuration** and port exposure
- **Environment variables** and runtime settings

**Requirements:**
- Ports must be specified as strings (e.g., `"8080:8080"`)
- Use semantic versioning for image tags when possible
- Include health checks where applicable

### `metadata/description.md`
Markdown file with structured application description:
- **Emoji header** representing the application
- **Brief overview** and key features
- **Setup instructions** and configuration notes
- **Usage guidelines** and tips

**Standard format:**
```markdown
# 🎬 Application Name

Brief description of what the application does.

## ✨ Features
- Feature 1
- Feature 2
- Feature 3

## 📋 Requirements
- Requirement 1
- Requirement 2

## 🚀 Getting Started
1. Step 1
2. Step 2
3. Step 3
```

### `metadata/logo.jpg`
Application logo/icon:
- **Format:** JPG or PNG
- **Size:** 512x512px recommended
- **Quality:** High resolution for dashboard display
- **Style:** Clean, recognizable icon

## 🔄 Automated Maintenance

Applications in this directory are automatically maintained through:

### Renovate Integration
- **Dependency updates** for Docker images
- **Version synchronization** between docker-compose and config files
- **Automated testing** and validation

### CI/CD Workflows
- **Configuration validation** on every change
- **Consistency checks** across all files
- **Automated merging** for minor/patch updates
- **Manual review** required for major version updates

## 🛠️ Adding New Applications

### 1. Create Application Directory
```bash
mkdir apps/new-app
cd apps/new-app
```

### 2. Create Required Files
```bash
# Create configuration files
touch config.json docker-compose.json

# Create metadata directory
mkdir metadata
touch metadata/description.md
# Add logo.jpg to metadata/
```

### 3. Follow Standards
- Use the standardized `config.json` key order
- Ensure docker-compose ports are strings
- Write comprehensive description with emoji formatting
- Include high-quality logo (512x512px)

### 4. Validation
- Test Docker Compose configuration locally
- Validate JSON syntax and structure
- Ensure all required fields are present
- Check for consistency between files

## 🔍 Troubleshooting

### Common Issues
- **Port conflicts:** Ensure unique ports across applications
- **Volume paths:** Use relative paths from application directory
- **Image availability:** Verify Docker images exist and are accessible
- **Architecture support:** Check image compatibility with target platforms

### Validation Tools
```bash
# Validate JSON syntax
Get-Content config.json | ConvertFrom-Json

# Test Docker Compose
docker-compose -f docker-compose.json config

# Check file structure
ls -la metadata/
```

## 📊 Statistics

**Total Applications:** 22  
**Categories:** Media Management, Download Management, Utilities, Monitoring, Search  
**Supported Architectures:** amd64, arm64  
**Update Frequency:** Automated via Renovate (hourly checks)

---

## 🔗 Related Documentation

- **[Main README](../README.md)** - Project overview and setup
- **[CI/CD Documentation](../.github/RENOVATE_CONFIG_SUMMARY.md)** - Automation details
- **[Workflow Scripts](../.github/scripts/)** - Maintenance automation
- **[Renovate Config](../renovate.json)** - Dependency update configuration

For questions or contributions, please refer to the main project documentation or open an issue in the repository.
