# 🔐 VoidAuth

[![GitHub Release](https://img.shields.io/github/v/release/voidauth/voidauth?style=flat-square)](https://github.com/voidauth/voidauth/releases)
[![GitHub Stars](https://img.shields.io/github/stars/voidauth/voidauth?style=flat-square)](https://github.com/voidauth/voidauth)
[![License](https://img.shields.io/github/license/voidauth/voidauth?style=flat-square)](https://github.com/voidauth/voidauth/blob/main/LICENSE)

**Single Sign-On for Your Self-Hosted Universe**

VoidAuth is an open-source SSO authentication and user management provider that stands guard in front of your self-hosted applications. It is easy-to-use for admins and end-users, supporting features like passkeys, user invitation, self-registration, email support, and more!

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🌐 **OIDC Provider** | Full OpenID Connect provider for seamless app integration |
| 🔄 **Proxy ForwardAuth** | Protect apps that don't support OIDC natively |
| 👤 **User Management** | Comprehensive user and groups administration |
| 📨 **Invitations** | User self-registration and invitation system |
| 🎨 **Customizable** | Logo, title, theme color, and email templates |
| 🔑 **Passkeys & MFA** | Multi-factor authentication with passkey support |
| 📧 **Email Verification** | Secure password reset with email verification |
| 🔒 **Encryption** | Encryption-at-rest with Postgres or SQLite database |

---

## 🚀 Getting Started

1. **Install VoidAuth** from the Tipi App Store
2. **Check the logs** after first start to get initial admin credentials:
   ```bash
   docker compose logs voidauth
   ```
3. **Login** with the initial credentials and change your password
4. **Configure OIDC clients** or **ProxyAuth domains** for your apps

---

## ⚙️ Environment Variables

### Required
| Variable | Description |
|----------|-------------|
| `STORAGE_KEY` | Encryption key for secret values (min 32 chars) |
| `DB_PASSWORD` | PostgreSQL database password |

### Optional
| Variable | Default | Description |
|----------|---------|-------------|
| `APP_TITLE` | VoidAuth | Title on web interface |
| `APP_COLOR` | #906bc7 | Theme color (hex format) |
| `SIGNUP` | false | Allow self-registration |
| `MFA_REQUIRED` | false | Require MFA for all users |
| `SMTP_*` | - | Email configuration for notifications |

---

## 📖 Documentation

For detailed setup instructions and configuration options, visit the [official documentation](https://voidauth.app/#/Getting-Started).

---

## 🔗 Links

- [GitHub Repository](https://github.com/voidauth/voidauth)
- [Official Website](https://voidauth.app)
- [Documentation](https://voidauth.app/#/Getting-Started)
- [OIDC Setup Guide](https://voidauth.app/#/OIDC-Setup)
- [ProxyAuth Guide](https://voidauth.app/#/ProxyAuth-and-Trusted-Header-SSO-Setup)
