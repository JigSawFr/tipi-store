# Ackify CE

[![Build](https://github.com/btouchard/ackify-ce/actions/workflows/ci.yml/badge.svg)](https://github.com/btouchard/ackify-ce/actions)
[![codecov](https://codecov.io/gh/btouchard/ackify-ce/branch/main/graph/badge.svg)](https://codecov.io/gh/btouchard/ackify-ce)
[![License](https://img.shields.io/badge/License-AGPL--3.0-blue.svg)](https://github.com/btouchard/ackify-ce/blob/main/LICENSE)

## SYNOPSIS

Ackify is a secure document reading validation tool that provides timestamped, immutable proof of acknowledgment using Ed25519 cryptographic signatures. It enables organizations to prove that collaborators have read and acknowledged important documents with irrefutable cryptographic evidence.

## FEATURES

### Cryptographic Security
- **Ed25519 Signatures** - State-of-the-art elliptic curve cryptography
- **SHA-256/512/MD5 Checksums** - Document integrity verification
- **Immutable Timestamps** - PostgreSQL triggers ensure data integrity
- **AES-256-GCM** - Encrypted refresh tokens

### Authentication
- **OAuth2 Support** - Google, GitHub, GitLab, or custom providers
- **MagicLink** - Passwordless email authentication
- **PKCE Security** - Enhanced OAuth2 flow protection

### Document Management
- **One Signature Per User/Document** - Database enforced uniqueness
- **Expected Signers Tracking** - Define who should sign
- **Email Reminders** - Automated notifications for pending signatures
- **Immutable Audit Trail** - Complete signature history

### Integration
- **Embeddable Widgets** - iFrame support for Notion, Outline, Google Docs
- **oEmbed Discovery** - Automatic embedding in compatible tools
- **REST API** - Full programmatic access
- **Open Graph** - Rich URL previews in Slack, Teams

### Interface
- **Admin Dashboard** - Vue.js 3 with dark mode
- **Multilingual** - French, English, Spanish, German, Italian
- **Rate Limiting** - 5 auth/min, 100 req/min

## USE CASES

| Use Case | Description |
|----------|-------------|
| Security Policy Validation | GDPR, ISO, IT security compliance |
| Training Attestations | Track employee training completion |
| Contractual Agreements | Document acceptance proof |
| HR Policies | Internal rules acknowledgment |
| Procedure Validation | Critical workflow documentation |

## ENVIRONMENT

| Variable | Description | Required |
|----------|-------------|----------|
| `ACKIFY_ORGANISATION` | Organization name | Yes |
| `ACKIFY_ADMIN_EMAILS` | Comma-separated admin emails | Yes |
| `ACKIFY_OAUTH_COOKIE_SECRET` | Session encryption key | Yes |
| `ACKIFY_OAUTH_PROVIDER` | OAuth provider (google/github/gitlab) | No |
| `ACKIFY_OAUTH_CLIENT_ID` | OAuth client ID | No |
| `ACKIFY_OAUTH_CLIENT_SECRET` | OAuth client secret | No |
| `ACKIFY_MAIL_HOST` | SMTP server for MagicLink | No |
| `ACKIFY_MAIL_PORT` | SMTP port | No |
| `ACKIFY_MAIL_USERNAME` | SMTP username | No |
| `ACKIFY_MAIL_PASSWORD` | SMTP password | No |
| `ACKIFY_MAIL_FROM` | Sender email address | No |

## ENDPOINTS

| Endpoint | Description |
|----------|-------------|
| `/` | Main interface |
| `/?doc=<id>` | Request signature for document |
| `/embed?doc=<id>` | Embeddable widget |
| `/api/v1/health` | Health check |
| `/admin` | Admin dashboard |

## AUTHENTICATION

You need **at least one** authentication method:

1. **OAuth2** - Set `ACKIFY_OAUTH_CLIENT_ID` and `ACKIFY_OAUTH_CLIENT_SECRET`
2. **MagicLink** - Set `ACKIFY_MAIL_HOST` for passwordless email authentication

Both methods can be used simultaneously.

## NOTES

- **Cookie Secret**: Generate with `openssl rand -base64 32`
- **Database**: PostgreSQL 16 included automatically
- **Image Size**: < 30MB distroless container
- **Migrations**: Run automatically on startup

## DOCUMENTATION

Full documentation available at [GitHub Docs](https://github.com/btouchard/ackify-ce/tree/main/docs/en)
