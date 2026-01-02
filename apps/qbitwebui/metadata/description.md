# qBitWebUI

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/Maciejonos/qbitwebui)
[![Docker](https://img.shields.io/badge/Docker-GHCR-blue?logo=docker)](https://ghcr.io/maciejonos/qbitwebui)

## Overview

qBitWebUI is a modern, fast, and beautiful alternative web user interface for qBittorrent. Built with React 19, TypeScript, and Tailwind CSS, it provides a superior experience for managing your torrents.

## Features

### Core Functionality
- **Real-time Torrent Monitoring** - Live updates on download/upload speeds and progress
- **Magnet Link Support** - Add torrents directly via magnet links
- **Drag & Drop Uploads** - Easy torrent file uploads with drag and drop
- **File Priority Management** - Set download priorities for individual files

### User Experience
- **Multiple Themes** - Light and dark modes with customizable themes
- **Keyboard Navigation** - Full keyboard shortcuts for power users
- **Responsive Design** - Works on desktop, tablet, and mobile devices
- **Fast Performance** - Optimized React 19 for smooth interactions

### Technical Features
- **TypeScript** - Full type safety throughout the codebase
- **Tailwind CSS** - Modern, utility-first styling
- **Modern Architecture** - Clean, maintainable code structure

## Requirements

- A running qBittorrent instance with Web UI enabled
- qBittorrent Web API access (default port 8080)

## Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `QBITWEBUI_URL` | Full URL to your qBittorrent instance | Yes |

## Usage

1. Enable Web UI in your qBittorrent settings
2. Configure the qBittorrent URL in the app settings
3. Access qBitWebUI through Tipi's interface
4. Log in with your qBittorrent credentials

## Notes

- Ensure qBittorrent's Web UI is accessible from the Tipi server
- For remote access, you may need to configure CORS settings in qBittorrent
- The Web UI runs on nginx serving static files
