# VoucherVault

![Version](https://img.shields.io/badge/version-1.22.13-blue)
![Docker](https://img.shields.io/badge/docker-l4rm4nd%2Fvouchervault-blue)
![Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm64-green)

## SYNOPSIS

**VoucherVault** is a Django web application to store and manage vouchers, coupons, loyalty and gift cards digitally. It provides a user-friendly, mobile-optimized web portal with light and dark theme support.

## FEATURES

### Card Management
- **Vouchers & Coupons**: Store and organize all your vouchers
- **Gift Cards**: Track balances with transaction history
- **Loyalty Cards**: Manage membership and reward cards
- **File Uploads**: Attach images and PDFs to items

### Code Display & Scanning
- **QR Codes**: Display redeem codes as QR codes
- **Barcodes**: Support for many barcode types (1D/2D)
- **Client-side Scanning**: Scan codes during item creation with automatic type detection

### Notifications
- **Expiry Alerts**: Get notified before items expire via Apprise
- **Configurable Thresholds**: Set days before expiry for notifications
- **Multiple Channels**: Support for various notification services

### Multi-User
- **User Management**: Create and manage multiple users
- **Item Sharing**: Share items between users
- **OIDC SSO**: Single Sign-On integration
- **Admin Panel**: Full Django admin access

### Multi-Language
- English
- German
- French
- Italian

## FIRST LOGIN

The default username is `admin`. The password is **auto-generated** on first start.

Check the container logs to retrieve the initial password:
```bash
docker logs vouchervault
```

## DATABASE

VoucherVault supports both **SQLite3** (default) and **PostgreSQL**.

For PostgreSQL, configure these additional environment variables:
- `DB_ENGINE=postgres`
- `POSTGRES_HOST`, `POSTGRES_PORT`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`

## LINKS

- [Documentation Wiki](https://github.com/l4rm4nd/VoucherVault/wiki)
- [GitHub Repository](https://github.com/l4rm4nd/VoucherVault)
- [Docker Hub](https://hub.docker.com/r/l4rm4nd/vouchervault)
