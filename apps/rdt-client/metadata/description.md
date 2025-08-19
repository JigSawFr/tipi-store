# RDT-Client

[![GitHub Stars](https://img.shields.io/github/stars/rogerfar/rdt-client?style=flat-square)](https://github.com/rogerfar/rdt-client/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/rogerfar/rdt-client?style=flat-square)](https://github.com/rogerfar/rdt-client/issues)
[![GitHub License](https://img.shields.io/github/license/rogerfar/rdt-client?style=flat-square)](https://github.com/rogerfar/rdt-client/blob/main/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/rogerfar/rdtclient?style=flat-square)](https://hub.docker.com/r/rogerfar/rdtclient)

Real-Debrid Torrent Client is a web interface to manage your torrents on premium debrid services including Real-Debrid, AllDebrid, Premiumize, TorBox and DebridLink.

---

## 📖 SYNOPSIS

RDT-Client provides a comprehensive web interface for managing torrents through premium debrid services. It acts as a bridge between torrent clients and debrid services, allowing you to download torrents directly to your local storage while leveraging the speed and reliability of premium debrid providers. The application includes a fake qBittorrent API for seamless integration with popular media management applications.

## ✨ MAIN FEATURES

- **Multi-Provider Support**: Compatible with Real-Debrid, AllDebrid, Premiumize, TorBox, and DebridLink
- **Torrent Management**: Add torrents via magnet links or torrent files
- **Automatic Downloads**: Download all files from debrid services to local storage automatically
- **File Extraction**: Automatically unpack downloaded archives when complete
- **qBittorrent API**: Fake qBittorrent API for integration with Sonarr, Radarr, Couchpotato
- **Multiple Download Clients**: Support for Internal, Bezzad, Aria2c, Symlink, and Synology Download Station
- **Download Control**: Configurable speed limits, parallel connections, and timeouts
- **Web Interface**: Modern Angular-based web UI for easy management
- **Authentication**: Secure login system with configurable credentials
- **Logging**: Comprehensive logging with debug mode support

## 🌟 ADVANTAGES

- **Premium Speed**: Leverage high-speed debrid service downloads
- **Media Server Integration**: Seamless integration with popular *arr applications
- **Flexible Configuration**: Extensive customization options for download behavior
- **Multiple Architectures**: Support for ARM64 and AMD64 platforms
- **Container Ready**: Optimized Docker image with proper volume and permission handling
- **No VPN Required**: Debrid services handle copyright concerns
- **Centralized Management**: Single interface for multiple debrid providers
- **Real-time Monitoring**: Live download progress and status tracking

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `ghcr.io/rogerfar/rdtclient:2.0.116`
- **Base**: Linux Alpine with s6-overlay
- **Architectures**: `amd64`, `arm64`
- **User/Group**: Configurable via PUID/PGID (default: 1000/1000)
- **Port**: 6500 (HTTP)
- **Timezone**: Inherited from system via `${TZ}`

## 📁 VOLUMES

- `${APP_DATA_DIR}/data/db` → `/data/db` - Application database and configuration
- `${APP_DATA_DIR}/data/downloads` → `/data/downloads` - Downloaded files storage

## 🗃️ DEFAULT PARAMETERS

- **Port**: 6500
- **Download Path**: `/data/downloads`
- **Parallel Connections**: 8
- **Connection Timeout**: 30000ms
- **Speed Limit**: Unlimited (0)
- **Debug Logging**: Disabled

## 📝 ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `TZ` | Timezone | `${TZ}` |
| `BASE_PATH` | Base path for subfolder deployment | `` |
| `RD_API_KEY` | Real-Debrid API key | `` |
| `AD_API_KEY` | AllDebrid API key | `` |
| `PM_API_KEY` | Premiumize API key | `` |
| `TB_API_KEY` | TorBox API key | `` |
| `DL_API_KEY` | DebridLink API key | `` |
| `DOWNLOAD_PATH` | Container download path | `/data/downloads` |
| `MAPPED_PATH` | Host path mapping | `` |
| `DATABASE_CONNECTION_STRING` | Custom database connection | `` |
| `ENABLE_DEBUG` | Enable debug logging | `false` |
| `DOWNLOAD_SPEED_LIMIT` | Speed limit in MB/s | `0` |
| `PARALLEL_CONNECTIONS` | Parallel connections per download | `8` |
| `CONNECTION_TIMEOUT` | Connection timeout in milliseconds | `30000` |

## ⚠️ IMPORTANT

- **API Keys Required**: You need an active subscription to at least one supported debrid service
- **First Login**: The first credentials entered will be remembered for future logins
- **Download Path**: Ensure download path settings match your Docker volume mappings
- **Sonarr/Radarr Integration**: Configure as qBittorrent client with appropriate categories
- **Performance**: Recommended maximum of 8 parallel connections per download
- **File Permissions**: Use PUID/PGID to avoid permission issues with downloaded files
- **Health Check**: Application includes health check endpoint for monitoring

## 💾 SOURCE

- **GitHub Repository**: https://github.com/rogerfar/rdt-client
- **Docker Hub**: https://hub.docker.com/r/rogerfar/rdtclient
- **GitHub Container Registry**: https://ghcr.io/rogerfar/rdtclient
- **Documentation**: https://github.com/rogerfar/rdt-client/blob/main/README-DOCKER.md

## ❤️ PROVIDED WITH LOVE

This application configuration has been crafted with care to provide the best possible experience for managing torrents through premium debrid services. RDT-Client bridges the gap between traditional torrenting and modern media automation workflows, offering enterprise-grade features in a user-friendly package.
