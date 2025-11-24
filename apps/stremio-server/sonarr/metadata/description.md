# SONARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Sonarr/Sonarr) [<img src="https://img.shields.io/github/issues/Sonarr/Sonarr?color=7842f5">](https://github.com/Sonarr/Sonarr/issues)

Automatic TV series downloader and manager for Usenet and BitTorrent users.

---

## 📖 SYNOPSIS
Sonarr automates the downloading, sorting, and renaming of TV series from Usenet and BitTorrent. It monitors RSS feeds for new episodes and upgrades existing files when better quality is available.

---

## ✨ MAIN FEATURES
- Monitors multiple RSS feeds for new episodes
- Automatic download, sorting, and renaming
- Quality upgrades for existing files
- Modern web UI

---

## 🌟 ADVANTAGES
- Automated TV series management
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [11notes/sonarr](https://github.com/11notes/docker-sonarr)**
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Works as read-only, most other images need to write files to the image filesystem
- Auto update feature: the latest version is automatically built and published
- Special thanks to [11notes](https://github.com/11notes) for his original Docker image and his work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/sonarr/data` | `/config` | Configuration and database |
| `/runtipi/media` | `/media` | Media library |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | sonarr | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |
| `home` | /sonarr | Home directory of user docker |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `DEBUG` |  | Will activate debug option for container image and app (if available) |

---

## ⚠️ IMPORTANT
- For best experience, use with Prowlarr and Radarr.

---

## 💾 SOURCE
* [Sonarr/Sonarr](https://github.com/Sonarr/Sonarr)
* [11notes/docker-sonarr](https://github.com/11notes/docker-sonarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
