# SuggestArr

[![Build Status](https://img.shields.io/github/actions/workflow/status/giuseppe99barchetta/suggestarr/docker_hub_build.yml?branch=main&label=Build&logo=github)](https://github.com/giuseppe99barchetta/SuggestArr/actions)
[![Latest Release](https://img.shields.io/github/v/release/giuseppe99barchetta/suggestarr)](https://github.com/giuseppe99barchetta/SuggestArr/releases)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/giuseppe99barchetta/SuggestArr/blob/main/LICENSE.md)

## SYNOPSIS

SuggestArr is a media automation tool designed to recommend and request content based on your watching history. It retrieves recently watched content from media servers like Jellyfin, Plex, or Emby, searches for similar titles using the TMDb API, and sends automated download requests to Jellyseer or Overseer.

## FEATURES

### Multi-Media Server Support
- **Jellyfin Integration** - Retrieve watch history from Jellyfin
- **Plex Integration** - Connect to your Plex media server
- **Emby Integration** - Support for Emby media servers

### TMDb Integration
- **Similar Content Search** - Find movies and TV shows similar to watched content
- **Metadata Enrichment** - Use TMDb data for accurate recommendations

### Request Management
- **Jellyseer Support** - Send automated requests to Jellyseer
- **Overseer Support** - Integration with Overseer for Plex users
- **User Selection** - Choose specific users for request approval
- **Content Filtering** - Exclude content available on streaming platforms

### Web Interface
- **Configuration UI** - User-friendly setup and management
- **Real-Time Logs** - View and filter logs (INFO, ERROR, DEBUG)
- **Cron Job Management** - Schedule recommendation cycles
- **Configuration Pre-testing** - Validate API keys and URLs

### Database Support
- **SQLite** - Default lightweight database
- **PostgreSQL** - External database for improved scalability
- **MySQL** - Alternative external database option

## ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `SUGGESTARR_LOG_LEVEL` | Logging level | `info` |

## ENDPOINTS

| Endpoint | Description |
|----------|-------------|
| `/` | Web interface |

## PREREQUISITES

Before using SuggestArr, you need:
- A **TMDb API Key** from [themoviedb.org](https://www.themoviedb.org/documentation/api)
- A configured media server: **Jellyfin**, **Plex**, or **Emby**
- A configured request manager: **Jellyseer** or **Overseer**

## SETUP

1. Access the web interface at port 5000
2. Configure your media server connection (Jellyfin/Plex/Emby)
3. Enter your TMDb API key
4. Configure Jellyseer or Overseer connection
5. Set up the cron schedule for automatic recommendations

## NOTES

- Configuration is done entirely through the web interface
- All settings are persisted in the config volume
- The application validates API keys and URLs during setup

## DOCUMENTATION

Full documentation available at [GitHub Wiki](https://github.com/giuseppe99barchetta/SuggestArr/wiki)
