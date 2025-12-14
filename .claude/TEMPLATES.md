# 📋 Templates de Référence

Templates pour créer rapidement des fichiers conformes aux standards tipi-store.

---

## 🔧 config.json

### Template Minimal (App Simple)

```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description of what the application does and its main features. Should be comprehensive enough to understand the app purpose.",
  "version": "1.0.0",
  "tipi_version": 1,
  "short_desc": "Concise 4-5 words max",
  "author": "OriginalAuthor",
  "source": "https://github.com/owner/repo",
  "website": "https://example.com",
  "categories": ["utilities"],
  "form_fields": [],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1724160000000,
  "updated_at": 1724160000000
}
```

### Template avec Form Fields

```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description of what the application does and its main features.",
  "version": "1.0.0",
  "tipi_version": 1,
  "short_desc": "Concise 4-5 words max",
  "author": "OriginalAuthor",
  "source": "https://github.com/owner/repo",
  "website": "https://example.com",
  "categories": ["utilities", "automation"],
  "form_fields": [
    {
      "type": "text",
      "label": "Application URL",
      "hint": "The full URL where this application will be accessible (e.g., https://app.yourdomain.com). Leave empty to use default.",
      "required": false,
      "env_variable": "APPNAME_APP_URL",
      "placeholder": "https://app.yourdomain.com"
    },
    {
      "type": "random",
      "label": "Database Password",
      "hint": "Secure random password for the database. This will be auto-generated if left empty.",
      "required": true,
      "encoding": "hex",
      "env_variable": "APPNAME_DB_PASSWORD"
    },
    {
      "type": "email",
      "label": "Admin Email",
      "hint": "Email address for the administrator account. Used for notifications and account recovery.",
      "required": true,
      "env_variable": "APPNAME_ADMIN_EMAIL",
      "placeholder": "admin@example.com"
    },
    {
      "type": "number",
      "label": "Max Upload Size (MB)",
      "hint": "Maximum file upload size in megabytes. Set between 1 and 1000.",
      "required": false,
      "default": 100,
      "min": 1,
      "max": 1000,
      "env_variable": "APPNAME_MAX_UPLOAD_SIZE"
    },
    {
      "type": "boolean",
      "label": "Enable Debug Mode",
      "hint": "Enable detailed logging for troubleshooting. Only enable this if you're experiencing issues.",
      "required": false,
      "default": false,
      "env_variable": "APPNAME_DEBUG_MODE"
    },
    {
      "type": "url",
      "label": "Webhook URL",
      "hint": "Optional webhook URL for notifications. Leave empty to disable webhooks.",
      "required": false,
      "env_variable": "APPNAME_WEBHOOK_URL",
      "placeholder": "https://hooks.example.com/webhook"
    }
  ],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1724160000000,
  "updated_at": 1724160000000
}
```

### Template avec PUID/PGID

```json
{
  "$schema": "https://schemas.runtipi.io/v2/app-info.json",
  "id": "app-name",
  "available": true,
  "port": 8080,
  "name": "AppName",
  "description": "Detailed description of what the application does and its main features.",
  "version": "1.0.0",
  "tipi_version": 1,
  "short_desc": "Concise 4-5 words max",
  "author": "OriginalAuthor",
  "source": "https://github.com/owner/repo",
  "website": "https://example.com",
  "categories": ["media"],
  "form_fields": [
    {
      "type": "text",
      "label": "Application URL",
      "hint": "The full URL where this application will be accessible.",
      "required": false,
      "env_variable": "APPNAME_APP_URL",
      "placeholder": "https://app.yourdomain.com"
    }
  ],
  "exposable": true,
  "supported_architectures": ["amd64", "arm64"],
  "uid": 1000,
  "gid": 1000,
  "dynamic_config": true,
  "min_tipi_version": "4.6.5",
  "created_at": 1724160000000,
  "updated_at": 1724160000000
}
```

---

## 🐳 docker-compose.json

### Template Minimal (Service Simple)

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "APP_URL",
          "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

