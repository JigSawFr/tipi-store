# PORTALL

[![GitHub Stars](https://img.shields.io/github/stars/need4swede/Portall?style=flat-square&logo=github)](https://github.com/need4swede/Portall/stargazers)
[![License](https://img.shields.io/github/license/need4swede/Portall?style=flat-square)](https://github.com/need4swede/Portall/blob/main/LICENSE)
[![Version](https://img.shields.io/badge/version-2.0.4-blue.svg)](https://github.com/need4swede/Portall/releases/tag/v2.0.4)

Portall provides an intuitive web interface for generating, tracking, and organizing ports and services across multiple hosts. With Docker integration, port scanning, and a robust tagging system, it's the perfect solution for managing your network infrastructure.

---

## 📖 SYNOPSIS

Portall is a comprehensive port management system that helps you organize and track port assignments across multiple hosts. Whether you're managing Docker containers, planning network services, or organizing your homelab, Portall provides the tools you need to keep everything organized and conflict-free.

## ✨ MAIN FEATURES

- **🚢 Port Management**: Add, remove, and assign ports to different hosts with over 360 pre-defined services
- **🔢 Port Generation**: Quickly generate unique port numbers for your applications
- **🏷️ Tagging System**: Create custom tagging rules with built-in templates for service organization
- **🐳 Docker Integration**: Query ports directly from Docker with support for Portainer and Komodo
- **🔍 Port Scanning**: Setup automatic port scanning across various hosts
- **📥 Import/Export**: Import Caddyfile and docker-compose configurations, export JSON backups
- **🎨 Drag & Drop UI**: Block-level design with intuitive drag and drop organization
- **🌙 Multiple Themes**: Built-in light and dark modes with custom CSS support
- **📱 Mobile Responsive**: Fully responsive design for management on any device

## 🌟 ADVANTAGES

- **Multi-Host Support**: Manage ports across multiple servers and networks from one interface
- **Conflict Detection**: Automatic port conflict detection and resolution system
- **Service Templates**: Over 360 pre-defined service templates with default ports
- **Secure Docker Integration**: Read-only Docker API access with socket proxy architecture
- **Network Discovery**: Built-in port scanning capabilities for network exploration
- **Data Portability**: Complete JSON export/import system for backup and migration
- **Customizable Interface**: Custom CSS support for personalized styling
- **Professional UI**: Modern, intuitive interface designed for efficiency

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `need4swede/portall:2.0.4`
- **Base**: Python 3.11 Slim
- **Architecture**: Multi-arch support (AMD64, ARM64)
- **User**: Runs as non-root user with configurable UID/GID
- **Security**: Hardened container with minimal privileges
- **Dependencies**: Includes netcat and nmap for port scanning functionality
- **Socket Proxy**: Uses `11notes/socket-proxy:stable` for secure Docker API access

## 📁 VOLUMES

- **Application Data**: `${APP_DATA_DIR}/data` → `/app/instance` (SQLite database and application data)

## 🗃️ DEFAULT PARAMETERS

- **Port**: 8080 (configurable via Runtipi)
- **Database**: SQLite (automatically created)
- **Docker Integration**: Enabled by default
- **Secret Key**: Auto-generated secure random key
- **User/Group**: 1000:1000 (configurable)
- **Health Check**: Automatic health monitoring every 30s with curl test

## 📝 ENVIRONMENT

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `PORTALL_SECRET_KEY` | Flask secret key for session security | Auto-generated | Yes |
| `PORTALL_DOCKER_ENABLED` | Enable Docker API integration features | `true` | No |
| `PORTALL_HOST_IP` | IP address of your host for port scanning | Auto-detected | No |
| `USER_ID` | User ID for file permissions | `1000` | No |
| `GROUP_ID` | Group ID for file permissions | `1000` | No |
| `TZ` | Timezone for application logs | System timezone | No |

**Note**: The secret key is automatically generated using a secure random hex string for maximum security. User and group IDs are configurable for optimal file permission compatibility with your host system.

## ⚠️ IMPORTANT

- **First Launch**: The application will create its SQLite database automatically on first run
- **Data Persistence**: Ensure the data volume is properly mounted to preserve your port configurations
- **Docker Integration**: Docker functionality uses a secure socket proxy (`11notes/socket-proxy`) for safe API access
- **Socket Proxy**: Automatic deployment with read-only Docker socket access and minimal permissions
- **Port Scanning**: Network scanning features may require additional network permissions
- **Health Monitoring**: Automatic health checks ensure service availability with 30-second intervals
- **Backup**: Use the built-in export feature to backup your port configurations as JSON
- **Security**: The application runs as a non-root user with minimal privileges for enhanced security
- **Performance**: SQLite database provides fast performance for most use cases
- **Network Access**: The application can scan and discover ports on your network when Docker integration is enabled

## 💾 SOURCE

- **GitHub Repository**: https://github.com/need4swede/Portall
- **Docker Image**: https://hub.docker.com/r/need4swede/portall
- **Documentation**: Available in the GitHub repository
- **License**: MIT License

## ❤️ PROVIDED WITH LOVE

This application is provided by need4swede and the open-source community. Portall offers a modern, intuitive solution for port management that scales from personal homelabs to complex multi-host environments.
