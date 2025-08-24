# PROWLARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Prowlarr/Prowlarr) [<img src="https://img.shields.io/github/issues/Prowlarr/Prowlarr?color=7842f5">](https://github.com/Prowlarr/Prowlarr/issues)

Indexer manager and proxy for Sonarr, Radarr, Lidarr, and Readarr.

---

## 📖 SYNOPSIS
Prowlarr is an indexer manager/proxy built on the popular *arr .NET/reactjs platform. It integrates with Sonarr, Radarr, Lidarr, and Readarr to provide seamless indexer management and automation.

---

## ✨ MAIN FEATURES
- Integrates with Sonarr, Radarr, Lidarr, Readarr
- Supports Usenet and Torrent indexers
- Easy indexer management and automation
- Modern web UI

---

## 🌟 ADVANTAGES
- Centralized indexer management
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Read-only filesystem** prevents write access to the image itself
- **No privilege escalation** with `no-new-privileges=true` security option
- **Minimal image size** for fast deployment and low resource usage
- **Based on [11notes/prowlarr](https://github.com/11notes/docker-prowlarr)** - secure distroless image
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Auto update feature: the latest version is automatically built and published
- Special thanks to [11notes](https://github.com/11notes) for their secure Docker image and their work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/prowlarr/data` | `/prowlarr/etc` | Configuration and database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | prowlarr | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |
| `home` | /prowlarr | Home directory of user docker |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `DEBUG` |  | Will activate debug option for container image and app (if available) |

---

## ⚠️ IMPORTANT
- For best experience, use with Sonarr, Radarr, Lidarr, or Readarr.

---

## 💾 SOURCE
* [Prowlarr/Prowlarr](https://github.com/Prowlarr/Prowlarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
