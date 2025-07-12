# TINYAUTH

![Docker Image Size](https://img.shields.io/docker/image-size/steveiliop56/tinyauth/3.6.1?color=0eb305)
![Version](https://img.shields.io/badge/version-3.6.1-blue)
![GitHub Stars](https://img.shields.io/github/stars/steveiliop56/tinyauth?style=social)

A simple authentication middleware that adds a login screen or OAuth to your Docker applications.

---

## 📖 SYNOPSIS

TinyAuth is the simplest way to secure your apps with a login screen. It's a lightweight authentication middleware that adds either a basic login screen or OAuth authentication (Google, GitHub, and custom providers) to all your Docker applications. TinyAuth supports all popular reverse proxies like Traefik, Nginx, and Caddy, making it easy to secure your self-hosted services with minimal configuration.

## ✨ MAIN FEATURES

- **Multiple Authentication Methods**: Basic login with username/password and OAuth (Google, GitHub, custom providers)
- **Reverse Proxy Support**: Works with Traefik, Nginx, Caddy, and other popular proxies
- **Lightweight & Stateless**: Single binary with no dependencies, completely stateless design
- **Easy Configuration**: Environment variables only, no complex configuration files
- **OAuth Whitelist**: Restrict access to specific email domains
- **Session Management**: Configurable session expiry and security settings
- **Custom Branding**: Customize login page with custom title, background image, and messages
- **Security Features**: Login timeout, max retries, secure cookies, and TOTP support
- **Multi-Architecture**: Supports both amd64 and arm64 architectures

## 🌟 ADVANTAGES

- **Zero Configuration Complexity**: No databases, no configuration files, just environment variables
- **Universal Compatibility**: Works with any web application through reverse proxy middleware
- **Minimal Resource Usage**: Extremely lightweight with practically no resource requirements
- **Quick Setup**: Five-minute installation and configuration
- **OAuth Integration**: Easy integration with popular OAuth providers
- **Self-Hosted Control**: Complete control over your authentication infrastructure
- **Production Ready**: Used by thousands of self-hosters worldwide

## 🐳 DOCKER IMAGE DETAILS

- **Base Image**: Alpine Linux (minimal and secure)
- **Architecture**: Multi-arch support (amd64, arm64)
- **Registry**: GitHub Container Registry (ghcr.io)
- **Version**: 3.6.1
- **Size**: Optimized for minimal footprint
- **Security**: Runs with dropped capabilities and no-new-privileges

## 📁 VOLUMES

- `${APP_DATA_DIR}/data` → `/data`: Application data and configuration files

## 🗃️ DEFAULT PARAMETERS

| Parameter | Default | Description |
|-----------|---------|-------------|
| Port | 3000 | Internal application port |
| Address | 0.0.0.0 | Bind address for the server |
| Session Expiry | 7200 | Session duration in seconds (2 hours) |
| Login Timeout | 300 | Maximum time for login attempts in seconds |
| Max Retries | 5 | Maximum failed login attempts before lockout |
| Log Level | 0 | Logging level (0=Info, 1=Debug, 2=Warn, 3=Error) |

## 📝 ENVIRONMENT

| Variable | Type | Required | Description |
|----------|------|----------|-------------|
| `TINYAUTH_SECRET` | Random (hex) | Yes | 32-character secret key for session encryption |
| `TINYAUTH_APP_URL` | URL | No | Full URL where TinyAuth will be accessible (auto-detected) |
| `TINYAUTH_APP_TITLE` | String | No | Custom title for the login page |
| `TINYAUTH_USERS` | String | No | Username:password_hash pairs for basic authentication |
| `TINYAUTH_SESSION_EXPIRY` | Number | No | Session duration in seconds |
| `TINYAUTH_COOKIE_SECURE` | Boolean | No | Enable secure cookies (recommended for HTTPS) |
| `TINYAUTH_DISABLE_CONTINUE` | Boolean | No | Hide continue button on login page |
| `TINYAUTH_GITHUB_CLIENT_ID` | String | No | GitHub OAuth client ID |
| `TINYAUTH_GITHUB_CLIENT_SECRET` | Password | No | GitHub OAuth client secret |
| `TINYAUTH_GOOGLE_CLIENT_ID` | String | No | Google OAuth client ID |
| `TINYAUTH_GOOGLE_CLIENT_SECRET` | Password | No | Google OAuth client secret |
| `TINYAUTH_GENERIC_NAME` | String | No | Custom OAuth provider display name |
| `TINYAUTH_GENERIC_CLIENT_ID` | String | No | Custom OAuth provider client ID |
| `TINYAUTH_GENERIC_CLIENT_SECRET` | Password | No | Custom OAuth provider client secret |
| `TINYAUTH_GENERIC_SCOPES` | String | No | OAuth scopes for custom provider |
| `TINYAUTH_GENERIC_AUTH_URL` | URL | No | Authorization URL for custom OAuth provider |
| `TINYAUTH_GENERIC_TOKEN_URL` | URL | No | Token URL for custom OAuth provider |
| `TINYAUTH_GENERIC_USER_URL` | URL | No | User info URL for custom OAuth provider |
| `TINYAUTH_OAUTH_WHITELIST` | String | No | Allowed email domains for OAuth |
| `TINYAUTH_OAUTH_AUTO_REDIRECT` | String | No | Auto-redirect to OAuth provider |
| `TINYAUTH_BACKGROUND_IMAGE` | URL | No | Custom background image URL |
| `TINYAUTH_FORGOT_PASSWORD_MESSAGE` | String | No | Custom forgot password message |
| `TINYAUTH_LOGIN_TIMEOUT` | Number | No | Login timeout in seconds |
| `TINYAUTH_LOGIN_MAX_RETRIES` | Number | No | Maximum failed login attempts |
| `TINYAUTH_LOG_LEVEL` | Number | No | Application logging level |
| `TINYAUTH_GENERIC_SKIP_SSL` | Boolean | No | Skip SSL verification for custom OAuth |

## ⚠️ IMPORTANT

- **Reverse Proxy Required**: TinyAuth works as middleware, requires a reverse proxy (Traefik, Nginx, Caddy)
- **HTTPS Recommended**: Always use HTTPS in production with `TINYAUTH_COOKIE_SECURE=true`
- **Secret Security**: Use a strong 32-character secret key for session encryption
- **OAuth Setup**: Configure OAuth applications in GitHub/Google before using OAuth features
- **Password Hashing**: Use bcrypt to hash passwords for basic authentication
- **Domain Whitelist**: Use `TINYAUTH_OAUTH_WHITELIST` to restrict OAuth access to specific domains

## 💾 SOURCE

- **Project Repository**: [steveiliop56/tinyauth](https://github.com/steveiliop56/tinyauth)
- **Docker Image**: [ghcr.io/steveiliop56/tinyauth](https://github.com/steveiliop56/tinyauth/pkgs/container/tinyauth)
- **Documentation**: [tinyauth.app](https://tinyauth.app/)
- **Demo**: [demo.tinyauth.app](https://demo.tinyauth.app/) (user: `user`, password: `password`)

## ❤️ PROVIDED WITH LOVE

Provided by the Tipi Community
