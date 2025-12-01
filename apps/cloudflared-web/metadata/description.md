# CLOUDFLARED WEB

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/WisdomSky/Cloudflared-web) [<img src="https://img.shields.io/github/issues/WisdomSky/Cloudflared-web?color=7842f5">](https://github.com/WisdomSky/Cloudflared-web/issues)

Web UI for managing Cloudflare Zero Trust tunnels with ease.

---

## 📖 SYNOPSIS
Cloudflared-web packages both the cloudflared CLI and a simple Web UI to easily start or stop remotely-managed Cloudflare tunnels. It provides an easy run-and-forget setup, allowing you to manage your secure tunnels without touching the command line.

---

## ✨ MAIN FEATURES
- 🎛️ **Simple Web UI** - User-friendly interface to manage tunnels
- ▶️ **One-click control** - Start and stop tunnels instantly
- 🔑 **Token management** - Easily configure cloudflared tokens
- 🔐 **Basic Auth** - Protect the Web UI with authentication
- ⚙️ **Configurable** - Customize protocol, region, retries, and more
- 📊 **Metrics support** - Optional tunnel metrics server

---

## 🌟 ADVANTAGES
- No command line needed
- Lightweight Docker image
- GitHub Container Registry available
- Multi-language support
- Persistent configuration

---

## 🐳 DOCKER IMAGE DETAILS
- **Based on [WisdomSky/Cloudflared-web](https://github.com/WisdomSky/Cloudflared-web)**
- Uses `network_mode: host` for full network access to host services
- Available on Docker Hub and ghcr.io
- Thanks to [WisdomSky](https://github.com/WisdomSky) for the original project

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `${APP_DATA_DIR}/data/config` | `/config` | Token and configuration storage |

---

## 📝 ENVIRONMENT
| Variable | Default | Description |
| --- | --- | --- |
| `CLOUDFLARED_WEBUI_HOST` | 0.0.0.0 | Host address for WebUI |
| `CLOUDFLARED_BASIC_AUTH_USER` | admin | Basic Auth username |
| `CLOUDFLARED_BASIC_AUTH_PASS` | (empty) | Basic Auth password (empty = disabled) |
| `CLOUDFLARED_PROTOCOL` | auto | Connection protocol: auto, http2, quic |
| `CLOUDFLARED_EDGE_IP_VERSION` | auto | IP version: auto, 4, 6 |
| `CLOUDFLARED_REGION` | (empty) | Region (e.g., 'us'). Empty = global |
| `CLOUDFLARED_RETRIES` | 5 | Max connection retries |
| `CLOUDFLARED_GRACE_PERIOD` | 30s | Shutdown grace period |
| `CLOUDFLARED_METRICS_ENABLE` | false | Enable metrics server |
| `CLOUDFLARED_METRICS_PORT` | 60123 | Metrics server port |

---

## ⚙️ CONFIGURATION

### Getting Started

1. **Install the app** from Tipi
2. **Access the Web UI** at `http://your-server:14333`
3. **Login** with your Basic Auth credentials (if configured)
4. **Add your Cloudflare Tunnel token** from the Cloudflare Zero Trust dashboard
5. **Start the tunnel** with one click

### Obtaining a Tunnel Token

1. Go to [Cloudflare Zero Trust Dashboard](https://one.dash.cloudflare.com/)
2. Navigate to **Networks** → **Tunnels**
3. Click **Create a tunnel**
4. Choose **Cloudflared** as the connector
5. Copy the tunnel token
6. Paste it in the Cloudflared-web UI

---

## 🔒 SECURITY NOTES
- **Enable Basic Auth** in production by setting a password
- The app uses `network_mode: host` to access host services
- Tunnel tokens should be kept secure

---

## 💾 SOURCE
* [WisdomSky/Cloudflared-web](https://github.com/WisdomSky/Cloudflared-web)
* [Cloudflare Tunnel Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
