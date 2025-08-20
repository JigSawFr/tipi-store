# Decypharr

Decypharr is a QBittorrent API implementation for multiple debrid services. It provides a seamless integration between your media automation stack and various debrid providers including Real-Debrid, Torbox, Debrid-Link, and All-Debrid.

## Features

- **QBittorrent API Compatibility**: Drop-in replacement for QBittorrent in your media automation tools
- **Multiple Debrid Services**: Support for Real-Debrid, Torbox, Debrid-Link, and All-Debrid
- **Download Management**: Unified interface for managing downloads across different services
- **File System Mount**: Uses FUSE to mount debrid downloads for seamless media access
- **REST API**: Full QBittorrent-compatible API for integration with Sonarr, Radarr, and other *arr applications

## Configuration

### Required Settings
- **API Username**: Username for accessing the QBittorrent API
- **API Password**: Password for API authentication
- **Download Path**: Local path where downloads will be accessible

### Debrid Services
Configure at least one debrid service by providing the corresponding API key:
- **Real-Debrid**: Premium link generator and torrent downloader
- **Torbox**: Cloud torrent downloader with high-speed downloads
- **Debrid-Link**: Multi-hoster premium link generator
- **All-Debrid**: Premium link generator supporting 100+ hosts

### Advanced Options
- **Debug Logging**: Enable detailed logging for troubleshooting
- **PUID/PGID**: User and group IDs for file permissions

## Integration

Once configured, Decypharr can be used as a download client in:
- Sonarr (TV shows)
- Radarr (Movies)
- Lidarr (Music)
- Prowlarr (Indexer management)

Simply configure these applications to use Decypharr as a QBittorrent client with the appropriate host and credentials.

## Important Notes

- This application requires privileged Docker access and FUSE device mounting
- Ensure your debrid service accounts have sufficient premium time and quota
- Download paths should be accessible to your media server applications
- API credentials should be kept secure and not shared

For more information, visit the [official Decypharr repository](https://github.com/sirrobot01/decypharr).
