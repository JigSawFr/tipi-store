# Qui

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/autobrr/qui)
[![Docker](https://img.shields.io/badge/Docker-GHCR-blue?logo=docker)](https://ghcr.io/autobrr/qui)
[![Documentation](https://img.shields.io/badge/Docs-getqui.com-green)](https://getqui.com)

## Overview

Qui is a fast, modern web interface for qBittorrent with multi-instance support. Manage all your qBittorrent instances from a single, lightweight application written in Go and React.

## Features

### Core Functionality
- **Multi-Instance Support** - Manage all your qBittorrent instances from one place
- **Single Binary** - No dependencies, just download and run
- **Fast & Responsive** - Optimized for performance with large torrent collections

### Advanced Features
- **Cross-Seed** - Automatically find and add matching torrents across trackers
- **Automations** - Rule-based torrent management with conditions and actions
- **Backups & Restore** - Scheduled snapshots with multiple restore modes
- **Reverse Proxy** - Transparent qBittorrent proxy for external apps

### User Experience
- **Modern UI** - Clean, responsive interface built with React
- **Real-time Updates** - Live torrent status and statistics
- **Keyboard Shortcuts** - Efficient navigation for power users

## Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `QUI_SESSION_SECRET` | Secret key for cookie encryption | Auto-generated |
| `QUI_LOG_LEVEL` | Logging level (ERROR, DEBUG, INFO, WARN, TRACE) | INFO |

## Usage

1. Access Qui through the Tipi interface
2. Add your qBittorrent instances via the web UI
3. Configure cross-seeding and automation rules as needed
4. Set up scheduled backups for disaster recovery

## Notes

- Qui stores its configuration in `/config` inside the container
- For cross-seeding, ensure your trackers are properly configured
- The web interface is available on port 7476 by default
- Full documentation available at [getqui.com](https://getqui.com)
