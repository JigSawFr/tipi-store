# POCKET ID

![Docker Image Size](https://img.shields.io/docker/image-size/11notes/pocket-id/1.5.0?color=0eb305)
![Version](https://img.shields.io/badge/version-1.5.0-blue)
![GitHub Stars](https://img.shields.io/github/stars/pocket-id/pocket-id?style=social)

A simple OIDC provider that allows users to authenticate with their passkeys to your services.

---

## 📖 SYNOPSIS

Pocket ID is a simple and easy-to-use OpenID Connect (OIDC) provider designed specifically for passkey authentication. It eliminates the need for traditional passwords by supporting only WebAuthn/FIDO2 passkeys, providing a modern and secure authentication solution for your self-hosted services.

## ✨ MAIN FEATURES

- **Passkey-Only Authentication**: No passwords needed - uses WebAuthn/FIDO2 standards
- **OIDC Provider**: Full OpenID Connect compliance for integration with any OIDC client
- **Simple Setup**: Easy configuration with minimal dependencies
- **Hardware Security Keys**: Support for physical security keys (YubiKey, etc.)
- **Cross-Platform**: Works with built-in passkeys on phones, laptops, and dedicated hardware
- **Lightweight**: Minimal resource usage with optimized Docker image
- **Self-Hosted**: Complete control over your authentication infrastructure

## 🌟 ADVANTAGES

- **Enhanced Security**: Passkeys are phishing-resistant and eliminate password-related vulnerabilities
- **Better User Experience**: No need to remember or type passwords
- **Future-Proof**: Based on modern web standards (WebAuthn, FIDO2)
- **Zero Trust**: No passwords to store, breach, or compromise
- **Universal Compatibility**: Works with any OIDC-compatible application
- **Quick Setup**: Ready to use with minimal configuration
- **Reliable Database**: Integrated PostgreSQL with automatic daily backups

## 🐳 DOCKER IMAGE DETAILS

- **Base Image**: Distroless (scratch-based) for maximum security
- **Architecture**: Multi-arch support (amd64, arm64)
- **User**: Runs as non-root user (UID: 1000, GID: 1000)
- **Registry**: Docker Hub (11notes/pocket-id)
- **Version**: 1.5.0
- **Security**: Distroless image running as hardcoded UID/GID 1000:1000
- **Security**: Regularly scanned for vulnerabilities

## 📁 VOLUMES

- `${APP_DATA_DIR}/data/pocket-id` → `/pocket-id/var`: Pocket ID application data
- `${APP_DATA_DIR}/data/postgres/etc` → `/postgres/etc`: PostgreSQL configuration
- `${APP_DATA_DIR}/data/postgres/var` → `/postgres/var`: PostgreSQL database files
- `${APP_DATA_DIR}/data/postgres/backup` → `/postgres/backup`: Database backups (daily at 3:00 AM)

## 🗃️ DEFAULT PARAMETERS

| Parameter | Default | Description |
|-----------|---------|-------------|
| Port | 1411 | Internal application port |
| UID/GID | 1000/1000 | Hardcoded non-root user privileges (not configurable) |
| Trust Proxy | true | Recommended when running behind reverse proxy |

## 📝 ENVIRONMENT

| Variable | Type | Required | Description |
|----------|------|----------|-------------|
| `POCKET_ID_APP_URL` | URL | No | Full URL where Pocket ID will be accessible (auto-detected) |
| `POCKET_ID_TRUST_PROXY` | Boolean | No | Enable when running behind reverse proxy |
| `POCKET_ID_DB_PASSWORD` | Random (hex) | Yes | Auto-generated secure password for PostgreSQL |
| `POCKET_ID_MAXMIND_LICENSE_KEY` | String | No | MaxMind GeoLite2 license for geographical analysis |

## ⚠️ IMPORTANT

- **Reverse Proxy Required**: Always use HTTPS in production with a reverse proxy
- **Domain Configuration**: Ensure `POCKET_ID_APP_URL` matches your actual domain
- **Passkey Registration**: First user must register their passkey during initial setup
- **Browser Support**: Modern browsers required for WebAuthn support
- **Backup Strategy**: Regularly backup the data volume to prevent user lockout

## 💾 SOURCE

- **Project Repository**: [pocket-id/pocket-id](https://github.com/pocket-id/pocket-id)
- **Docker Image**: [11notes/pocket-id](https://github.com/11notes/docker-pocket-id)
- **Documentation**: [pocket-id.org](https://pocket-id.org/)

## ❤️ PROVIDED WITH LOVE

Provided by the Tipi Community
