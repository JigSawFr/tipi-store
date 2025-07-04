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
| `/runtipi/app-data/mediamanager/data/backend` | `/data` | Backend data and configuration |
| `/runtipi/app-data/mediamanager/data/postgres` | `/var/lib/postgresql/data` | PostgreSQL database files |

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
| `MEDIAMANAGER_FRONTEND_URL` | Frontend access URL | Yes | - |

### Database Settings
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MEDIAMANAGER_DB_HOST` | PostgreSQL hostname | No | mediamanager-db |
| `MEDIAMANAGER_DB_PORT` | PostgreSQL port | No | 5432 |
| `MEDIAMANAGER_DB_USER` | Database username | No | MediaManager |
| `MEDIAMANAGER_DB_PASSWORD` | Database password | No | MediaManager |
| `MEDIAMANAGER_DB_DBNAME` | Database name | No | MediaManager |

### Download Client (Optional)
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MEDIAMANAGER_QBITTORRENT_HOST` | qBittorrent API host | No | - |
| `MEDIAMANAGER_QBITTORRENT_PORT` | qBittorrent API port | No | 8080 |
| `MEDIAMANAGER_QBITTORRENT_USERNAME` | qBittorrent username | No | - |
| `MEDIAMANAGER_QBITTORRENT_PASSWORD` | qBittorrent password | No | - |

### Indexer Integration (Optional)
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MEDIAMANAGER_PROWLARR_ENABLED` | Enable Prowlarr integration | No | false |
| `MEDIAMANAGER_PROWLARR_URL` | Prowlarr base URL | No | - |
| `MEDIAMANAGER_PROWLARR_API_KEY` | Prowlarr API key | No | - |
| `MEDIAMANAGER_JACKETT_ENABLED` | Enable Jackett integration | No | false |
| `MEDIAMANAGER_JACKETT_URL` | Jackett base URL | No | - |
| `MEDIAMANAGER_JACKETT_API_KEY` | Jackett API key | No | - |
| `MEDIAMANAGER_JACKETT_INDEXERS` | Jackett indexers list | No | ["all"] |

### Authentication (Optional)
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MEDIAMANAGER_AUTH_SESSION_LIFETIME` | Session lifetime in seconds | No | 86400 |
| `MEDIAMANAGER_AUTH_EMAIL_PASSWORD_RESETS` | Enable email password resets | No | false |
| `MEDIAMANAGER_OPENID_ENABLED` | Enable OpenID Connect | No | false |
| `MEDIAMANAGER_OPENID_CLIENT_ID` | OpenID client ID | No | - |
| `MEDIAMANAGER_OPENID_CLIENT_SECRET` | OpenID client secret | No | - |
| `MEDIAMANAGER_OPENID_CONFIGURATION_ENDPOINT` | OpenID discovery URL | No | - |
| `MEDIAMANAGER_OPENID_NAME` | OpenID provider name | No | OpenID |

---

## ⚠️ IMPORTANT
- **PostgreSQL Required**: MediaManager requires a PostgreSQL database which is automatically included
- **Admin Setup**: The first user with email matching `AUTH_ADMIN_EMAIL` will receive admin privileges
- **Indexer Integration**: Configure Prowlarr or Jackett for automated media discovery
- **Download Client**: qBittorrent integration optional but recommended for automated downloads
- **OAuth Setup**: When using OpenID Connect, ensure redirect URI is configured as `{FRONTEND_URL}/api/v1/auth/cookie/{OPENID_NAME}/callback`

---

## 💾 SOURCE
- **GitHub Repository**: [https://github.com/maxdorninger/MediaManager](https://github.com/maxdorninger/MediaManager)
- **Documentation**: [https://maxdorninger.github.io/MediaManager/](https://maxdorninger.github.io/MediaManager/)
- **Docker Images**: [GitHub Container Registry](https://github.com/maxdorninger/MediaManager/pkgs/container/package/mediamanager%2Fbackend)

---

## ❤️ PROVIDED WITH LOVE
MediaManager is developed by [maxdorninger](https://github.com/maxdorninger) and the open-source community. Special thanks to all contributors working to provide a modern, unified media management solution.
