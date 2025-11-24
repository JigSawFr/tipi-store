# AIOMetadata

AIOMetadata is a next-generation metadata addon for Stremio, designed for power users. It aggregates and enriches movie, series, and anime metadata from multiple sources (TMDB, TVDB, MyAnimeList, AniList, IMDb, TVmaze, Fanart.tv, MDBList, and more), giving you full control over catalog sources, artwork, and search.

## 🚀 Key Features

### Multi-Source Metadata
- Choose your preferred provider for each content type (movies, series, anime)
- Support for TMDB, TVDB, MAL, AniList, IMDb, TVmaze, and more
- Advanced ID mapping between all major systems

### High-Quality Artwork
- High-resolution posters, backgrounds, and logos
- Multiple sources: TMDB, TVDB, Fanart.tv, AniList, RPDB
- Language-aware selection with automatic fallback

### Complete Anime Support
- Deep integration with MAL, AniList, Kitsu, AniDB
- Specialized catalogs by studio, genre, decade, and schedule
- TVDB/IMDb mapping for maximum compatibility

### Customizable Catalogs
- Add, reorder, and remove catalogs via drag-and-drop interface
- Integration with MDBList personal lists
- Streaming platform catalogs (Netflix, Disney+, etc.) with region filters

### Dynamic Search
- Enable/disable search engines per content type
- Optional AI-powered search (Gemini)
- Per-user configuration

### Secure Configuration
- Per-user configuration with password protection
- Optional addon password protection
- Trusted UUIDs for seamless re-login

### High-Performance Cache
- Redis cache with ETag support
- Self-healing mechanism for maximum reliability
- Optional cache warming for popular content

## 📋 Requirements

### Required API Keys

To use AIOMetadata, you need to obtain the following API keys:

1. **TMDB API Key** (required): [https://www.themoviedb.org/settings/api](https://www.themoviedb.org/settings/api)
2. **TVDB API Key** (required): [https://thetvdb.com/](https://thetvdb.com/)
3. **Fanart.tv API Key** (required): [https://fanart.tv/](https://fanart.tv/)
4. **MDBList API Key** (required): [https://mdblist.com/](https://mdblist.com/)
5. **RPDB API Key** (required): [https://rpdb.net/](https://rpdb.net/)

### Configuration

- **Admin Key**: Secure key for configuration management (set by you)
- **Hostname**: Your domain name or IP address to access the application
- **Port**: 3232 (default)

### Advanced Options

- **TMDB SOCKS Proxy**: SOCKS proxy for TMDB requests (optional)
- **Cache Warming**: Dedicated API keys for automatic cache warming
- **Warming Interval**: Refresh frequency (default: 24h)
- **Cache Language**: Language for popular content (default: en-US)

## 🎯 Usage

1. Access the configuration interface at `http://your-hostname:3232/configure`
2. Configure your catalogs, providers, and preferences
3. Save your configuration
4. Install the generated addon URL in Stremio

## 🔧 Architecture

The application uses:
- **Node.js/React** for modern and intuitive user interface
- **Redis** for high-performance caching
- **SQLite** for configuration storage (PostgreSQL supported)
- **Docker** for simple and isolated deployment

## 📝 Notes

- All data comes from third-party sources
- Data accuracy and availability are not guaranteed
- Cache warming significantly improves performance for popular content
