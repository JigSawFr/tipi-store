# ☁️ NEXTCLOUD

[![GitHub Stars](https://img.shields.io/github/stars/nextcloud/server?style=flat-square&logo=github)](https://github.com/nextcloud/server)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/nextcloud?style=flat-square&logo=docker)](https://hub.docker.com/r/linuxserver/nextcloud)
[![License](https://img.shields.io/github/license/nextcloud/server?style=flat-square)](https://github.com/nextcloud/server/blob/master/COPYING)

Nextcloud gives you access to all your files wherever you are. A secure, self-hosted content collaboration platform with file sync, real-time document editing, video chat & groupware.

---

## 📖 SYNOPSIS

Nextcloud is a suite of client-server software for creating and using file hosting services. It is functionally similar to Dropbox, Google Drive, and iCloud, but is designed to be self-hosted on your own server to provide you with complete control over your data and privacy.

## ✨ MAIN FEATURES

- **📁 File sync & share** - Access your data from all your devices, wherever you are
- **📝 Real-time collaboration** - Edit documents collaboratively with built-in office suite
- **💬 Video calls & chat** - Built-in video conferencing and text chat with Nextcloud Talk
- **📅 Calendar & Contacts** - Manage your calendar and contacts with integrated groupware
- **🔒 Security & Privacy** - End-to-end encryption, two-factor authentication, and extensive security features
- **🧩 Extensible** - Huge library of apps to extend functionality
- **🏠 Self-hosted** - Full control over your data on your infrastructure
- **🌐 Cross-platform** - Desktop, mobile, and web clients for all major platforms

## 🌟 ADVANTAGES

- **Complete data sovereignty** - Your data stays on your servers
- **No vendor lock-in** - Open source with no subscription fees
- **Unlimited storage** - Only limited by your server capacity
- **Enterprise-grade security** - Advanced permission management and audit logs
- **Active community** - Large, active development community with regular updates
- **Professional support** - Enterprise support available from Nextcloud GmbH

## 🐳 DOCKER IMAGE DETAILS

This app uses the official LinuxServer.io Nextcloud Docker image:
- **Image**: `lscr.io/linuxserver/nextcloud:latest`
- **Version**: 31.0.6 (Latest stable)
- **Architectures**: amd64, arm64
- **Base**: Alpine Linux with s6-overlay

## 📁 VOLUMES

| Container Path | Description |
|---|---|
| `/config` | Nextcloud application data and configuration |
| `/data` | User data files and uploads |

## 🗃️ DEFAULT PARAMETERS

| Parameter | Default Value | Description |
|---|---|---|
| **Port** | `443` | HTTPS web interface port |
| **PUID** | `1000` | User ID for file permissions |
| **PGID** | `1000` | Group ID for file permissions |
| **TZ** | `${TZ}` | Timezone setting (managed by Tipi) |

## 📝 ENVIRONMENT

No additional environment variables are required. Nextcloud will automatically use the timezone and user settings configured in your Tipi instance.

## ⚠️ IMPORTANT

### Initial Setup
1. After installation, access Nextcloud via your configured domain/IP on port 443 (HTTPS)
2. Follow the setup wizard to create your administrator account
3. Configure your database (SQLite is fine for small installations, PostgreSQL/MySQL recommended for larger deployments)
4. Start uploading and syncing your files!

### Security Considerations
- This Nextcloud instance uses HTTPS by default with a self-signed certificate
- For production use, configure proper SSL certificates via reverse proxy
- Configure trusted domains in Nextcloud settings
- Enable two-factor authentication for all users
- Regular security updates are recommended

### Performance Tips
- Use external database (PostgreSQL/MySQL) for better performance with multiple users
- Configure Redis for file locking and caching
- Consider using object storage for large deployments

## 💾 SOURCE

- **Nextcloud Server**: https://github.com/nextcloud/server
- **LinuxServer.io Image**: https://github.com/linuxserver/docker-nextcloud
- **Official Website**: https://nextcloud.com
- **Documentation**: https://docs.nextcloud.com

## ❤️ PROVIDED WITH LOVE

This app is configured and maintained for Runtipi.io with care by the community.
