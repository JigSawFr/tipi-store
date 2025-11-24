# STREMIO SERVER

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Stremio/server-docker) [<img src="https://img.shields.io/github/issues/Stremio/server-docker?color=7842f5">](https://github.com/Stremio/server-docker/issues)

The Stremio streaming server enables you to stream movies, TV shows, web channels, sports, and more across all your Stremio clients.

---

## 📖 SYNOPSIS
Stremio Server is the backend streaming component that powers Stremio clients. It handles media streaming, addon management, and provides a unified interface for accessing diverse content sources through its addon system.

---

## ✨ MAIN FEATURES
- Stream movies, TV shows, web channels, and sports
- Support for various streaming protocols
- Addon system for extensibility
- Hardware transcoding with FFmpeg (Jellyfin)
- HTTP and HTTPS endpoints

---

## 🌟 ADVANTAGES
- Open source and actively maintained
- Cross-platform support (Linux, Windows, macOS)
- Flexible addon ecosystem
- Low resource usage

---

## 🐳 DOCKER IMAGE DETAILS
- **Official Stremio Server Docker image**
- **Runs with Node.js 14**
- **Based on [stremio/server](https://hub.docker.com/r/stremio/server)**
- Includes Jellyfin FFmpeg 4.4.1 for media transcoding
- Minimal image size for fast deployment
- Secure and regularly updated

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/stremio-server/data` | `/root/.stremio-server` | Server settings, certificates, and cache |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `HTTP Port` | 11470 | HTTP endpoint |
| `HTTPS Port` | 12470 | HTTPS endpoint |

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `NO_CORS` | Disable CORS checks (set to 1 if running stremio-web locally) | |
| `FFMPEG_BIN` | Full path to the ffmpeg binary | Auto-detected |
| `FFPROBE_BIN` | Full path to the ffprobe binary | Auto-detected |
| `APP_PATH` | Custom application path for storing server settings | `/root/.stremio-server` |
| `CASTING_DISABLED` | Disable network device discovery (recommended for Docker) | `1` |

# SOURCE 💾
* [Stremio/server-docker](https://github.com/Stremio/server-docker)
* [Stremio Official Website](https://www.stremio.com)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
