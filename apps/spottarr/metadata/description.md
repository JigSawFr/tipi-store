# SPOTTARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Spottarr/Spottarr) [<img src="https://img.shields.io/github/stars/Spottarr/Spottarr?color=7842f5">](https://github.com/Spottarr/Spottarr) [<img src="https://img.shields.io/github/v/release/Spottarr/Spottarr?color=green">](https://github.com/Spottarr/Spottarr/releases)

---

## 📖 SYNOPSIS
Spottarr is a modern spotnet client and indexer for your *arr apps. Spotnet is a protocol on top of Usenet that provides a decentralized alternative to indexing websites. Spottarr indexes spotnet messages (spots) and exposes them as a newznab indexer, making it very easy to search spots directly from Radarr, Sonarr, Readarr, Lidarr, Prowlarr and other newznab compatible tools.

---

## ✨ MAIN FEATURES
- 🔍 **Newznab Indexer** - Exposes spots as a standard newznab indexer
- 🔗 **\*Arr Integration** - Works seamlessly with Radarr, Sonarr, Lidarr, Readarr, Prowlarr
- 📦 **Decentralized** - Uses the spotnet protocol on Usenet (no central indexer needed)
- 🗄️ **SQLite or Postgres** - Built-in SQLite or bring your own PostgreSQL database
- ⚡ **Efficient Indexing** - Modern .NET application optimized for performance
- 🔒 **TLS Support** - Secure connection to your Usenet provider
- 📅 **Configurable Retention** - Control how long spots are kept
- 🚫 **Adult Content Filter** - Optional filtering of adult content

---

## 🌟 ADVANTAGES
- No API key required for searches
- Decentralized indexing via spotnet protocol
- Modern and efficient codebase
- Low memory footprint (200MB limit by default)
- Active development with regular updates
- Easy integration with existing *arr setup

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [ghcr.io/spottarr/spottarr](https://github.com/Spottarr/Spottarr/pkgs/container/spottarr)
- Multi-architecture support (amd64, arm64)
- Runs as non-privileged user (configurable UID/GID)
- Web interface accessible on port 8383

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/spottarr/data` | `/data` | SQLite database and application data |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --------- | ----- | ----------- |
| `SPOTTARR_USENET_HOSTNAME` | Required | Your Usenet server hostname |
| `SPOTTARR_USENET_USERNAME` | Required | Your Usenet account username |
| `SPOTTARR_USENET_PASSWORD` | Required | Your Usenet account password |
| `SPOTTARR_USENET_PORT` | `563` | Usenet server port (563 for TLS) |
| `SPOTTARR_USENET_USETLS` | `true` | Enable TLS/SSL connection |
| `SPOTTARR_USENET_MAXCONNECTIONS` | `10` | Maximum Usenet connections |
| `SPOTTARR_SPOTNET_RETRIEVEAFTER` | `2024-01-01T00:00:00Z` | Start indexing from this date |
| `SPOTTARR_SPOTNET_RETENTIONDAYS` | `365` | Days to retain spots (0 = unlimited) |
| `SPOTTARR_SPOTNET_IMPORTBATCHSIZE` | `10000` | Spots per import batch |
| `SPOTTARR_SPOTNET_IMPORTADULTCONTENT` | `false` | Index adult content |

---

## 🔧 INTEGRATING WITH *ARR APPS
1. In your *Arr app, add a new indexer and search for **Generic Newznab**
2. In the URL field, enter your Spottarr URL (e.g., `http://spottarr:8383`)
3. No API key is required
4. Spottarr will now be used for searches

---

## ⚠️ IMPORTANT NOTES
- Make sure to properly escape special characters like `$` in your password
- Adjust `SPOTTARR_SPOTNET_IMPORTBATCHSIZE` based on available memory
- The default memory limit is 200MB, adjust if needed

---

## 📚 USEFUL LINKS
- [GitHub Repository](https://github.com/Spottarr/Spottarr)
- [Spotnet Wiki](https://github.com/spotnet/spotnet/wiki)
- [Docker Hub](https://hub.docker.com/r/spottarr/spottarr)
