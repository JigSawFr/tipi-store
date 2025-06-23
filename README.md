![banner](.github/assets/store.png?raw=true)

# JigSaw ⛺ Runtipi.io Custom AppStore

<p align="center">
  <a href="https://github.com/JigSawFr/tipi-store/actions/workflows/lint.yml"><img alt="CI" src="https://img.shields.io/github/actions/workflow/status/JigSawFr/tipi-store/lint.yml?label=Lint%20CI&logo=githubactions&style=for-the-badge&color=4B8DF8"></a>
  <a href="https://github.com/JigSawFr/tipi-store/actions/workflows/test.yml">
    <img alt="Tests" src="https://img.shields.io/github/actions/workflow/status/JigSawFr/tipi-store/test.yml?label=Tests&logo=powershell&style=for-the-badge&color=5391FE">
  </a>
  <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge"></a>
  <a href="https://github.com/JigSawFr/tipi-store/stargazers"><img alt="Stars" src="https://img.shields.io/github/stars/JigSawFr/tipi-store?style=for-the-badge&logo=star&color=FFD700"></a>
  <a href="https://github.com/JigSawFr/tipi-store/pulls"><img alt="Pull Requests" src="https://img.shields.io/github/issues-pr/JigSawFr/tipi-store?style=for-the-badge&logo=gitbook&color=purple"></a>
  <a href="https://discord.com/channels/976934649643294750/1378139625268314205"><img alt="Discord" src="https://img.shields.io/discord/976934649643294750?label=Discord&logo=discord&style=for-the-badge&color=5865F2"></a>
  <a href="https://github.com/JigSawFr/tipi-store"><img alt="Code Size" src="https://img.shields.io/github/languages/code-size/JigSawFr/tipi-store?style=for-the-badge&color=orange"></a>
  <a href="https://github.com/JigSawFr/tipi-store"><img alt="Top Language" src="https://img.shields.io/github/languages/top/JigSawFr/tipi-store?style=for-the-badge&color=blueviolet"></a>
  <a href="https://github.com/JigSawFr/tipi-store/commits"><img alt="Last Commit" src="https://img.shields.io/github/last-commit/JigSawFr/tipi-store?color=blue&style=for-the-badge"></a>
  <a href="https://github.com/JigSawFr/tipi-store/issues"><img alt="Issues" src="https://img.shields.io/github/issues/JigSawFr/tipi-store?color=7842f5&style=for-the-badge"></a>
</p>

---

