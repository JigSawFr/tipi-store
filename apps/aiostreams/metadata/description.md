# 🎬 AIOStreams

[![GitHub](https://img.shields.io/badge/GitHub-Viren070%2FAIOStreams-blue?logo=github)](https://github.com/Viren070/AIOStreams)
[![Docker](https://img.shields.io/badge/Docker-ghcr.io%2Fviren070%2Faiostreams-blue?logo=docker)](https://github.com/Viren070/AIOStreams/pkgs/container/aiostreams)
[![Discord](https://img.shields.io/badge/Discord-Join-5865F2?logo=discord)](https://discord.viren070.me/)

**One addon to rule them all.** AIOStreams consolidates multiple Stremio addons and debrid services into a single, highly customisable super-addon.

---

## 📝 SYNOPSIS

AIOStreams acts as a central hub for your Stremio experience. It fetches results from all your favorite sources, then filters, sorts, and formats them according to your rules before presenting them in a single, clean list. Whether you're a casual user or a power user who wants fine-grained control, AIOStreams has you covered.

---

## ✨ FEATURES

### 🔌 All Your Addons, One Interface
- **Unified Results**: Aggregate streams from multiple addons into one consistently sorted list
- **Built-in Addon Marketplace**: Enable addons and automatically apply debrid keys
- **Automatic Updates**: Get latest updates without reconfiguring
- **Custom Addon Support**: Add any Stremio addon by URL

### 🧩 Built-in Addons (10+)
- **Stremio GDrive**: Connect Google Drive to Stremio
- **TorBox Search**: Enhanced TorBox addon with more features
- **Knaben**: Scrapes The Pirate Bay, 1337x, Nyaa.si
- **Zilean**: DMM hashlist scraper
- **AnimeTosho**: Anime from Nyaa.si and TokyoTosho
- **Torrent Galaxy**: Torrent Galaxy search
- **Bitmagnet**: Self-hosted BitTorrent indexer
- **Jackett/Prowlarr**: Connect your indexer instances
- **NZBHydra/Newznab/Torznab**: Usenet support

### 🔬 Advanced Filtering & Sorting
- **Granular Filtering**: Resolution, quality, HDR, Atmos, language, seeders
- **Preferred Lists**: Prioritize specific properties
- **Keyword & Regex Filtering**: Match against filenames, indexers, release groups
- **Condition Engine**: Create dynamic rules with expressions
- **Sophisticated Sorting**: Custom sort order per content type

### 🗂️ Catalog Management
- Rename, reorder, disable, and shuffle catalogs
- Enhanced posters from RPDB

### 🎨 Customization
- **Custom Stream Formatting**: Design exactly how streams appear
- **Live Preview**: See changes in real-time
- **Predefined Formats**: Get started quickly

### 🛡️ Proxy Integration
- Seamlessly proxy streams through MediaFlow or StremThru
- Bypass IP restrictions

---

## ⚙️ ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `SECRET_KEY` | 64-char hex encryption key (REQUIRED) | - |
| `ADDON_PASSWORD` | Password protection for addon | - |
| `DATABASE_URI` | SQLite or PostgreSQL connection | `sqlite://./data/db.sqlite` |
| `TMDB_ACCESS_TOKEN` | For title matching filter | - |

---

## 🚀 GETTING STARTED

1. Access the web interface at your configured domain
2. Navigate to `/stremio/configure` to set up your addon
3. Enable addons, add debrid API keys, configure filters
4. Click "Install" to add to Stremio

---

## 📚 DOCUMENTATION

- [Deployment Guide](https://github.com/Viren070/AIOStreams/wiki/Deployment)
- [Configuration Guide](https://github.com/Viren070/AIOStreams/wiki/Configuration)
- [Custom Formatter Wiki](https://github.com/Viren070/AIOStreams/wiki/Custom-Formatter)

---

## ⚠️ DISCLAIMER

AIOStreams aggregates data from other Stremio addons. It does not host, store, or distribute content. Users are responsible for complying with applicable laws.
