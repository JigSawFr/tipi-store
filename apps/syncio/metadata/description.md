# SYNCIO

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/iamneur0/syncio) [<img src="https://img.shields.io/badge/discord-community-blue?logo=discord&color=5865F2">](https://discord.gg/88dwGw9P) [<img src="https://img.shields.io/github/stars/iamneur0/syncio?color=7842f5">](https://github.com/iamneur0/syncio)

---

## 📖 SYNOPSIS
Syncio is a comprehensive management system for Stremio addons and users, designed for organizations and individuals who need to manage multiple Stremio accounts efficiently. It provides a unified platform for addon management, user organization, and synchronization across accounts.

---

## ✨ MAIN FEATURES
- 🏢 **Group Management** - Organize users into groups with custom colors and descriptions
- 🔌 **Addon Management** - Install, configure, update, and manage Stremio addons
- 👥 **User Management** - Add users, manage their Stremio accounts, and control access
- 🔄 **Smart Sync** - Keep addons synchronized across all users' Stremio accounts
- 🛡️ **Protected Addons** - Mark critical addons as protected to prevent accidental removal
- 📊 **Resource Filtering** - Select specific resources (movies, series, etc.) from addons
- 🎨 **Modern UI** - Beautiful, responsive interface with multiple themes
- 🔐 **Authentication** - Secure user authentication and account management
- 📤 **Import/Export** - Backup and restore your entire configuration

---

## 🌟 ADVANTAGES
- Unified Stremio addon management across multiple accounts
- Perfect for families, organizations, or power users
- No external database required (SQLite for private instances)
- Modern and responsive web interface
- Active development with regular updates

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [ghcr.io/iamneur0/syncio](https://github.com/iamneur0/syncio/pkgs/container/syncio)
- Multi-architecture support (amd64, arm64)
- Private instance mode (SQLite, no auth required by default)
- Web UI accessible on port 3000, API on port 4000

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/syncio/data` | `/app/data` | Application data and SQLite database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --------- | ----- | ----------- |
| `SYNCIO_JWT_SECRET` | Auto-generated | JWT token signing key |
| `SYNCIO_ENCRYPTION_KEY` | Auto-generated | Data encryption key (32 chars) |
| `SYNCIO_PRIVATE_USERNAME` | Optional | Username for private instance auth |
| `SYNCIO_PRIVATE_PASSWORD` | Optional | Password for private instance auth |

---

## 🔧 INSTANCE TYPES
### Private Instance (Default)
- No authentication required
- Single-account access
- SQLite database
- Perfect for personal use

### Public Instance
- JWT authentication
- Multi-user support
- PostgreSQL database
- Perfect for organizations

---

## 📚 USEFUL LINKS
- [GitHub Repository](https://github.com/iamneur0/syncio)
- [Discord Server](https://discord.gg/88dwGw9P)
- [API Documentation](https://github.com/iamneur0/syncio/blob/main/API.md)
- [Docker Documentation](https://github.com/iamneur0/syncio/blob/main/DOCKER.md)
