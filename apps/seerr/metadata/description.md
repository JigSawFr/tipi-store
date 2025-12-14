# Seerr

![GitHub Stars](https://img.shields.io/github/stars/seerr-team/seerr?style=flat-square)
![GitHub Release](https://img.shields.io/github/v/release/seerr-team/seerr?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/seerr/seerr?style=flat-square)
![License](https://img.shields.io/github/license/seerr-team/seerr?style=flat-square)

---

## SYNOPSIS

**Seerr** is a free and open source media request and discovery manager for Jellyfin, Plex, and Emby. This is the unified successor merging Overseerr and Jellyseerr into a single project. It integrates seamlessly with your existing services like Sonarr and Radarr.

---

## FEATURES

- **Multi-Server Support**: Full Jellyfin, Emby, and Plex integration including authentication with user import & management
- **Database Flexibility**: Support for PostgreSQL and SQLite databases
- **Library Types**: Supports Movies, Shows and Mixed Libraries
- **Request System**: Customizable request system allowing users to request individual seasons or movies
- **Easy Integration**: Currently supports Sonarr and Radarr with more coming
- **Library Scanning**: Jellyfin/Emby/Plex library scan to track available titles
- **Simple Management**: Incredibly simple request management UI
- **Granular Permissions**: Fine-grained permission system
- **Notifications**: Support for various notification agents
- **Mobile-Friendly**: Responsive design for approving requests on the go
- **Watchlist & Blacklist**: Support for watchlisting & blacklisting media

---

## ENVIRONMENT

Configuration is done through the web interface after first launch.

### First Setup

1. Access Seerr at `http://your-server:5055`
2. Choose your media server (Jellyfin, Plex, or Emby)
3. Sign in with your media server credentials
4. Configure Sonarr/Radarr integration
5. Set up user permissions and notifications

### API Documentation

Access the API docs at `http://your-server:5055/api-docs`

---

## LINKS

- **Documentation**: [docs.seerr.dev](https://docs.seerr.dev/)
- **GitHub**: [seerr-team/seerr](https://github.com/seerr-team/seerr)
- **Discord**: [Join Community](https://discord.gg/seerr)
- **Migration Guide**: [Overseerr/Jellyseerr to Seerr](https://docs.seerr.dev/getting-started/)
