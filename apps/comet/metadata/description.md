# ☄️ Comet

[![GitHub](https://img.shields.io/badge/GitHub-g0ldyy%2Fcomet-blue?logo=github)](https://github.com/g0ldyy/comet)
[![Docker](https://img.shields.io/badge/Docker-ghcr.io%2Fg0ldyy%2Fcomet-blue?logo=docker)](https://ghcr.io/g0ldyy/comet)

Stremio's fastest torrent/debrid search add-on with proxy streaming support for multi-IP debrid usage.

---

## 📖 SYNOPSIS

**Comet** is a high-performance Stremio addon designed to be the fastest torrent and debrid search solution available. It allows you to proxy debrid streams, enabling the use of your debrid service from multiple IPs simultaneously on the same account without risking bans.

---

## ✨ FEATURES

- **🚀 Proxy Debrid Streams** - Use your debrid service from multiple IPs at the same time
- **🔒 IP-Based Connection Limits** - Control maximum connections per IP
- **📊 Admin Dashboard** - Bandwidth manager, metrics, and monitoring
- **🔍 Multiple Scrapers** - Jackett, Prowlarr, Torrentio, Zilean, MediaFusion, Debridio, StremThru, AIOStreams, TorBox, Nyaa, BitMagnet, and more
- **💾 Caching System** - SQLite or PostgreSQL for optimal performance
- **⚡ Background Scraper** - Automatic content pre-caching
- **🧠 Smart Torrent Ranking** - Powered by RTN (Rank Torrent Name)
- **🌐 Proxy Support** - Bypass debrid restrictions
- **🎌 Kitsu Support** - Anime metadata integration
- **🔞 Adult Content Filter** - Optional content filtering
- **🌍 CometNet P2P** - Decentralized torrent metadata sharing network

### Supported Debrid Services

- Real-Debrid
- All-Debrid
- Premiumize
- TorBox
- Debrid-Link
- Debrider
- EasyDebrid
- OffCloud
- PikPak
- Direct Torrent

---

## 🔧 ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `COMET_ADDON_NAME` | Custom addon name in Stremio | `Comet` |
| `COMET_ADMIN_DASHBOARD_PASSWORD` | Admin dashboard access password | Random |
| `COMET_PROXY_DEBRID_STREAM` | Enable multi-IP debrid proxying | `false` |
| `COMET_PROXY_DEBRID_STREAM_PASSWORD` | Password for proxy streaming | Random |
| `COMET_SCRAPE_TORRENTIO` | Enable Torrentio scraper | `true` |
| `COMET_SCRAPE_ZILEAN` | Enable Zilean scraper | `false` |
| `COMET_SCRAPE_PROWLARR` | Enable Prowlarr integration | `false` |
| `COMET_REMOVE_ADULT_CONTENT` | Filter adult content | `false` |
| `COMET_COMETNET_ENABLED` | Enable CometNet P2P network | `false` |
| `COMET_COMETNET_ADVERTISE_URL` | Public WebSocket URL for CometNet | Empty |
| `COMET_COMETNET_CONTRIBUTION_MODE` | Sharing mode (full/consumer/source/leech) | `full` |

---

## 🚀 QUICK START

1. **Install Comet** from the Tipi App Store
2. **Access the Web UI** at `http://your-server:8000`
3. **Configure your debrid service** (Real-Debrid, TorBox, etc.)
4. **Copy the manifest URL** to Stremio
5. **Enjoy fast streaming!**

### Admin Dashboard

Access the admin dashboard at `http://your-server:8000/admin` using the configured password.

---

## 📋 NOTES

- **PostgreSQL** is included for optimal performance with concurrent requests
- **Background scraper** requires PostgreSQL and is recommended for better content coverage
- **Proxy debrid streaming** allows multiple devices/IPs to use the same debrid account
- **CometNet P2P** enables decentralized torrent metadata sharing between Comet instances (port 8765)
- **Workers** fixed to 1 (CometNet requirement)
- For advanced configuration, refer to the [official documentation](https://github.com/g0ldyy/comet)

---

## 🔗 LINKS

- [GitHub Repository](https://github.com/g0ldyy/comet)
- [Discord Community](https://discord.com/invite/UJEqpT42nb)
- [Environment Variables Reference](https://github.com/g0ldyy/comet/blob/main/.env-sample)