## 🚀 Table of Contents
- 📦 [Apps Available](#-apps-available-21-)
- ⚠️ [Prerequisites](#-prerequisites)
- ⚡ [Quick Start](#-quick-start)
- ✨ [Features](#-features)
- 🛠️ [Installation](#️-installation)
- ❓ [FAQ](#-faq)
- 🙏 [Acknowledgements](#-acknowledgements)
- 🏗️ [Built With](#-built-with)

---

## 📦 Apps Available (23)

|  | Name & Docs | Description | Docker Image |
|:---:|:---|:---|:---|
| <img src="apps/autobrr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**autobrr**](https://github.com/autobrr/autobrr)<br/><sub>[Description](apps/autobrr/metadata/description.md)</sub> | 🚀 Torrent download automation | [ghcr.io/s0up4200/autobrr-distroless](https://github.com/autobrr/autobrr) |
| <img src="apps/beszel/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Beszel**](https://github.com/henrygd/beszel)<br/><sub>[Description](apps/beszel/metadata/description.md)</sub> | 📊 Server monitoring hub | [henrygd/beszel](https://github.com/henrygd/beszel) |
| <img src="apps/beszel-agent/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Beszel Agent**](https://github.com/henrygd/beszel)<br/><sub>[Description](apps/beszel-agent/metadata/description.md)</sub> | 🔍 Beszel monitoring agent | [henrygd/beszel-agent](https://github.com/henrygd/beszel) |
| <img src="apps/byparr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Byparr**](https://github.com/ThePhaseless/Byparr)<br/><sub>[Description](apps/byparr/metadata/description.md)</sub> | 🦾 Bypass Cloudflare and DDoS-Guard | [ghcr.io/thephaseless/byparr](https://github.com/ThePhaseless/Byparr/pkgs/container/byparr) |
| <img src="apps/configarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Configarr**](https://github.com/raydak-labs/configarr)<br/><sub>[Description](apps/configarr/metadata/description.md)</sub> | ⚙️ Configuration automation for *arr apps | [ghcr.io/raydak-labs/configarr](https://github.com/raydak-labs/configarr/pkgs/container/configarr) |
| <img src="apps/homebox/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**HomeBox**](https://github.com/sysadminsmedia/homebox)<br/><sub>[Description](apps/homebox/metadata/description.md)</sub> | 📦 Home inventory & organization | [ghcr.io/sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox/pkgs/container/homebox) |
| <img src="apps/huntarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Huntarr**](https://github.com/plexguide/Huntarr)<br/><sub>[Description](apps/huntarr/metadata/description.md)</sub> | 🕵️‍♂️ Automated missing & upgrade search | [ghcr.io/plexguide/huntarr](https://github.com/plexguide/Huntarr/pkgs/container/huntarr) |
| <img src="apps/jellyfin/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Jellyfin**](https://github.com/jellyfin/jellyfin)<br/><sub>[Description](apps/jellyfin/metadata/description.md)</sub> | 🎞️ Free Software Media System | [ghcr.io/linuxserver/jellyfin](https://github.com/linuxserver/docker-jellyfin) |
| <img src="apps/kometa/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Kometa**](https://github.com/Kometa-Team/Kometa)<br/><sub>[Description](apps/kometa/metadata/description.md)</sub> | 🎨 Overlays, collections & playlists for Plex | [ghcr.io/linuxserver/kometa](https://github.com/linuxserver/kometa/pkgs/container/kometa) |
| <img src="apps/lubelogger/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**LubeLogger**](https://github.com/hargata/lubelog)<br/><sub>[Description](apps/lubelogger/metadata/description.md)</sub> | 🚗 Track vehicle maintenance & fuel | [ghcr.io/hargata/lubelog](https://github.com/hargata/lubelog/pkgs/container/lubelog) |
| <img src="apps/overseerr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Overseerr**](https://github.com/sct/overseerr)<br/><sub>[Description](apps/overseerr/metadata/description.md)</sub> | 📥 Media requests for Plex | [ghcr.io/linuxserver/overseerr](https://github.com/linuxserver/docker-overseerr) |
| <img src="apps/paperless-ngx/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Paperless-ngx**](https://github.com/paperless-ngx/paperless-ngx)<br/><sub>[Description](apps/paperless-ngx/metadata/description.md)</sub> | 📄 Document management system with OCR | [11notes/paperless-ngx](https://github.com/11notes/docker-paperless-ngx) |
| <img src="apps/paperless-ai/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Paperless-AI**](https://github.com/clusterzx/paperless-ai)<br/><sub>[Description](apps/paperless-ai/metadata/description.md)</sub> | 🤖 AI-powered document analyzer for Paperless-ngx | [clusterzx/paperless-ai](https://github.com/clusterzx/paperless-ai) |
| <img src="apps/plex/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Plex**](https://github.com/linuxserver/docker-plex)<br/><sub>[Description](apps/plex/metadata/description.md)</sub> | 🎞️ Media server for your library | [ghcr.io/linuxserver/plex](https://github.com/linuxserver/docker-plex) |
| <img src="apps/profilarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Profilarr**](https://github.com/Dictionarry-Hub/profilarr)<br/><sub>[Description](apps/profilarr/metadata/description.md)</sub> | 🔧 Configuration management for *arr apps | [santiagosayshey/profilarr](https://hub.docker.com/r/santiagosayshey/profilarr) |
| <img src="apps/prowlarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Prowlarr**](https://github.com/Prowlarr/Prowlarr)<br/><sub>[Description](apps/prowlarr/metadata/description.md)</sub> | 🔎 Indexer manager for *arr apps | [ghcr.io/linuxserver/prowlarr](https://github.com/linuxserver/docker-prowlarr) |
| <img src="apps/radarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Radarr**](https://github.com/Radarr/Radarr)<br/><sub>[Description](apps/radarr/metadata/description.md)</sub> | 🎬 Manage and download movies | [ghcr.io/11notes/radarr](https://github.com/11notes/docker-radarr) |
| <img src="apps/recyclarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Recyclarr**](https://github.com/recyclarr/recyclarr)<br/><sub>[Description](apps/recyclarr/metadata/description.md)</sub> | ♻️ Sync TRaSH guides to *arr apps | [ghcr.io/recyclarr/recyclarr](https://github.com/recyclarr/recyclarr/pkgs/container/recyclarr) |
| <img src="apps/sonarr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Sonarr**](https://github.com/Sonarr/Sonarr)<br/><sub>[Description](apps/sonarr/metadata/description.md)</sub> | 📺 Manage and download TV series | [ghcr.io/11notes/sonarr](https://github.com/11notes/docker-sonarr) |
| <img src="apps/swaparr/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Swaparr**](https://github.com/ThijmenGThN/swaparr)<br/><sub>[Description](apps/swaparr/metadata/description.md)</sub> | 🧹 Stalled download cleanup utility for *arr apps | [ghcr.io/thijmengthn/swaparr](https://github.com/ThijmenGThN/swaparr/pkgs/container/swaparr) |
| <img src="apps/tautulli/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Tautulli**](https://github.com/Tautulli/Tautulli)<br/><sub>[Description](apps/tautulli/metadata/description.md)</sub> | 📊 Plex monitoring & statistics | [lscr.io/linuxserver/tautulli](https://github.com/linuxserver/docker-tautulli) |
| <img src="apps/transmission-vpn/metadata/logo.jpg" width="48" height="48" style="min-width: 32px; min-height: 32px;"> | [**Transmission (VPN)**](https://github.com/haugene/docker-transmission-openvpn)<br/><sub>[Description](apps/transmission-vpn/metadata/description.md)</sub> | 🌐 BitTorrent client with VPN tunnel | [haugene/transmission-openvpn](https://github.com/haugene/docker-transmission-openvpn) |

---

## ⚠️ Prerequisites

This repository is a collection of third-party applications ("apps") designed exclusively for use with [Runtipi.io](https://runtipi.io/).

> **What is Runtipi?**
>
> Runtipi is an open-source platform that lets you easily self-host and manage web applications on your own server, with a beautiful web UI and one-click app installation.

> [!WARNING]
> These apps are only compatible with Runtipi. You must have a working Runtipi instance to use this AppStore. They will not work as standalone Docker containers.

- To get started with Runtipi, see the [official documentation](https://runtipi.io/docs/installation/) or visit the [main GitHub project](https://github.com/meienberger/runtipi).

---

## ⚡ Quick Start

```bash
# Add this AppStore to your Runtipi instance
https://github.com/JigSawFr/tipi-store
```

---

## ✨ Features

- 🛡️ **Rootless by default** (runs as 1000:1000, not root)
- 🔒 **Secure, pinned CI/CD** (no upstream supply chain risk)
- 🩺 **Real healthchecks** (not juste port open)
- 🚀 **Auto-update** (latest version always available)
- 📦 **Lightweight images** (smaller than most alternatives)
- 🧩 **Easy to add new apps** (harmonized structure)
- 📝 **Professional, clear documentation**
- 🤝 **Community & Discord support**

---

## 🛠️ Installation

1. In the Runtipi dashboard, open settings and go to the "App Stores" tab.
2. Click "Add App Store" and fill in the form with a nice name and the URL `https://github.com/JigSawFr/tipi-store`.
3. Submit the form. You can now go to the App Store and select the one you just created from the dropdown.
4. Choose an app and install it. Have fun!

> [!WARNING]
> This appstore is a hobby project. I try to keep apps up to date and working, but I can't guarantee support or permanence for any app.

---

## ❓ FAQ

**Q: Why rootless images?**  
A: For security! Running as 1000:1000 avoids privilege escalation risks.

**Q: How to request a new app?**  
A: You cannot formally request new apps, but you can join the discussion and suggest ideas on the [Discord channel](https://discord.com/channels/976934649643294750/1378139625268314205).

**Q: How are images updated?**  
A: Via automated CI/CD and Renovate.

**Q: Where can I find more about Runtipi?**  
A: See the [official website & documentation](https://runtipi.io/) and the [Runtipi GitHub repository](https://github.com/meienberger/runtipi).

---

## 🙏 Acknowledgements

- Special thanks to all upstream projects and Docker image authors referenced in each app's description.
- Thanks to all contributors and users!

---

## 🏗️ Built With

<p align="left">
  <a href="https://runtipi.io/"><img src="https://img.shields.io/badge/%E2%9B%BA%20runtipi.io-2C2C32?style=for-the-badge" alt="Runtipi" height="28"/></a>
  <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" height="28"/></a>
  <a href="https://github.com/features/actions"><img src="https://img.shields.io/badge/GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions" height="28"/></a>
  <a href="https://learn.microsoft.com/powershell/"><img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell" height="28"/></a>
  <a href="https://www.json.org/"><img src="https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=json&logoColor=white" alt="JSON" height="28"/></a>
  <a href="https://daringfireball.net/projects/markdown/"><img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" alt="Markdown" height="28"/></a>
  <a href="https://github.com/renovatebot/renovate"><img src="https://img.shields.io/badge/Renovate-1A1F6C?style=for-the-badge&logo=renovatebot&logoColor=white" alt="Renovate" height="28"/></a>
</p>

---

For any questions or issues, open an issue on the official GitHub repository.