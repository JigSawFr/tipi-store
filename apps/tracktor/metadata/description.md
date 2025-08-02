# TRACKTOR

[![GitHub Stars](https://img.shields.io/github/stars/javedh-dev/tracktor?style=flat-square&logo=github)](https://github.com/javedh-dev/tracktor/stargazers)
[![License](https://img.shields.io/github/license/javedh-dev/tracktor?style=flat-square)](https://github.com/javedh-dev/tracktor/blob/main/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/javedh-dev/tracktor?style=flat-square&logo=github)](https://github.com/javedh-dev/tracktor/issues)

Tracktor is an open-source web application for comprehensive vehicle management. Easily track fuel consumption, maintenance, insurance, and regulatory documents for all your vehicles in one place.

---

## 📖 SYNOPSIS

Tracktor provides a modern, intuitive interface for managing all aspects of vehicle ownership. From tracking fuel efficiency to managing maintenance schedules and important documents, Tracktor helps you stay organized and informed about your vehicles' needs.

## ✨ MAIN FEATURES

- **🚗 Vehicle Management**: Add, edit, and manage multiple vehicles with detailed information
- **⛽ Fuel Tracking**: Log fuel refills and monitor fuel efficiency over time with visual charts
- **🛠️ Maintenance Log**: Record and view comprehensive maintenance history for each vehicle
- **📄 Document Tracking**: Track insurance, pollution certificates (PUCC), and other important documents
- **📊 Dashboard**: Visualize key metrics, fuel consumption trends, and upcoming renewals
- **🔒 User Authentication**: Secure access to your data with user account management
- **📱 Responsive Design**: Works seamlessly on desktop and mobile devices
- **📈 Analytics**: Detailed charts and statistics for fuel consumption and maintenance costs

## 🌟 ADVANTAGES

- **Open Source**: Fully open-source with MIT license, transparent and community-driven
- **Self-Hosted**: Complete control over your data with local SQLite database
- **Modern Technology**: Built with SvelteKit and Node.js for optimal performance
- **Easy Setup**: Simple Docker deployment with minimal configuration required
- **Lightweight**: Efficient resource usage with SQLite database backend
- **Comprehensive**: All-in-one solution for complete vehicle management
- **Visual Analytics**: Rich charts and graphs for data visualization
- **Document Management**: Centralized storage for all vehicle-related documents

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `ghcr.io/javedh-dev/tracktor:latest`
- **Base**: Node.js 22 Alpine Linux
- **Architecture**: Multi-arch support (AMD64, ARM64)
- **Size**: Optimized multi-stage build for minimal footprint
- **Database**: SQLite embedded database
- **Port**: 3000 (configurable)

## 📁 VOLUMES

- **Application Data**: `${APP_DATA_DIR}/data` → `/data` (SQLite database and uploaded documents)

## 🗃️ DEFAULT PARAMETERS

- **Port**: 3000 (fixed)
- **Database Path**: `/data/vehicles.db`
- **Node Environment**: `production`
- **Timezone**: Inherits system timezone automatically via `${TZ}`
- **Log Level**: `info`

## 📝 ENVIRONMENT

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `TRACKTOR_DB_PATH` | SQLite database file path | `/data/vehicles.db` | No |
| `TRACKTOR_LOG_LEVEL` | Application logging level (error, warn, info, debug) | `info` | No |

**Note**: Timezone is automatically inherited from Runtipi system timezone via `${TZ}`. Port is fixed at 3000 and not user-configurable.

## ⚠️ IMPORTANT

- **Data Persistence**: Ensure the data volume is properly mounted to preserve your vehicle data
- **First Launch**: The application will create the initial SQLite database on first run
- **Database Location**: The SQLite database file will be stored in the mounted `/data` volume
- **User Setup**: Create your user account on first access to secure your data
- **Backup**: Regularly backup your `vehicles.db` file to prevent data loss
- **Timezone**: Application automatically uses Runtipi system timezone
- **Port**: Application runs on fixed port 3000 internally (mapped via Runtipi)

## 💾 SOURCE

- **GitHub Repository**: https://github.com/javedh-dev/tracktor
- **Official Website**: https://tracktor.bytedge.in
- **Documentation**: Available in the GitHub repository
- **Docker Image**: https://github.com/users/javedh-dev/packages/container/package/tracktor

## ❤️ PROVIDED WITH LOVE

This application is provided by the open-source community and javedh-dev. Tracktor offers a comprehensive solution for vehicle management with modern web technologies and an intuitive user interface.
