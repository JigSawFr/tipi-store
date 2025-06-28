# MAZANOKE

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/civilblur/mazanoke) [<img src="https://img.shields.io/github/issues/civilblur/mazanoke?color=7842f5">](https://github.com/civilblur/mazanoke/issues)

Self-hosted image optimizer that runs in your browser with complete privacy.

---

## 📖 SYNOPSIS
Mazanoke is a simple image optimizer designed for everyday people and created to be shared with family and friends. It serves as an alternative to questionable "free" online tools by providing complete privacy and offline functionality.

---

## ✨ MAIN FEATURES
- Comprehensive image optimization with quality and compression controls
- Format conversion support (JPG, PNG, WebP, ICO, HEIC, AVIF, TIFF, GIF, SVG)
- Privacy-focused design with offline functionality
- On-device processing only - images never leave your device
- Automatic EXIF data removal for privacy
- Progressive Web App (PWA) support

---

## 🌟 ADVANTAGES
- Complete privacy - all processing happens in your browser
- Works completely offline once loaded
- Open Source and transparent code
- Self-hosted with full control

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root** for improved security
- **Minimal image size** for fast deployment and low resource usage
- **Based on [ghcr.io/civilblur/mazanoke](https://github.com/civilblur/mazanoke)**
- Stateless application with client-side processing
- Multi-architecture support (amd64, arm64)

---

## 📁 VOLUMES
Mazanoke is a stateless web application that runs entirely in the browser. No persistent volumes are required as:
- All image processing happens client-side
- No user data is stored on the server
- Configuration is handled through environment variables

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| Port | 3474 | Web interface port |
| Authentication | Disabled | Basic auth (optional) |

---

## 📝 ENVIRONMENT
| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `USERNAME` | Username for basic authentication | No | (empty) |
| `PASSWORD` | Password for basic authentication | No | (empty) |

**Note**: Both username and password must be provided to enable basic authentication.

---

## ⚠️ IMPORTANT
- Requires a modern web browser with JavaScript enabled
- When using authentication, ensure strong passwords as it uses basic HTTP auth
- After updates, clear browser cache with Ctrl/Cmd + Shift + R

---

## 💾 SOURCE
- **GitHub Repository**: [https://github.com/civilblur/mazanoke](https://github.com/civilblur/mazanoke)
- **Docker Image**: [GitHub Container Registry](https://github.com/civilblur/mazanoke/pkgs/container/mazanoke)