### Template avec Health Check

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "APP_URL",
          "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
        },
        {
          "key": "DB_PASSWORD",
          "value": "${APPNAME_DB_PASSWORD}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        },
        {
          "hostPath": "${APP_DATA_DIR}/config",
          "containerPath": "/app/config"
        }
      ],
      "healthCheck": {
        "test": "curl -f http://localhost:8080/health || exit 1",
        "interval": "30s",
        "timeout": "10s",
        "retries": 3,
        "startPeriod": "40s"
      }
    }
  ]
}
```

### Template avec PUID/PGID

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "PUID",
          "value": "1000"
        },
        {
          "key": "PGID",
          "value": "1000"
        },
        {
          "key": "APP_URL",
          "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

### Template Multi-Service

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "dependsOn": ["app-name-db"],
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "DATABASE_HOST",
          "value": "app-name-db"
        },
        {
          "key": "DATABASE_PASSWORD",
          "value": "${APPNAME_DB_PASSWORD}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    },
    {
      "name": "app-name-db",
      "image": "postgres:16",
      "environment": [
        {
          "key": "POSTGRES_PASSWORD",
          "value": "${APPNAME_DB_PASSWORD}"
        },
        {
          "key": "POSTGRES_DB",
          "value": "appdb"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/db",
          "containerPath": "/var/lib/postgresql/data"
        }
      ]
    }
  ]
}
```

