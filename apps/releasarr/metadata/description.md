# RELEASARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Makario1337/Releasarr) [<img src="https://img.shields.io/badge/discord-community-blue?logo=discord&color=5865F2">](https://discord.gg/bv98atxBJT) [<img src="https://img.shields.io/github/stars/Makario1337/Releasarr?color=7842f5">](https://github.com/Makario1337/Releasarr)

---

## 📖 SYNOPSIS
Releasarr is a music release monitoring and management tool designed to help you keep track of your favorite artists and their releases. It integrates multiple music platforms and services to provide a unified view of your music collection and new releases.

---

## ✨ MAIN FEATURES
- Monitor artists and manage your music collection
- View detailed release information
- Track external music platform IDs (Deezer, Discogs, Spotify, MusicBrainz)
- Add, edit, and delete artists, releases, and tracks
- Simple and clean user interface
- Integration with SABnzbd and Usenet indexers for automation
- Indexer support via Prowlarr
- Notification system using Apprise
- Multiple metadata sources support
- Audio track tagging support

---

## 🚀 PLANNED FEATURES
- Torrent client support
- Integrated Deemix downloader
- Enhanced settings and customization options
- Optional dark mode
- File management (artist path control, storage handling)

---

## 🌟 ADVANTAGES
- Unified view across multiple music platforms
- Real-time release monitoring
- Seamless integration with *arr ecosystem
- Clean and modern web interface
- Active development community

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [makario1337/releasarr](https://hub.docker.com/r/makario1337/releasarr)
- Multi-architecture support (amd64, arm64)
- Web UI accessible on port 1337

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/releasarr/data/config` | `/config` | Application configuration |
| `/runtipi/app-data/releasarr/data/logs` | `/logs` | Application logs |
| `/runtipi/app-data/releasarr/data/import` | `/app/import` | Import folder for music files |
| `/runtipi/app-data/releasarr/data/library` | `/app/library` | Music library storage |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --------- | ----- | ----------- |
| `RELEASARR_PORT` | `1337` | Web interface port |
| `RELEASARR_WORKERS` | `4` | Number of application workers |

---

## ⚠️ DISCLAIMER
Releasarr does not condone or promote piracy or illegal distribution of copyrighted material. Please use this software responsibly and respect artists' rights.

---

## 📚 USEFUL LINKS
- [GitHub Repository](https://github.com/Makario1337/Releasarr)
- [Discord Server](https://discord.gg/bv98atxBJT)
- [Docker Hub](https://hub.docker.com/r/makario1337/releasarr)
