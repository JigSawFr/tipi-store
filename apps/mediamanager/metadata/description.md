# MEDIAMANAGER

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/maxdorninger/MediaManager) [<img src="https://img.shields.io/github/issues/maxdorninger/MediaManager?color=7842f5">](https://github.com/maxdorninger/MediaManager/issues)

Modern management system for your TV and movie library.

---

## 📖 SYNOPSIS
MediaManager is modern software designed to manage your TV and movie library. It serves as a replacement for Sonarr, Radarr, Overseerr, and Jellyseerr, providing a unified interface for media management with support for TVDB and TMDB metadata, OIDC and OAuth 2.0 authentication, and integration with Prowlarr and Jackett indexers.

---

## ✨ MAIN FEATURES
- Complete media library management for TV shows and movies
- TVDB and TMDB metadata integration with fallback support
- OIDC and OAuth 2.0 authentication support
- Prowlarr and Jackett indexer integration
- qBittorrent download client support
- Modern web interface with responsive design
- API for programmatic interaction and automation
- Multi-user support with admin privileges
- Email notifications and multiple notification providers (Gotify, Pushover, ntfy)
- Built-first for Docker deployment

---

## 🌟 ADVANTAGES
- Unified replacement for multiple *arr applications
- Modern, responsive web interface
- Comprehensive authentication options including OAuth
- Active development with regular updates
- Open source and transparent
- Docker-first deployment approach

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root** for improved security
- **Multi-service architecture** with separate backend, frontend, and database
- **Based on [ghcr.io/maxdorninger/mediamanager](https://github.com/maxdorninger/MediaManager)**
- PostgreSQL database for reliable data storage
- Multi-architecture support (amd64, arm64)
- Health checks for service monitoring

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/mediamanager/data/backend` | `/data` | Backend data including images, TV shows, movies, and torrents |
| `/runtipi/app-data/mediamanager/data/postgres` | `/var/lib/postgresql/data` | PostgreSQL database files |

The backend container has access to subdirectories:
- `/data/images` - Movie and TV show posters and metadata images
- `/data/tv` - TV shows library files  
- `/data/movies` - Movies library files
- `/data/torrents` - Torrent downloads and temporary files

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| Port | 3000 | Web interface port |
| Database | PostgreSQL 16 | Backend database |
| Authentication | Email/Password | Default auth method |
| Session Lifetime | 86400s (1 day) | User session duration |

---

## 📝 ENVIRONMENT
### Required Configuration
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MEDIAMANAGER_AUTH_TOKEN_SECRET` | JWT signing secret (auto-generated) | Yes | (random) |
| `MEDIAMANAGER_AUTH_ADMIN_EMAIL` | Administrator email address | Yes | - |

### Auto-configured Settings
The following settings are automatically configured by Tipi:
- **Frontend URL**: Automatically generated from `${APP_PROTOCOL}://${APP_DOMAIN}`
- **Database Host**: mediamanager-db
- **Database Port**: 5432
- **Database Username**: MediaManager
- **Database Password**: MediaManager
- **Database Name**: MediaManager

---

## ⚠️ IMPORTANT
- **PostgreSQL Required**: MediaManager requires a PostgreSQL database which is automatically included and configured
- **Admin Setup**: The first user with email matching `AUTH_ADMIN_EMAIL` will receive admin privileges
- **Ultra-Simple Configuration**: Only 2 environment variables required - everything else is auto-configured by Tipi
- **Additional Features**: Indexer integration (Prowlarr/Jackett), download clients (qBittorrent), and OAuth can be configured later through the web interface

---

## 💾 SOURCE
- **GitHub Repository**: [https://github.com/maxdorninger/MediaManager](https://github.com/maxdorninger/MediaManager)
- **Documentation**: [https://maxdorninger.github.io/MediaManager/](https://maxdorninger.github.io/MediaManager/)
- **Docker Images**: [GitHub Container Registry](https://github.com/maxdorninger/MediaManager/pkgs/container/package/mediamanager%2Fbackend)

---

## ❤️ PROVIDED WITH LOVE
MediaManager is developed by [maxdorninger](https://github.com/maxdorninger) and the open-source community. Special thanks to all contributors working to provide a modern, unified media management solution.
