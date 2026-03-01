# HOMEBOX

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/sysadminsmedia/homebox) [<img src="https://img.shields.io/github/issues/sysadminsmedia/homebox?color=7842f5">](https://github.com/sysadminsmedia/homebox/issues)

Inventory and organization system for the Home User.

---

## 📖 SYNOPSIS
Homebox is a simple, fast, and portable inventory and organization system for home users. It uses SQLite and an embedded Web UI for easy deployment and backup. Written in Go for minimal resource usage.

---

## ✨ MAIN FEATURES
- Simple and easy to use
- Blazingly fast (Go-based)
- Portable (runs anywhere, uses SQLite)
- Modern web UI
- Minimal setup, no complex configuration

---

## 🌟 ADVANTAGES
- Open Source and actively maintained
- Lightweight and resource-efficient
- Designed for home users

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox)**
- Built via a secure, pinned CI/CD process
- Contains a proper health check
- Auto update feature: the latest version is automatically built and published
- Special thanks to [@hay-kot](https://github.com/hay-kot) (project) et [@lakotelman](https://github.com/lakotelman) (logo)

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/homebox/data` | `/data` | Configuration and database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |

---

## 📝 ENVIRONMENT

### General
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `HBOX_LOG_LEVEL` | info | Log level (trace, debug, info, warn, error) |
| `HBOX_LOG_FORMAT` | text | Log format (text, json) |
| `HBOX_WEB_MAX_UPLOAD_SIZE` | 10 | Max upload size in MB |
| `HBOX_OPTIONS_ALLOW_REGISTRATION` | false | Allow user self-registration |
| `HBOX_OPTIONS_AUTO_INCREMENT_ASSET_ID` | true | Auto-increment asset_id for new items |
| `HBOX_OPTIONS_ALLOW_ANALYTICS` | false | Allow basic analytics for the Homebox team |
| `HBOX_OPTIONS_GITHUB_RELEASE_CHECK` | true | Check for new GitHub releases |
| `HBOX_OPTIONS_TRUST_PROXY` | false | Trust proxy headers (X-Forwarded-Proto) |
| `HBOX_OPTIONS_HOSTNAME` | | Override hostname for OIDC redirect URLs |
| `HBOX_OPTIONS_CURRENCY_CONFIG` | | Path to JSON currency config file |
| `HBOX_OPTIONS_ALLOW_LOCAL_LOGIN` | true | Allow username/password login when OIDC is enabled |

### Email (SMTP)
| Parameter | Default value | Description |
| --- | --- | --- |
| `HBOX_MAILER_HOST` | | SMTP host (leave empty to disable) |
| `HBOX_MAILER_PORT` | 587 | SMTP port |
| `HBOX_MAILER_USERNAME` | | SMTP username |
| `HBOX_MAILER_PASSWORD` | | SMTP password |
| `HBOX_MAILER_FROM` | | From address (e.g., noreply@example.com) |

### OIDC (Single Sign-On)
| Parameter | Default value | Description |
| --- | --- | --- |
| `HBOX_OIDC_ENABLED` | false | Enable OpenID Connect authentication |
| `HBOX_OIDC_ISSUER_URL` | | OIDC provider issuer URL |
| `HBOX_OIDC_CLIENT_ID` | | OIDC client ID |
| `HBOX_OIDC_CLIENT_SECRET` | | OIDC client secret |
| `HBOX_OIDC_SCOPE` | openid profile email | OIDC scopes to request |
| `HBOX_OIDC_ALLOWED_GROUPS` | | Comma-separated allowed groups (empty = all) |
| `HBOX_OIDC_AUTO_REDIRECT` | false | Auto redirect to OIDC provider |
| `HBOX_OIDC_VERIFY_EMAIL` | false | Require email verification from provider |
| `HBOX_OIDC_GROUP_CLAIM` | groups | ID token claim for user groups |
| `HBOX_OIDC_EMAIL_CLAIM` | email | ID token claim for user email |
| `HBOX_OIDC_NAME_CLAIM` | name | ID token claim for display name |
| `HBOX_OIDC_EMAIL_VERIFIED_CLAIM` | email_verified | ID token claim for email verification |
| `HBOX_OIDC_BUTTON_TEXT` | Sign in with OIDC | OIDC login button text |

### Thumbnails & Barcode
| Parameter | Default value | Description |
| --- | --- | --- |
| `HBOX_THUMBNAIL_ENABLED` | true | Enable thumbnail generation (PNG, JPEG, AVIF, WEBP, GIF) |
| `HBOX_THUMBNAIL_WIDTH` | 500 | Thumbnail width in pixels |
| `HBOX_THUMBNAIL_HEIGHT` | 500 | Thumbnail height in pixels |
| `HBOX_BARCODE_TOKEN_BARCODESPIDER` | | API token for BarcodeSpider.com barcode lookups |

---

## ⚠️ IMPORTANT
- For the full list of environment variables, see the [official documentation](https://homebox.software/en/quick-start/configure/).
- For best experience, see the [quick start guide](https://homebox.software/en/quick-start/).

---

## 💾 SOURCE
* [sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on le dépôt GitHub officiel.