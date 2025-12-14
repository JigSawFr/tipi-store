# Ygégé

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/UwUDev/ygege) [<img src="https://img.shields.io/github/issues/UwUDev/ygege?color=7842f5">](https://github.com/UwUDev/ygege/issues)

High-performance indexer for YGG Torrent written in Rust.

---

## 📖 SYNOPSIS

Ygégé is a blazing-fast indexer for YGG Torrent, designed for seamless integration with Prowlarr and Jackett. Built in Rust for maximum performance and minimal resource usage, it features automatic Cloudflare bypass without requiring browser drivers or third-party services.

---

## ✨ MAIN FEATURES

- **🚀 High Performance** - Near-instantaneous search with Rust-powered backend
- **🛡️ Auto Cloudflare Bypass** - No manual CAPTCHA solving or browser drivers needed
- **🔄 Auto Domain Resolution** - Automatically finds the current YGG Torrent domain
- **🔑 Session Management** - Transparent reconnection on expired sessions with caching
- **🌐 DNS Bypass** - Circumvents lying DNS servers
- **💾 Low Memory** - Only 14.7MB RAM usage in release mode on Linux
- **🔍 Modular Search** - Search by name, seeders, leechers, comments, publication date, etc.
- **📊 Torrent Details** - Retrieve description, size, seeders, leechers, and more
- **🔗 No External Dependencies** - No browser drivers required
- **📦 Multi-Architecture** - Supports amd64 and arm64

---

## 🔧 PROWLARR INTEGRATION

1. Find your Prowlarr AppData directory (shown on `/system/status` page)
2. Download `ygege.yml` from the [repository](https://github.com/UwUDev/ygege)
3. Copy it to `{prowlarr-appdata}/Definitions/Custom/` (create `Custom` folder if needed)
4. Restart Prowlarr
5. Add Ygégé as indexer with URL: `http://ygege:8715/`

---

## 🔧 JACKETT INTEGRATION

1. Locate your Jackett AppData directory
2. Download `ygege.yml` from the repository
3. Copy it to `{jackett-appdata}/cardigann/definitions/`
4. Restart Jackett
5. Configure the indexer in Jackett settings

---

## 📝 ENVIRONMENT

| Variable | Required | Description |
| --- | --- | --- |
| `YGEGE_USERNAME` | Yes | Your YGG Torrent username |
| `YGEGE_PASSWORD` | Yes | Your YGG Torrent password |
| `YGEGE_LOG_LEVEL` | No | Log level: trace, debug, info, warn, error (default: info) |

---

## 📁 VOLUMES

| Host folder | Container folder | Comment |
| --- | --- | --- |
| `${APP_DATA_DIR}/data/config` | `/config` | Session cache and configuration |

---

## ⚠️ IMPORTANT

- **Valid YGG account required** - You need an active YGG Torrent account
- **No GUI** - This is an API-only service for Prowlarr/Jackett integration
- **Health endpoint** - Check status at `http://ygege:8715/health`
- The service automatically handles Cloudflare challenges without user intervention

---

## 🔒 HOW CLOUDFLARE BYPASS WORKS

Ygégé uses the [wreq](https://crates.io/crates/wreq) library to perfectly replicate TLS and HTTP/2 handshakes, simulating a real browser. Combined with the `account_created=true` cookie that YGG Torrent uses to whitelist logged-in users, this allows seamless access without triggering Cloudflare challenges.

---

## 💾 SOURCE

* [UwUDev/ygege](https://github.com/UwUDev/ygege)
* [Documentation](https://ygege.lila.ws/)
* [Docker Hub](https://hub.docker.com/r/uwucode/ygege)

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the [official GitHub repository](https://github.com/UwUDev/ygege/issues).
