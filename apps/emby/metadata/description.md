# EMBY

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/linuxserver/docker-emby) [<img src="https://img.shields.io/github/issues/linuxserver/docker-emby?color=7842f5">](https://github.com/linuxserver/docker-emby/issues)

Personal media server to organize and stream your movies, TV shows, music, and photos.

---

## 📖 SYNOPSIS
Emby is a comprehensive media server that brings together your personal media collection and streams it to all your devices. It automatically organizes your content with rich metadata, artwork, and provides a beautiful streaming experience across platforms.

---

## ✨ MAIN FEATURES
- Organize and stream movies, TV shows, music, and photos
- Automatic metadata fetching and library organization
- Hardware-accelerated transcoding support
- Live TV and DVR capabilities
- Multi-user support with parental controls
- Mobile and TV apps for all platforms
- Remote access and sharing

---

## 🚀 HARDWARE TRANSCODING

This Emby installation supports hardware-accelerated transcoding for better performance and lower CPU usage:

### Intel Quick Sync Video (QSV)
- **Requirements**: Intel CPU with integrated graphics (6th gen or newer recommended)
- **Configuration**: Select "Intel Quick Sync (QSV)" in hardware transcoding settings
- **Device Path**: Usually `/dev/dri/renderD128` (auto-detected if left empty)

### AMD/Intel VA-API
- **Requirements**: AMD GPU or Intel integrated graphics with VA-API support
- **Configuration**: Select "AMD/Intel VA-API" in hardware transcoding settings  
- **Device Path**: Usually `/dev/dri/renderD128` for Intel, `/dev/dri/renderD129` for AMD

### NVIDIA NVENC
- **Requirements**: NVIDIA GPU (GTX 10 series or newer) with NVIDIA Container Toolkit installed on host
- **Configuration**: 
  1. Select "NVIDIA NVENC" in hardware transcoding settings
  2. Enable "NVIDIA GPU Support" option
  3. Ensure NVIDIA Container Toolkit is installed on your host system
- **Device Path**: Usually `/dev/nvidia0` (auto-detected if left empty)

### Software Transcoding
- **Default**: CPU-only transcoding (no additional hardware required)
- **Configuration**: Leave hardware transcoding set to "Software Only (CPU)"

---

## 🛠️ RUNTIPI USER-CONFIG OVERRIDES

For advanced hardware transcoding configurations, you can create a `user-config.yml` file in your Runtipi directory:

### Intel/AMD GPU Example
```yaml
services:
  emby:
    devices:
      - /dev/dri:/dev/dri
    group_add:
      - "44"  # video group
```

### NVIDIA GPU Example  
```yaml
services:
  emby:
    runtime: nvidia
    environment:
      - NVIDIA_VISIBLE_DEVICES=all
      - NVIDIA_DRIVER_CAPABILITIES=video,compute,utility
```

### Multiple GPU Devices Example
```yaml
services:
  emby:
    devices:
      - /dev/dri/renderD128:/dev/dri/renderD128
      - /dev/dri/renderD129:/dev/dri/renderD129
```

---

## 🌟 ADVANTAGES
- Comprehensive media management solution
- Hardware transcoding support for optimal performance
- Open Source LinuxServer.io image
- Active development and community support
- Rootless security model (runs as 1000:1000)

---

## 🐳 DOCKER IMAGE DETAILS
- **Security**: Runs as user 1000:1000 (rootless)
- **Base Image**: [linuxserver/emby](https://github.com/linuxserver/docker-emby)
- **CI/CD**: Secure, pinned build process immune to upstream attacks
- **Health Check**: Proper health verification for container status
- **Auto Updates**: Latest version automatically built and published
- **Multi-Architecture**: Supports both ARM64 and AMD64

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/emby/data/config` | `/config` | Configuration and database |
| `/runtipi/app-data/store/emby/data/transcode` | `/opt/vc/bin` | Transcoding temporary files |
| `/runtipi/media` | `/data` | Media library |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | [user identifier](https://en.wikipedia.org/wiki/User_identifier) |
| `gid` | 1000 | [group identifier](https://en.wikipedia.org/wiki/Group_identifier) |
| `home` | /config | home directory of user docker |

---

## 🔧 ENVIRONMENT VARIABLES
| Parameter | Value | Default | Description |
| --- | --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | | Timezone for the container |
| `PUID` | User ID | `1000` | User ID for file permissions |
| `PGID` | Group ID | `1000` | Group ID for file permissions |
| `EMBY_HWACCEL_TYPE` | Hardware acceleration type | `""` | qsv, vaapi, nvidia, or empty for software |
| `EMBY_GPU_DEVICE` | GPU device path | | Device path for hardware acceleration |
| `EMBY_NVIDIA_VISIBLE_DEVICES` | NVIDIA GPU support | `false` | Enable NVIDIA GPU support |

---

## 🚨 TROUBLESHOOTING

### Hardware Transcoding Not Working
1. Verify your hardware supports the selected acceleration type
2. Check device permissions: `ls -la /dev/dri/` or `ls -la /dev/nvidia*`
3. For Intel/AMD: Ensure user is in video group (ID 44)
4. For NVIDIA: Install NVIDIA Container Toolkit on host system
5. Check Emby server logs for transcoding errors

### Permission Issues
- Ensure media files are readable by UID/GID 1000
- For hardware transcoding, verify device access permissions

---

## 💾 SOURCE
* [linuxserver/docker-emby](https://github.com/linuxserver/docker-emby)
* [Emby Official Website](https://emby.media/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.