# SOCKET PROXY

[![Docker Hub](https://img.shields.io/docker/pulls/11notes/socket-proxy?style=flat-square&logo=docker)](https://hub.docker.com/r/11notes/socket-proxy)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat-square)](https://github.com/11notes/docker-socket-proxy/blob/main/LICENSE)
[![Version](https://img.shields.io/badge/version-stable-green.svg)](https://hub.docker.com/r/11notes/socket-proxy/tags)

Socket Proxy provides secure, controlled access to the Docker API by exposing only specific endpoints with read-only permissions. Essential for applications requiring Docker integration while maintaining security boundaries.

---

## 📖 SYNOPSIS

Socket Proxy acts as a security layer between applications and the Docker daemon, providing controlled access to specific Docker API endpoints. This prevents applications from having full access to the Docker socket while still enabling Docker integration features like container discovery, image management, and service monitoring.

## ✨ MAIN FEATURES

- **🔒 Selective API Access**: Control which Docker API endpoints are accessible
- **🛡️ Read-Only Security**: Socket mounted with read-only permissions for enhanced security
- **🔌 Network Isolation**: Runs on internal network, not exposed to host
- **⚡ Lightweight**: Minimal resource footprint with Alpine Linux base
- **🔧 Configurable**: Granular control over API endpoint access
- **🐳 Docker Native**: Direct integration with Docker daemon socket
- **📊 Monitoring Ready**: Supports container monitoring and discovery
- **🚀 High Performance**: Low-latency proxy for Docker API calls

## 🌟 ADVANTAGES

- **Enhanced Security**: Prevents direct Docker socket access from applications
- **Granular Permissions**: Enable only required Docker API endpoints
- **Zero Configuration**: Works out of the box with sensible defaults
- **Multi-Application Support**: Single proxy can serve multiple client applications
- **Resource Efficient**: Minimal CPU and memory usage
- **Production Ready**: Battle-tested in production environments
- **Standard Compliance**: Follows Docker API specifications exactly
- **Easy Integration**: Drop-in replacement for direct socket access

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `11notes/socket-proxy:2.1.3`
- **Base**: Distroless (scratch + essential components)
- **Architecture**: Multi-arch support (AMD64, ARM64)
- **User**: Runs proxy as unprivileged user (configurable UID/GID)
- **Security**: 100% distroless with no shell access
- **Updates**: Automatically maintained via secure CI/CD pipeline

## 📁 VOLUMES

- **Docker Socket**: `/var/run/docker.sock` → `/run/docker.sock` (read-only access to Docker daemon)
- **Proxy Volume**: `${APP_DATA_DIR}/proxy` → `/run/proxy` (proxy socket exposure directory)

## 🗃️ DEFAULT PARAMETERS

- **Port**: 2375 (internal Docker API proxy)
- **Network**: Internal only (not exposed to host)
- **Socket Access**: Read-only Docker daemon access
- **API Endpoints**: Containers, Services, Networks, Images enabled by default
- **Security**: Minimal permissions with controlled API exposure

## 📝 ENVIRONMENT

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `SOCKET_PROXY_VOLUME` | Path to the docker volume used to expose the proxy socket | `/run/proxy` | No |
| `SOCKET_PROXY_DOCKER_SOCKET` | Path to the actual docker socket | `/run/docker.sock` | No |
| `SOCKET_PROXY_UID` | The UID used to run the proxy parts | `1000` | No |
| `SOCKET_PROXY_GID` | The GID used to run the proxy parts | `1000` | No |
| `TZ` | Timezone for the container | `UTC` | No |
| `DEBUG` | Enable debug mode for container and application | `false` | No |

**Note**: This socket proxy automatically provides read-only access to the Docker API without requiring explicit endpoint configuration. The proxy runs as an unprivileged user for enhanced security while maintaining full Docker API compatibility.

## ⚠️ IMPORTANT

- **Security Purpose**: This proxy enhances security by providing controlled Docker API access
- **Read-Only Access**: Docker socket is mounted read-only to prevent unauthorized modifications
- **Distroless Security**: Uses distroless base with no shell access for maximum security
- **Network Isolation**: The proxy runs on internal networks only, not exposed externally
- **Client Applications**: Applications connect to `tcp://socket-proxy:2375` instead of direct socket
- **Automatic API**: Provides full Docker API access without explicit endpoint configuration
- **Performance**: Single binary with minimal overhead for Docker API calls
- **Monitoring**: Includes proper health checks for service availability verification
- **User Permissions**: Ensure correct UID/GID mapping for Docker socket access

## 💾 SOURCE

- **GitHub Repository**: https://github.com/11notes/docker-socket-proxy
- **Docker Image**: https://hub.docker.com/r/11notes/socket-proxy
- **Documentation**: Available in the GitHub repository
- **License**: Apache License 2.0

## ❤️ PROVIDED WITH LOVE

This application is maintained by 11notes and provides a secure foundation for Docker API access in containerized environments. Essential for any setup requiring Docker integration with security best practices.
