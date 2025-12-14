# Portall

![Version](https://img.shields.io/badge/version-2.0.4-blue)
![Docker](https://img.shields.io/badge/docker-need4swede%2Fportall-blue)
![Architecture](https://img.shields.io/badge/arch-amd64-green)

## SYNOPSIS

**Portall** provides an intuitive web interface for generating, tracking, and organizing ports and services across multiple hosts. It's the perfect tool for homelab enthusiasts and system administrators who need to keep track of which ports are in use across their infrastructure.

## FEATURES

### Port Management
- **360+ Pre-defined Services**: Easily add, remove and assign ports with a comprehensive library of known services
- **Port Number Generation**: Quickly generate unique port numbers for your applications
- **Robust Tagging System**: Create custom tagging rules with built-in templates
- **Port Scanning**: Set up automatic port scanning to discover ports across hosts

### Docker Integration
- **Docker API Support**: Query ports directly from your Docker instance
- **Third-party Tools**: Compatible with Portainer and Komodo
- **Secure Socket Proxy**: Uses read-only Docker API access for security

### Import & Export
- **Caddyfile Import**: Import existing Caddy configurations
- **Docker Compose Import**: Import from your docker-compose stacks
- **JSON Backup**: Easily backup and restore your setup

### UI Features
- **Drag & Drop**: Easily organize ports and move applications between hosts
- **Light & Dark Themes**: Ships with both modes, with more themes planned
- **Custom CSS Support**: Style the UI to your preference
- **Mobile Responsive**: Manage ports from anywhere

## TECH STACK

- **Backend**: Flask 3.0.3 (Python 3.11)
- **Database**: SQLAlchemy 2.0.31 with SQLite
- **Frontend**: HTML5, CSS3, Vanilla JavaScript

## ENVIRONMENT

- `SECRET_KEY`: Flask secret key for session security (required)
- `DOCKER_ENABLED`: Enable Docker integration features (optional)
- `HOST_IP`: IP address of your host (defaults to 127.0.0.1)

## LINKS

- [GitHub Repository](https://github.com/need4swede/Portall)
- [Changelog](https://github.com/need4swede/Portall/blob/main/changelog.md)
