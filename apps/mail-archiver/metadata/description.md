# Mail-Archiver

[![GitHub Stars](https://img.shields.io/github/stars/s1t5/mail-archiver)](https://github.com/s1t5/mail-archiver/stargazers)
[![Latest Release](https://img.shields.io/github/v/release/s1t5/mail-archiver)](https://github.com/s1t5/mail-archiver/releases)
[![License](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](https://github.com/s1t5/mail-archiver/blob/main/LICENSE)

## SYNOPSIS

Mail-Archiver is a comprehensive web application for archiving, searching, and exporting emails from multiple accounts. Built with ASP.NET Core 8 and PostgreSQL, it provides automated email backup with scheduled synchronization, advanced search capabilities, and export options.

## FEATURES

### Core Features
- **Automated Archiving** - Archive incoming and outgoing emails from multiple accounts
- **Scheduled Synchronization** - Automatic sync with configurable intervals
- **Attachment Storage** - Full attachment preservation
- **Responsive UI** - Mobile and desktop optimized with dark mode
- **Multilingual** - Support for multiple languages

### Search & Access
- **Advanced Search** - Full-text search across all archived emails
- **Filtering Options** - Filter by date, sender, subject, folder
- **Email Preview** - View emails with attachment list
- **mbox Export** - Export entire accounts as mbox files
- **EML Export** - Export individual emails or batches as zipped EML

### User Management
- **Multi-User Support** - Account-specific permissions
- **Dashboard** - Statistics, storage monitoring, sender analysis
- **Access Logging** - Detailed activity tracking
- **OIDC Support** - OpenID Connect authentication integration

### Email Provider Support
- **IMAP** - Traditional IMAP accounts with full sync
- **Microsoft 365** - M365 mail via Microsoft Graph API
- **Import Mode** - Import-only accounts for migration

### Import & Restore
- **MBox Import** - Import existing mbox archives
- **EML Import** - Import ZIP files with folder structure
- **Restore Function** - Restore emails to destination mailboxes

### Retention Policies
- **Auto-Deletion** - Automatic cleanup after specified days
- **Per-Account Settings** - Configure retention per email account
- **Local Retention** - Separate retention for local archive

## ENVIRONMENT

| Variable | Description | Default |
|----------|-------------|---------|
| `MAILARCHIVER_ADMIN_USERNAME` | Admin username | `admin` |
| `MAILARCHIVER_ADMIN_PASSWORD` | Admin password | Required |
| `MAILARCHIVER_TIMEZONE` | Display timezone | `Etc/UTC` |

## ENDPOINTS

| Endpoint | Description |
|----------|-------------|
| `/` | Dashboard and main interface |
| `/Archive` | Email archive browser |
| `/EmailAccounts` | Account management |

## SETUP

1. Access the web interface at port 5000
2. Login with your configured admin credentials
3. Navigate to "Email Accounts" → "New Account"
4. Enter IMAP server details and credentials
5. Save and start archiving

## SECURITY NOTES

- Use strong passwords for admin account
- Configure HTTPS via reverse proxy for production
- Regular PostgreSQL backups recommended
- Application does not provide native HTTPS

## DOCUMENTATION

Full documentation available at [GitHub Docs](https://github.com/s1t5/mail-archiver/tree/main/doc)
