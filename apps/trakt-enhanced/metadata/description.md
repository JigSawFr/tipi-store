# Trakt Enhanced

![GitHub Stars](https://img.shields.io/github/stars/diabolino/trakt_enhanced?style=flat-square)
![GitHub Release](https://img.shields.io/github/v/release/diabolino/trakt_enhanced?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

---

## SYNOPSIS

**Trakt Enhanced** is a web application to browse your Trakt history with a beautiful, modern UI. View your watched shows, movies, and your watchlist with TMDB posters, all cached locally for fast performance.

---

## FEATURES

- **Beautiful UI**: 100% HTML interface, easily customizable
- **Smart Organization**: Sort and search Shows, Movies, Shows to watch, Movies to watch
- **TMDB Integration**: Cards with high-quality TMDB posters cached locally
- **Auto Refresh**: Automatic refresh at startup and configurable intervals
- **Local Assets**: Tailwind CSS build without CDN, local Font Awesome
- **Progress Tracking**: Per-series progress cached with 6h TTL
- **Bilingual**: French and English support

---

## ENVIRONMENT

### Required API Keys

Before using Trakt Enhanced, you need to obtain:

1. **Trakt API Keys**:
   - Go to [trakt.tv/oauth/applications](https://trakt.tv/oauth/applications)
   - Create a new application
   - Use `http(s)://your-domain/auth/callback` as redirect URI
   - Copy Client ID and Client Secret

2. **TMDB API Key**:
   - Go to [themoviedb.org](https://www.themoviedb.org/settings/api)
   - Request an API key
   - Copy the API key

### Useful Endpoints

| Endpoint | Description |
|----------|-------------|
| `GET /` | Main HTML page |
| `GET /api/data` | JSON data for shows/movies |
| `POST /refresh` | Rebuild page (ignores TTL) |
| `POST /full_rebuild` | Full cache rebuild (password protected) |
| `GET /cache_imgs/<file>` | Cached TMDB posters |
| `GET /setup` | Initial configuration form |

### Data Storage

- `/app/data` - Cache for posters and Trakt progress
- `/app/config` - Configuration files

---

## LINKS

- **GitHub**: [diabolino/trakt_enhanced](https://github.com/diabolino/trakt_enhanced)
- **Docker Docs**: [docker.md](https://github.com/diabolino/trakt_enhanced/blob/main/docker.md)
