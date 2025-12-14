# CROSSWATCH

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/cenodude/CrossWatch) [<img src="https://img.shields.io/github/stars/cenodude/CrossWatch?color=7842f5">](https://github.com/cenodude/CrossWatch) [<img src="https://img.shields.io/github/v/release/cenodude/CrossWatch?color=green">](https://github.com/cenodude/CrossWatch/releases)

---

## 📖 SYNOPSIS
CrossWatch is a synchronization engine that keeps your Plex, Jellyfin, Emby, SIMKL, Trakt and MDBlist in sync. It runs locally with a clean web UI where you link accounts, define sync pairs, run them manually or on a schedule, and review stats and history. CrossWatch also includes its own tracker to keep your data safe with snapshots.

---

## ✨ MAIN FEATURES
- 🔄 **Sync Watchlists** - One-way or two-way sync between providers
- 📺 **Live Scrobble** - Real-time scrobbling from Plex/Jellyfin/Emby to Trakt and SIMKL
- ⭐ **Sync Ratings** - Keep your ratings synchronized across all platforms
- 📜 **Sync Watch History** - Never lose track of what you've watched
- 📸 **CrossWatch Tracker** - Keep snapshots and backups of your data
- 🗑️ **Auto-Remove from Watchlist** - Clears items after verified finish
- 🔍 **Analyzer** - Find broken or missing matches/IDs
- 📊 **Stats & History** - Visual logs and synchronization history
- 🎬 **Now Playing Card** - Real-time display of current playback
- ⏰ **Scheduling** - From manual runs to detailed time-based pair schedules

---

## 🌟 SUPPORTED SERVICES

### Media Servers
- Plex
- Jellyfin
- Emby

### Trackers
- Trakt
- SIMKL
- MDBlist
- CrossWatch (internal tracker)

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [ghcr.io/cenodude/crosswatch](https://github.com/cenodude/CrossWatch/pkgs/container/crosswatch)
- Multi-architecture support (amd64, arm64)
- Web UI accessible on port 8787

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/crosswatch/data/config` | `/config` | Configuration, state, and statistics |

---

## 🔐 SECURITY WARNING
⚠️ **CrossWatch is NOT meant to be exposed directly to the public internet.** There is no built-in authentication, so treat it as a LAN/VPN-only tool.

- Do NOT port-forward 8787 from your router
- Run CrossWatch on your local network only, or access via VPN (WireGuard, Tailscale, etc.)

---

## 📋 QUICK START
1. Open the web UI at `http://your-server:8787`
2. Connect at least two authentication providers (Plex, Jellyfin, Emby, SIMKL, Trakt)
3. Create one or more Sync Pairs (e.g., Plex → SIMKL or two-way)
4. Click Synchronize to start, or enable scheduling in Settings
5. Track stats, logs, and history from the UI

---

## 📚 USEFUL LINKS
- [GitHub Repository](https://github.com/cenodude/CrossWatch)
- [Wiki & Documentation](https://github.com/cenodude/CrossWatch/wiki)
- [Best Practices](https://github.com/cenodude/CrossWatch/wiki/Best-Practices)
- [Releases](https://github.com/cenodude/CrossWatch/releases)
