# Mazanoke

[![GitHub Stars](https://img.shields.io/github/stars/civilblur/mazanoke?style=for-the-badge&logo=github&color=yellow)](https://github.com/civilblur/mazanoke/stargazers)
[![GitHub Release](https://img.shields.io/github/v/release/civilblur/mazanoke?style=for-the-badge&logo=github&color=blue)](https://github.com/civilblur/mazanoke/releases/latest)
[![Docker Pulls](https://img.shields.io/docker/pulls/civilblur/mazanoke?style=for-the-badge&logo=docker&color=blue)](https://hub.docker.com/r/civilblur/mazanoke)
[![GitHub License](https://img.shields.io/github/license/civilblur/mazanoke?style=for-the-badge&color=green)](https://github.com/civilblur/mazanoke/blob/main/LICENSE)

A self-hosted local image optimizer that runs in your browser, works offline, and keeps your images private without ever leaving your device.

---

## 📖 SYNOPSIS

Mazanoke is a simple image optimizer designed for everyday people and created to be shared with family and friends. It serves as an alternative to questionable "free" online tools by providing complete privacy and offline functionality.

## ✨ MAIN FEATURES

- **🖼️ Comprehensive Image Optimization**
  - Adjust image quality and compression
  - Set target file size constraints
  - Set maximum width/height dimensions
  - Paste images directly from clipboard
  
- **🔄 Format Conversion Support**
  - **Convert to**: JPG, PNG, WebP, ICO
  - **Convert from**: HEIC, AVIF, TIFF, GIF, SVG
  
- **🔒 Privacy-Focused Design**
  - Works completely offline
  - On-device image processing only
  - Automatically removes EXIF data (location, date, etc.)
  - No tracking or data collection
  - Installable as Progressive Web App (PWA)

## 🌟 ADVANTAGES

- **Complete Privacy**: Images never leave your device - processing happens entirely in your browser
- **Offline Capability**: Works without internet connection once loaded
- **No Installation Required**: Runs directly in any modern web browser
- **Multiple Format Support**: Handles most common image formats including modern ones like HEIC and AVIF
- **User-Friendly**: Simple, intuitive interface designed for non-technical users
- **Self-Hosted**: Full control over your image optimization tool
- **Open Source**: Transparent, auditable code under GPL-3.0 license

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `ghcr.io/civilblur/mazanoke:1.1.5`
- **Base**: Lightweight web server container
- **Architecture**: Multi-arch support (amd64, arm64)
- **Port**: 80 (internal), 3474 (default external)
- **Size**: Optimized for minimal footprint

## 📁 VOLUMES

Mazanoke is a stateless application that runs entirely in the browser. No persistent volumes are required as:
- All processing happens client-side in the browser
- No user data is stored on the server
- Configuration is handled through environment variables

## 🗃️ DEFAULT PARAMETERS

- **Default Port**: 3474
- **Authentication**: Optional (disabled by default)
- **Processing**: Client-side only
- **Storage**: No persistent storage required

## 📝 ENVIRONMENT

### Authentication Configuration

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `MAZANOKE_USERNAME` | Username for basic authentication | No | (empty) |
| `MAZANOKE_PASSWORD` | Password for basic authentication | No | (empty) |

**Note**: Both username and password must be provided to enable basic authentication. If either is missing, authentication will be disabled.

### Usage Examples

```bash
# No authentication (default)
docker run -p 3474:80 ghcr.io/civilblur/mazanoke:1.1.5

# With basic authentication
docker run -p 3474:80 \
  -e USERNAME=admin \
  -e PASSWORD=secure_password \
  ghcr.io/civilblur/mazanoke:1.1.5
```

## ⚠️ IMPORTANT

- **Browser Compatibility**: Requires a modern web browser with JavaScript enabled
- **Security**: When using authentication, ensure strong passwords as it uses basic HTTP auth
- **Privacy**: Despite running in browser, always verify your network setup for maximum privacy
- **Cache Management**: After updates, use Ctrl/Cmd + Shift + R to clear browser cache
- **Mobile Usage**: Cache clearing on mobile requires browser settings access

## 💾 SOURCE

- **GitHub Repository**: [https://github.com/civilblur/mazanoke](https://github.com/civilblur/mazanoke)
- **Official Website**: [https://mazanoke.com](https://mazanoke.com)
- **Documentation**: [GitHub Wiki](https://github.com/civilblur/mazanoke/blob/main/docs/)
- **Docker Image**: [GitHub Container Registry](https://github.com/civilblur/mazanoke/pkgs/container/mazanoke)

## ❤️ PROVIDED WITH LOVE

Mazanoke is developed by civilblur and the open-source community. Special thanks to all contributors who help make this tool better for everyone seeking private, secure image optimization.
