# UsenetStreamer

![GitHub Stars](https://img.shields.io/github/stars/Sanket9225/UsenetStreamer?style=flat-square)
![Docker Pulls](https://img.shields.io/badge/docker-ghcr.io-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

---

## SYNOPSIS

**UsenetStreamer** is a Stremio addon that bridges Prowlarr/NZBHydra, NZBDav, and Stremio for seamless Usenet streaming. Query your favorite indexers, stream directly over WebDAV, and manage everything from a friendly web dashboard.

---

## FEATURES

- **Smart Search**: IMDb/TMDB/TVDB-aware search with parallel queries to Prowlarr or NZBHydra
- **Multi-Language Support**: Preferred language groups with automatic sorting and 🌐 badges
- **Instant Streams**: Completed NZBDav jobs detected automatically with ⚡ tags
- **NNTP Health Checks**: Optional triage downloads to verify NZB health before streaming
- **Built-in Easynews**: Native username/password integration without external proxy
- **Two-Tier Caching**: Stremio responses + verified NZBs for instant repeat requests
- **Smart Deduplication**: Collapses near-identical releases using normalized titles
- **Per-Resolution Caps**: Limit streams per quality tier (4K, 1080p, etc.)
- **Secure by Default**: Shared-secret gate protects all endpoints

---

## ENVIRONMENT

Configuration is managed through the admin dashboard at `https://your-domain/<token>/admin/`.

### Key Variables

| Variable | Description |
|----------|-------------|
| `ADDON_SHARED_SECRET` | Token securing admin dashboard and manifest URLs |
| `CONFIG_DIR` | Path for persistent configuration storage |
| `INDEXER_MANAGER` | `prowlarr` or `nzbhydra` |
| `NZBDAV_URL` | NZBDav API endpoint |
| `EASYNEWS_ENABLED` | Enable built-in Easynews search |

### Accessing the Dashboard

After installation, visit:
```
https://your-domain/<ADDON_SHARED_SECRET>/admin/
```

### Getting Started

1. Configure your Prowlarr/NZBHydra connection in the admin panel
2. Set up NZBDav for WebDAV streaming
3. Copy the manifest URL and add it to Stremio
4. Start streaming!

---

## LINKS

- **Documentation**: [GitHub README](https://github.com/Sanket9225/UsenetStreamer)
- **Beginner Guide**: [docs/beginners-guide.md](https://github.com/Sanket9225/UsenetStreamer/blob/master/docs/beginners-guide.md)
- **Discord**: [Community Chat](https://discord.gg/tUwNjXSZZN)
- **Support**: [Buy Me a Coffee](https://buymeacoffee.com/gaikwadsank)
