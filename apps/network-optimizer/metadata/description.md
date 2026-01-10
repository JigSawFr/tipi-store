# NETWORK OPTIMIZER

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Ozark-Connect/NetworkOptimizer) [<img src="https://img.shields.io/github/issues/Ozark-Connect/NetworkOptimizer?color=7842f5">](https://github.com/Ozark-Connect/NetworkOptimizer/issues)

---

## 📖 SYNOPSIS
Network Optimizer for UniFi is a comprehensive security auditing and network optimization tool. It connects to your UniFi controller, analyzes your configuration, and tells you what's working, what's broken, and what you should fix. No more guessing about firewall rules, VLAN isolation, or DNS security.

---

## ✨ MAIN FEATURES
- **Security Auditing**: 39 security checks across firewall, VLAN, DNS, and port categories with 0-100 scoring
- **Firewall Analysis**: Detects shadowed rules, subverted deny rules, and orphaned network references
- **VLAN Security**: Validates IoT device placement using UniFi fingerprints and MAC OUI lookup
- **DNS Security**: Checks DoH configuration, bypass routes, and WAN DNS settings
- **Adaptive SQM**: Automatic bandwidth management with dual-WAN support and connection profiles
- **LAN Speed Testing**: iperf3 tests between gateway and network devices with path analysis
- **Client Speed Testing**: Browser-based speed tests via OpenSpeedTest with geolocation support
- **Cellular Monitoring**: U-LTE and U5G-Max signal quality monitoring (RSSI, RSRP, RSRQ, SINR)
- **PDF Reports**: Export security audit results for documentation

---

## 🌟 ADVANTAGES
- Comprehensive security scoring with actionable recommendations
- No public exposure required for your controller
- Supports both UniFi OS devices and self-hosted controllers
- Works with Security Audit even without SSH access
- Active development with modern .NET/Blazor architecture

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [ozark-connect/network-optimizer](https://github.com/Ozark-Connect/NetworkOptimizer)
- Built with .NET 10, Blazor Server, SQLite
- Web UI accessible on port 8042
- Multi-architecture support (amd64, arm64)

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/network-optimizer/data` | `/app/data` | SQLite database, configs, license |
| `/runtipi/app-data/network-optimizer/logs` | `/app/logs` | Application logs |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `TZ` | UTC | Timezone for the container |
| `APP_PASSWORD` | Auto-generated | Admin password (optional, see logs on first run) |

---

## 🔧 FIRST RUN SETUP
1. Check the container logs for the auto-generated admin password
2. Navigate to Settings and enter your UniFi controller URL
3. Create a **Local Access Only** account on your controller (Ubiquiti SSO won't work)
4. Click Connect to authenticate
5. Navigate to Audit to run your first security scan

---

## ⚙️ REQUIREMENTS
**Basic (Security Audit only):**
- UniFi OS device (UDM, UCG, UDR, or Cloud Key) or self-hosted UniFi Network Server
- Network access to your UniFi controller API (HTTPS)

**Full Functionality (Adaptive SQM, LAN Speed Testing):**
- SSH access enabled on your UniFi gateway and devices

---

## 📚 DOCUMENTATION
- [Official Documentation](https://github.com/Ozark-Connect/NetworkOptimizer/blob/main/README.md)
- [Deployment Guide](https://github.com/Ozark-Connect/NetworkOptimizer/blob/main/docker/DEPLOYMENT.md)
- [NAS Deployment](https://github.com/Ozark-Connect/NetworkOptimizer/blob/main/docker/DEPLOYMENT.md#nas-deployment)

---

## 💬 SUPPORT & COMMUNITY
- [GitHub Issues](https://github.com/Ozark-Connect/NetworkOptimizer/issues)
- [Feature Requests](https://github.com/Ozark-Connect/NetworkOptimizer/issues/new)

---

## 💾 SOURCE
* [Ozark-Connect/NetworkOptimizer](https://github.com/Ozark-Connect/NetworkOptimizer)
