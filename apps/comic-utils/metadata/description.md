# Comic Library Utilities (CLU)

[![GitHub Release](https://img.shields.io/github/v/release/allaboutduncan/comic-utils)](https://github.com/allaboutduncan/comic-utils/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/allaboutduncan/comic-utils-web)](https://hub.docker.com/r/allaboutduncan/comic-utils-web)
[![License](https://img.shields.io/github/license/allaboutduncan/comic-utils)](https://github.com/allaboutduncan/comic-utils/blob/main/LICENSE)

## SYNOPSIS

Comic Library Utilities (CLU) is a powerful, standalone web-based utility designed to manage, edit, and maintain digital comic libraries of any size. Originally built as an accessory to Komga, it has evolved into a comprehensive solution for remote comic collection management.

## FEATURES

### Directory Operations
- **Rename All Files** - Batch rename with customizable patterns
- **Convert CBR/RAR to CBZ** - Bulk format conversion
- **Rebuild Directory** - Rebuild all files in a directory
- **Convert PDF to CBZ** - Transform PDF comics
- **Missing File Check** - Identify gaps in series
- **Enhance Images** - AI-powered image enhancement
- **Clean ComicInfo.xml** - Batch metadata updates

### Single File Operations
- **Full GUI Editor** - Rename, rearrange, delete files within CBZ
- **Image Cropping** - Cover crop and free-form cropping
- **Rebuild/Convert** - CBR to CBZ conversion
- **Image Enhancement** - Enhance individual comics

### Remote Downloads
- **GetComics.org Integration** - Download directly to server
- **Pixeldrain & Mega Support** - Multiple download sources
- **Chrome Extension** - One-click downloads from browser
- **Download Queue** - Manage multiple downloads
- **PixelDrain API Key** - Remove download limits

### File Management
- **Drag & Drop** - Move files and directories
- **File Browser** - Browse source and destination
- **Bulk Rename** - Remove text from all filenames
- **Delete Directories/Files** - Clean up library

### Folder Monitoring
- **Auto-Renaming** - Based on configured patterns
- **Auto-Convert to CBZ** - Automatic format conversion
- **Sub-Directory Processing** - Monitor nested folders
- **Auto-Unpack** - Extract ZIP files automatically
- **Custom Naming Patterns** - Define renaming rules

### Metadata Integration
- **GCD Database Support** - Grand Comics Database metadata
- **ComicInfo.xml Editing** - Full metadata management
- **OPDS Support** - Catalog browsing

## ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `COMICUTILS_MONITOR` | Enable folder monitoring | `no` |

## ENDPOINTS

| Endpoint | Description |
|----------|-------------|
| `/` | Main dashboard |
| `/file` | File browser |
| `/settings` | Configuration |

## VOLUMES

| Path | Description |
|------|-------------|
| `/config` | Application configuration |
| `/data` | Comic library root (map your comics folder) |
| `/downloads` | Downloads folder for monitoring |

## NOTES

- **Comics Path**: Map your comic library to `/data`
- **Downloads Path**: If using folder monitoring, map downloads to `/downloads`
- **Config Persistence**: Map `/config` to persist settings across updates
- **PUID/PGID**: Configured automatically for proper file permissions

## DOCUMENTATION

Full documentation available at [GitBook](https://phillips-organization-6.gitbook.io/clu-comic-library-utilities/)