### Template avec Sécurité Avancée (FUSE/Filesystem)

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "capAdd": ["SYS_ADMIN"],
      "securityOpt": ["apparmor:unconfined"],
      "devices": ["/dev/fuse:/dev/fuse"],
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        },
        {
          "key": "APP_URL",
          "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

### Template avec Network Mode Host

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "networkMode": "host",
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

### Template avec Resource Limits

```json
{
  "$schema": "https://schemas.runtipi.io/v2/dynamic-compose.json",
  "schemaVersion": 2,
  "services": [
    {
      "name": "app-name",
      "image": "ghcr.io/owner/app:1.0.0",
      "isMain": true,
      "internalPort": 8080,
      "shmSize": "2gb",
      "ulimits": {
        "nofile": {
          "soft": 65536,
          "hard": 65536
        },
        "memlock": {
          "soft": -1,
          "hard": -1
        }
      },
      "sysctls": {
        "net.core.somaxconn": "1024"
      },
      "environment": [
        {
          "key": "TZ",
          "value": "${TZ}"
        }
      ],
      "volumes": [
        {
          "hostPath": "${APP_DATA_DIR}/data",
          "containerPath": "/app/data"
        }
      ]
    }
  ]
}
```

---

## 📖 description.md

### Template Standard

```markdown
# AppName

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/owner/repo) [<img src="https://img.shields.io/github/issues/owner/repo?color=7842f5">](https://github.com/owner/repo/issues)

Brief one-sentence description of what the application does.

---

## 📖 SYNOPSIS

AppName is a [type of application] that provides [main functionality]. It is designed for [target audience/use case] and offers [key benefits].

---

## ✨ MAIN FEATURES

- **Feature 1**: Description of feature 1
- **Feature 2**: Description of feature 2
- **Feature 3**: Description of feature 3
- **Feature 4**: Description of feature 4

---

## 🐳 DOCKER IMAGE DETAILS

- **Based on [official/image](https://github.com/owner/repo)**
- Docker image: `ghcr.io/owner/app:version`
- Supported architectures: `amd64`, `arm64`
- Rootless by default

---

## 📁 VOLUMES

| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `${APP_DATA_DIR}/data` | `/app/data` | Application data |
| `${APP_DATA_DIR}/config` | `/app/config` | Configuration files |

---

## 📝 ENVIRONMENT

| Variable | Required | Description |
| --- | --- | --- |
| `APPNAME_APP_URL` | No | Full URL where app is accessible (default: auto-detected) |
| `APPNAME_DB_PASSWORD` | Yes | Database password (auto-generated if not set) |
| `APPNAME_ADMIN_EMAIL` | Yes | Administrator email address |
| `APPNAME_DEBUG_MODE` | No | Enable debug logging (default: false) |
| `TZ` | No | Timezone (auto-detected from Runtipi) |

---

## ⚙️ CONFIGURATION

### First Setup

1. Install the application through Runtipi
2. Configure the required environment variables
3. Access the application at `http://<your-ip>:8080`
4. Complete the initial setup wizard

### Default Credentials

- Username: `admin`
- Password: Check logs or set via `APPNAME_ADMIN_PASSWORD`

---

## 🎯 USAGE EXAMPLES

### Basic Usage

1. Navigate to the application URL
2. Login with your credentials
3. Start using the features

### Advanced Configuration

For advanced configuration options, refer to the official documentation at [https://docs.example.com](https://docs.example.com).

---

## ⚠️ IMPORTANT

- Ensure proper permissions on mounted volumes
- Keep the application updated for security
- Backup data regularly from `${APP_DATA_DIR}/data`
- Default ports may conflict with other services

---

## 💾 SOURCE

* [owner/repo](https://github.com/owner/repo) - Official repository
* [Documentation](https://docs.example.com) - Official documentation

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
```

---

## 🎯 Form Field Types Reference

### Type: text
```json
{
  "type": "text",
  "label": "Username",
  "hint": "Username for the application (3-20 characters)",
  "required": true,
  "env_variable": "APPNAME_USERNAME",
  "placeholder": "admin"
}
```

### Type: password
```json
{
  "type": "password",
  "label": "Password",
  "hint": "Secure password for the account (minimum 8 characters)",
  "required": true,
  "env_variable": "APPNAME_PASSWORD",
  "placeholder": "••••••••"
}
```

### Type: email
```json
{
  "type": "email",
  "label": "Email",
  "hint": "Email address for notifications and account recovery",
  "required": true,
  "env_variable": "APPNAME_EMAIL",
  "placeholder": "user@example.com"
}
```

### Type: number
```json
{
  "type": "number",
  "label": "Port Number",
  "hint": "Port number for the service (1024-65535)",
  "required": false,
  "default": 8080,
  "min": 1024,
  "max": 65535,
  "env_variable": "APPNAME_PORT"
}
```

### Type: boolean
```json
{
  "type": "boolean",
  "label": "Enable Feature",
  "hint": "Enable this feature for additional functionality",
  "required": false,
  "default": false,
  "env_variable": "APPNAME_ENABLE_FEATURE"
}
```

### Type: random
```json
{
  "type": "random",
  "label": "Secret Key",
  "hint": "Auto-generated secure random key for encryption",
  "required": true,
  "encoding": "hex",
  "env_variable": "APPNAME_SECRET_KEY"
}
```

### Type: url
```json
{
  "type": "url",
  "label": "Callback URL",
  "hint": "Full URL for callbacks (must be accessible from the internet)",
  "required": false,
  "env_variable": "APPNAME_CALLBACK_URL",
  "placeholder": "https://app.example.com/callback"
}
```

### Type: fqdn
```json
{
  "type": "fqdn",
  "label": "Domain Name",
  "hint": "Fully qualified domain name for the application",
  "required": false,
  "env_variable": "APPNAME_DOMAIN",
  "placeholder": "app.example.com"
}
```

### Type: ip
```json
{
  "type": "ip",
  "label": "Server IP",
  "hint": "IP address of the remote server",
  "required": false,
  "env_variable": "APPNAME_SERVER_IP",
  "placeholder": "192.168.1.100"
}
```

---

## 🔄 Variables Runtipi Disponibles

Variables built-in que vous pouvez utiliser dans docker-compose.json:

- `${TZ}` - Timezone (auto-détecté)
- `${APP_PROTOCOL}` - http ou https
- `${APP_DOMAIN}` - Nom de domaine
- `${APP_DATA_DIR}` - Chemin du répertoire de données

### Exemples d'utilisation

```json
{
  "key": "TZ",
  "value": "${TZ}"
}
```

```json
{
  "key": "APP_URL",
  "value": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
}
```

---

## 📋 Catégories Valides

Choisir parmi ces catégories:

- `network` - Outils réseau, DNS, VPN, proxies
- `media` - Serveurs média, streaming, entertainment
- `development` - Outils dev, IDEs, version control
- `automation` - Home automation, IoT, smart home
- `social` - Communication, chat, social networks
- `utilities` - Outils généraux, system utilities
- `photography` - Photo management, editing, galleries
- `security` - Outils sécurité, monitoring, firewalls
- `featured` - Apps recommandées
- `books` - E-books, reading, libraries
- `data` - Databases, data management, analytics
- `music` - Serveurs musique, players, management
- `finance` - Finance, budgeting, accounting
- `gaming` - Gaming servers, game management
- `ai` - IA, machine learning, automation

---

## 💡 Quick Tips

### Short Description Examples

✅ **GOOD** (4-5 words max):
- "AI document analyzer"
- "Self-hosted cloud platform"
- "Media streaming server"
- "Personal finance tracker"
- "Network monitoring tool"

❌ **BAD** (too long/vague):
- "Secure self-hosted file sync and collaboration platform" (8 words)
- "Great application for users" (too vague)
- "RESTful API gateway with microservices orchestration" (too technical)

### Environment Variable Naming

✅ **CORRECT**:
- `PAPERLESS_API_KEY`
- `SONARR_API_URL`
- `BESZEL_DB_PASSWORD`

❌ **WRONG**:
- `API_KEY` (not prefixed)
- `app_url` (lowercase)
- `PAPERLESS-URL` (uses dash)

---

Utilisez ces templates comme point de départ et adaptez-les selon vos besoins!
