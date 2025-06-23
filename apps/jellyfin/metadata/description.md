# Jellyfin

[![GitHub Release](https://img.shields.io/github/v/release/jellyfin/jellyfin?style=flat-square)](https://github.com/jellyfin/jellyfin/releases)
[![GitHub Stars](https://img.shields.io/github/stars/jellyfin/jellyfin?style=flat-square)](https://github.com/jellyfin/jellyfin/stargazers)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/jellyfin?style=flat-square)](https://hub.docker.com/r/linuxserver/jellyfin)
[![License](https://img.shields.io/github/license/jellyfin/jellyfin?style=flat-square)](https://github.com/jellyfin/jellyfin/blob/master/LICENSE)

Jellyfin is a Free Software Media System that puts you in control of managing and streaming your media.

---

## 📖 SYNOPSIS

Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way. It is an alternative to the proprietary Emby and Plex, to provide media from a dedicated server to end-user devices via multiple apps.

## ✨ MAIN FEATURES

- **Complete Media Management**: Organize and stream movies, TV shows, music, books, and photos
- **Cross-Platform Support**: Available on web, desktop, mobile, smart TVs, and more
- **Live TV & DVR**: Watch and record live television with compatible tuners
- **Hardware Acceleration**: Support for Intel, AMD, NVIDIA, and ARM hardware acceleration
- **No Fees or Tracking**: Completely free with no premium licenses, fees, or data collection
- **Multi-User Support**: Individual user profiles with customizable permissions and preferences
- **SyncPlay**: Watch content together with friends and family remotely
- **Plugin System**: Extend functionality with community-developed plugins
- **Mobile Sync**: Download content for offline viewing on mobile devices
- **DLNA Support**: Stream to DLNA-compatible devices on your network

## 🌟 ADVANTAGES

- **Free and Open Source**: No licensing fees, premium features, or hidden costs
- **Self-Hosted**: Complete control over your media and privacy
- **Active Community**: Large community of developers and users providing support
- **Regular Updates**: Frequent releases with new features and bug fixes
- **Extensive Client Support**: Official clients for most platforms and devices
- **Flexible Setup**: Easy installation with Docker or native packages
- **Hardware Acceleration**: Efficient transcoding with GPU support
- **Customizable Interface**: Themes and customization options available

## 🐳 DOCKER IMAGE DETAILS

- **Base Image**: LinuxServer.io Ubuntu with s6 overlay
- **Architecture Support**: amd64, arm64
- **Registry**: GitHub Container Registry (ghcr.io/linuxserver/jellyfin)
- **User Management**: PUID/PGID support for proper file permissions
- **Hardware Support**: Intel Quick Sync, NVIDIA NVENC, AMD VCE, V4L2

## 📁 VOLUMES

- **Config**: `${APP_DATA_DIR}/data/config` → `/config` (Jellyfin configuration and database)
- **Movies**: `${APP_DATA_DIR}/data/movies` → `/data/movies` (Movie library)
- **TV Shows**: `${APP_DATA_DIR}/data/tvshows` → `/data/tvshows` (TV series library)
- **Music**: `${APP_DATA_DIR}/data/music` → `/data/music` (Music library)
- **Books**: `${APP_DATA_DIR}/data/books` → `/data/books` (E-book library)
- **Photos**: `${APP_DATA_DIR}/data/photos` → `/data/photos` (Photo library)

## 🗃️ DEFAULT PARAMETERS

- **Main Port**: 8096 (HTTP Web Interface)
- **HTTPS Port**: 8920 (Optional - requires certificate setup)
- **Client Discovery**: 7359/UDP (Local network discovery)
- **Service Discovery**: 1900/UDP (DLNA and UPnP)
- **Timezone**: Etc/UTC
- **User ID**: 1000
- **Group ID**: 1000

## 📝 ENVIRONMENT

All environment variables are prefixed with `JELLYFIN_` for consistency:

- **JELLYFIN_TZ**: Timezone setting (default: Etc/UTC)
- **JELLYFIN_PUBLISHED_SERVER_URL**: Public URL for autodiscovery
- **JELLYFIN_ENABLE_HTTPS**: Enable HTTPS port 8920 (default: false)
- **JELLYFIN_ENABLE_SERVICE_DISCOVERY**: Enable DLNA/UPnP discovery (default: true)
- **JELLYFIN_ENABLE_CLIENT_DISCOVERY**: Enable client discovery (default: true)
- **JELLYFIN_ENABLE_HARDWARE_ACCELERATION**: Mount /dev/dri for GPU acceleration (default: false)

## ⚠️ IMPORTANT

- **First Setup**: Access the web interface at `http://your-server:8096` to complete initial setup
- **Media Organization**: Organize your media in separate folders (movies, TV shows, music, etc.)
- **Hardware Acceleration**: Enable only if you have compatible hardware (Intel/AMD/NVIDIA GPUs)
- **Network Discovery**: Service and client discovery ports are optional but recommended for best experience
- **HTTPS Setup**: If enabling HTTPS, you must provide your own SSL certificates
- **Performance**: For large libraries, consider SSD storage for the config volume
- **Permissions**: Ensure media files are readable by the container user (UID 1000)

## 💾 SOURCE

- **Official Website**: [https://jellyfin.org/](https://jellyfin.org/)
- **GitHub Repository**: [https://github.com/jellyfin/jellyfin](https://github.com/jellyfin/jellyfin)
- **Docker Image**: [https://github.com/linuxserver/docker-jellyfin](https://github.com/linuxserver/docker-jellyfin)
- **Documentation**: [https://jellyfin.org/docs/](https://jellyfin.org/docs/)
- **Demo**: [https://demo.jellyfin.org/stable](https://demo.jellyfin.org/stable)

## ❤️ PROVIDED WITH LOVE

This Jellyfin integration for Tipi is provided with care by the community. Jellyfin is developed by a dedicated team of volunteers who believe in free and open-source software. Support the project by contributing code, documentation, or [donations](https://opencollective.com/jellyfin).
