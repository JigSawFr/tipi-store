# FreeboxOS Ultra Dashboard

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/HGHugo/FreeboxOS-Ultra-Dashboard) [<img src="https://img.shields.io/github/issues/HGHugo/FreeboxOS-Ultra-Dashboard?color=7842f5">](https://github.com/HGHugo/FreeboxOS-Ultra-Dashboard/issues)

A modern and comprehensive alternative web interface for managing your Freebox Ultra, Delta & Pop.

---

## 📖 SYNOPSIS

FreeboxOS Ultra Dashboard is a modern web interface built with React 19 and Express 5 for managing your Freebox. It offers a smooth and modern user experience with real-time data monitoring and comprehensive management features.

---

## ⚠️ EXPERIMENTAL

> **Version BETA** - This project is under active development. Bugs may be present and some features may not work as expected. Don't hesitate to [report issues](https://github.com/HGHugo/FreeboxOS-Ultra-Dashboard/issues) you encounter.

---

## 🖥️ COMPATIBILITY

| Model | Support | WiFi 6GHz | VMs |
| --- | --- | --- | --- |
| Freebox Ultra | Full | Yes | Yes |
| Freebox Delta | Full | Yes | No |
| Freebox Pop | Full | No | No |
| Freebox Mini 4K | Testing | No | No |
| Freebox Revolution | Testing | No | No |

---

## ✨ MAIN FEATURES

### Dashboard
- **Real-time bandwidth** - Download/upload speed monitoring with sparkline charts
- **Connection status** - Fiber line status, connection type, latency
- **System information** - CPU temperature, memory usage, uptime
- **Connected devices** - List of devices on local network

### WiFi Management
- **Network management** - Configure 2.4GHz, 5GHz and 6GHz (Ultra only) bands
- **WPS** - Enable/disable WPS with push button
- **MAC filtering** - Whitelist/blacklist management
- **QR Code** - Generate QR codes for quick connection

### VPN
- **Multi-protocol** - Support for OpenVPN (routed/bridge), PPTP, WireGuard
- **Server management** - Start/stop VPN servers
- **Statistics** - Active connection count

### Downloads
- **Complete manager** - Add torrents, direct URLs
- **Real-time progress** - Speed, ETA, status
- **Control** - Pause, resume, delete

### Files
- **Explorer** - Navigate Freebox files
- **Operations** - Copy, move, rename, delete
- **Sharing** - Create share links

### Telephony
- **Call log** - Complete history with filters
- **Contacts** - Directory management
- **Voicemail** - Listen to voice messages

### TV
- **Program guide** - Real-time EPG
- **Channels** - Available channel list
- **Recordings** - Manage scheduled recordings

### Virtual Machines (Ultra/Delta only)
- **VM management** - Start, stop, restart
- **Statistics** - CPU, memory, disk usage
- **Creation** - VM creation wizard

### Parental Controls
- **Profiles** - Create per-user profiles
- **Filters** - Block sites and categories
- **Schedules** - Access time slots

### Analytics
- **Bandwidth history** - Graphs over 1h, 24h, 7d
- **Temperatures** - System temperature evolution
- **Network statistics** - Detailed connection data

---

## 🚀 FIRST CONNECTION

On first launch, you'll need to authorize the application on your Freebox:

1. Access the dashboard
2. Click "Connect" in the interface
3. On your Freebox: A message will appear on the LCD screen
4. Press the right arrow (>) on the Freebox to authorize
5. The application is now connected!

> **Note**: For some features (WPS, VPN, etc.), you may need to enable additional permissions in Freebox OS > Settings > Access Management > Applications.

---

## 📝 ENVIRONMENT

| Variable | Required | Description |
| --- | --- | --- |
| `FREEBOX_HOST` | No | Freebox hostname (default: mafreebox.freebox.fr) |

---

## 📁 VOLUMES

| Host folder | Container folder | Comment |
| --- | --- | --- |
| `${APP_DATA_DIR}/data` | `/app/data` | Token and persistent data storage |

---

## ⚠️ IMPORTANT

- The dashboard must be on the **same local network** as your Freebox
- The authentication token is automatically saved and persists between restarts
- The Docker image runs as a non-root user (`freebox`) for security

---

## 💾 SOURCE

* [HGHugo/FreeboxOS-Ultra-Dashboard](https://github.com/HGHugo/FreeboxOS-Ultra-Dashboard)
* [Freebox SDK Documentation](https://dev.freebox.fr/sdk/os/)

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the [official GitHub repository](https://github.com/HGHugo/FreeboxOS-Ultra-Dashboard/issues).
