# Baikal

[![GitHub](https://img.shields.io/badge/GitHub-sabre--io%2FBaikal-blue?logo=github)](https://github.com/sabre-io/Baikal)
[![Docker](https://img.shields.io/badge/Docker-ckulka%2Fbaikal-blue?logo=docker)](https://hub.docker.com/r/ckulka/baikal)

Baikal is a lightweight CalDAV and CardDAV server based on sabre/dav. It offers an extensive web interface with easy management of users, address books, and calendars.

## ✨ Features

- 📅 **CalDAV Support** - Full RFC 4791 compliance for calendars
- 📇 **CardDAV Support** - Full RFC 6352 compliance for contacts
- 🖥️ **Web Admin Interface** - Easy user and resource management
- 🔐 **User Authentication** - Built-in user management with password protection
- 📱 **Client Compatibility** - Works with Apple Calendar, Contacts, Thunderbird, DAVx⁵, and more
- 🪶 **Lightweight** - Minimal resource requirements
- 🗄️ **SQLite or MySQL** - Flexible database options

## 🚀 First Setup

1. After installation, access Baikal at `http://your-server:port`
2. Complete the initial setup wizard:
   - Set an admin password
   - Configure database (SQLite by default)
   - Configure basic settings
3. Log in to the admin interface at `/admin/`
4. Create users and calendars/address books

## 📱 Client Configuration

### iOS / macOS
1. Go to **Settings** → **Calendar** → **Accounts** → **Add Account**
2. Select **Other** → **Add CalDAV Account**
3. Enter your server URL, username, and password

### DAVx⁵ (Android)
1. Install DAVx⁵ from F-Droid or Play Store
2. Add account with base URL: `http://your-server:port/dav.php`

### Thunderbird
1. Install TbSync and Provider for CalDAV & CardDAV
2. Add new account with server URL

## 📁 Data Persistence

The following directories are persisted:
- `/var/www/baikal/config` - Configuration files
- `/var/www/baikal/Specific` - Database and user data

## 🔗 Links

- [Official Website](https://sabre.io/baikal/)
- [GitHub Repository](https://github.com/sabre-io/Baikal)
- [Docker Image](https://github.com/ckulka/baikal-docker)
- [Documentation](https://sabre.io/baikal/install/)
