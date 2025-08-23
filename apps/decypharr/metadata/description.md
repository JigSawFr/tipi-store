# Decypharr

[![GitHub Stars](https://img.shields.io/github/stars/sirrobot01/decypharr?style=flat-square)](https://github.com/sirrobot01/decypharr/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/sirrobot01/decypharr?style=flat-square)](https://github.com/sirrobot01/decypharr/issues)
[![GitHub License](https://img.shields.io/github/license/sirrobot01/decypharr?style=flat-square)](https://github.com/sirrobot01/decypharr/blob/main/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/sirrobot01/decypharr?style=flat-square)](https://hub.docker.com/r/sirrobot01/decypharr)

QBittorrent API implementation for multiple debrid services. Provides seamless integration between media automation tools and premium debrid providers.

---

## 📖 SYNOPSIS

Decypharr is a comprehensive solution that bridges the gap between your media automation stack and premium debrid services. It provides a QBittorrent-compatible API that allows Sonarr, Radarr, and other *arr applications to seamlessly interact with multiple debrid providers including Real-Debrid, Torbox, Debrid-Link, and All-Debrid. The application uses FUSE mounting to provide transparent access to downloaded content.

## ✨ MAIN FEATURES

- **QBittorrent API Compatibility**: Drop-in replacement for QBittorrent in media automation tools
- **Multi-Provider Support**: Real-Debrid, Torbox, Debrid-Link, and All-Debrid integration
- **FUSE File System**: Mount debrid downloads as local file systems for seamless access
- **WebDAV Server**: Built-in WebDAV server for each debrid provider
- **Repair Worker**: Automated detection and repair of missing files and symlinks
- **Download Management**: Unified interface for managing downloads across different services
- **Media Integration**: Full compatibility with Sonarr, Radarr, Lidarr, and Prowlarr
- **Web Interface**: Modern web UI for torrent and download management
- **Rclone Integration**: Optional mounting using Rclone for enhanced compatibility
- **Debug Logging**: Comprehensive logging system for troubleshooting

## 🌟 ADVANTAGES

- **Unified Interface**: Single API for multiple debrid services eliminates provider switching
- **Transparent Access**: FUSE mounting makes debrid downloads appear as local files
- **Automation Ready**: Perfect integration with existing *arr application workflows
- **Performance**: Leverages premium debrid infrastructure for fast downloads
- **Flexibility**: Support for multiple providers allows for redundancy and choice
- **Modern Architecture**: Built with Go for performance and reliability
- **Active Development**: Regular updates and community support

## 🐳 DOCKER IMAGE DETAILS

- **Base Image**: Official Go runtime with FUSE support
- **Size**: Optimized multi-stage build for minimal footprint
- **Architectures**: amd64, arm64 support
- **Privileges**: Requires privileged mode for FUSE mounting
- **Devices**: Needs access to `/dev/fuse` device
- **Registry**: Available on GitHub Container Registry (ghcr.io)

## 📁 VOLUMES

| Container Path | Description | Required |
|----------------|-------------|----------|
| `/app/data` | Application data and configuration | Yes |
| `/media` | Media library access point | Recommended |

## 🗃️ DEFAULT PARAMETERS

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| **Port** | `7777` | Web interface and API port |
| **PUID** | `1000` | User ID for file permissions |
| **PGID** | `1000` | Group ID for file permissions |
| **Download Path** | `/app/data/downloads` | Default download location |
| **Debug Mode** | `false` | Enable debug logging |

## 📝 ENVIRONMENT

**Decypharr uses web-based configuration** - no environment variables needed for application settings.

| Variable | Description | Required |
|----------|-------------|----------|
| `PUID` | User ID for file permissions | Yes |
| `PGID` | Group ID for file permissions | Yes |
| `TZ` | Timezone for the container | Recommended |

### 🔧 Configuration Method

All application settings are configured through the **web interface**:

1. **Access**: Navigate to `http://your-server:8282` after installation
2. **Setup**: Complete the first-time configuration wizard
3. **Network Binding**: ⚠️ **Important** - Set bind address to `0.0.0.0` in the web interface to enable access via domain/local network (default is `127.0.0.1`)
4. **Debrid Services**: Add API keys for Real-Debrid, Torbox, Debrid-Link, or All-Debrid
5. **Integration**: Configure QBittorrent API settings for *arr applications
6. **Advanced**: Set up mount paths, download handling, and repair options

The web interface provides comprehensive configuration for:
- Authentication (username/password for API access)
- Debrid service integration and API keys
- Download paths and file handling
- QBittorrent API compatibility settings
- Rclone mount configuration
- Repair worker settings

## ⚠️ IMPORTANT

- **FUSE Mounting**: Requires `SYS_ADMIN` capability and `/dev/fuse` device access
- **Security**: Uses `apparmor:unconfined` for FUSE operations
- **Web Configuration**: All settings configured via web interface at port 8282
- **Network Binding**: Must set bind address to `0.0.0.0` in web interface for domain/local access
- **Premium Accounts**: Requires active premium accounts with supported debrid services
- **File Permissions**: Ensure PUID/PGID match your media server setup
- **Network Access**: Application needs internet access to communicate with debrid APIs
- **Storage Space**: Ensure sufficient storage for downloaded content and mount points

## 💾 SOURCE

**Application**: [sirrobot01/decypharr](https://github.com/sirrobot01/decypharr)  
**Docker**: [ghcr.io/sirrobot01/decypharr](https://github.com/sirrobot01/decypharr/pkgs/container/decypharr)  
**Documentation**: [Decypharr Docs](https://sirrobot01.github.io/decypharr/)

## ❤️ PROVIDED WITH LOVE

This application is provided by the tipi-store community. If you appreciate this integration, consider:
- ⭐ Starring the [original project](https://github.com/sirrobot01/decypharr)
- 🐛 Reporting issues or suggestions
- 🤝 Contributing to the tipi-store repository
- 💬 Joining our community discussions
