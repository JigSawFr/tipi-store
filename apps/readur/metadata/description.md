# Readur

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/readur/readur) [<img src="https://img.shields.io/github/issues/readur/readur?color=7842f5">](https://github.com/readur/readur/issues)

A powerful and modern document management system with advanced OCR capabilities.

---

## 📖 SYNOPSIS

Readur is a modern document management system designed to help individuals and teams efficiently organize, process, and access their digital documents. Built with a high-performance Rust backend and a sleek React frontend, it combines powerful OCR capabilities with an intuitive user experience.

---

## ✨ MAIN FEATURES

- **🔐 Secure Authentication** - JWT-based auth with bcrypt password hashing + OIDC/SSO support
- **👥 User Management** - Role-based access control with Admin and User roles
- **📤 Smart File Upload** - Drag-and-drop for PDF, images, text files, and Office documents (DOCX, XLSX, DOC)
- **🔍 Advanced OCR** - Automatic text extraction using Tesseract with Office document parsing
- **🌍 Multi-Language OCR** - Process documents in multiple languages simultaneously
- **🔎 Powerful Search** - PostgreSQL full-text search with multiple modes (simple, phrase, fuzzy, boolean)
- **🔗 Multi-Source Sync** - WebDAV, Local Folders, and S3-compatible storage integration
- **🏷️ Labels & Organization** - Comprehensive tagging system with color-coding and hierarchical structure
- **👁️ Folder Monitoring** - Non-destructive file watching with intelligent sync scheduling
- **📊 Health Monitoring** - Proactive source validation and system health tracking
- **🔔 Notifications** - Real-time alerts for sync events, OCR completion, and system status
- **🔌 Swagger UI** - Built-in interactive API documentation
- **📊 Analytics Dashboard** - Document statistics and processing status overview

---

## 🚀 FIRST CONNECTION

On first startup, Readur generates a secure admin password if not configured:

1. Check container logs: `docker logs readur`
2. Look for the admin credentials block
3. **Save the password immediately** - it won't be shown again!

To reset admin password later: `readur reset-admin-password`

---

## 📝 ENVIRONMENT

| Variable | Required | Description |
| --- | --- | --- |
| `READUR_JWT_SECRET` | Yes | Secret key for JWT token signing (auto-generated) |
| `READUR_DB_PASSWORD` | Yes | PostgreSQL database password (auto-generated) |
| `READUR_ADMIN_USERNAME` | No | Admin username (default: admin) |
| `READUR_ADMIN_PASSWORD` | No | Admin password (auto-generated if not set) |
| `READUR_OCR_LANGUAGE` | No | Tesseract language codes (default: eng) |
| `READUR_CONCURRENT_OCR_JOBS` | No | Parallel OCR jobs (default: 4) |
| `READUR_MAX_FILE_SIZE_MB` | No | Max upload size in MB (default: 50) |
| `READUR_WATCH_INTERVAL_SECONDS` | No | Watch folder scan interval (default: 30) |
| `READUR_ALLOW_LOCAL_AUTH` | No | Enable local login (default: true) |

---

## 📁 VOLUMES

| Host folder | Container folder | Comment |
| --- | --- | --- |
| `${APP_DATA_DIR}/data/postgres` | `/var/lib/postgresql/data` | PostgreSQL database |
| `${APP_DATA_DIR}/data/uploads` | `/app/uploads` | Uploaded documents storage |
| `${APP_DATA_DIR}/data/watch` | `/app/watch` | Watch folder for auto-import |

---

## 🌍 MULTI-LANGUAGE OCR

Configure multiple OCR languages using the `+` separator:

- **English only**: `eng`
- **English + French**: `eng+fra`
- **English + German + Spanish**: `eng+fra+deu+spa`

Common language codes:
- `eng` - English
- `fra` - French
- `deu` - German
- `spa` - Spanish
- `ita` - Italian
- `por` - Portuguese
- `nld` - Dutch
- `rus` - Russian
- `chi_sim` - Chinese (Simplified)
- `jpn` - Japanese
- `kor` - Korean
- `ara` - Arabic

---

## 📋 SYSTEM REQUIREMENTS

**Minimum:**
- 2 CPU cores, 2GB RAM, 10GB storage

**Recommended for Production:**
- 4+ CPU cores, 4GB+ RAM, 50GB+ SSD

---

## ⚠️ IMPORTANT

- **Change default credentials immediately** after first login
- **Use HTTPS in production** - configure via Runtipi's expose feature
- The watch folder automatically imports documents placed in it
- PostgreSQL full-text search requires documents to be OCR processed first

---

## 💾 SOURCE

* [readur/readur](https://github.com/readur/readur)
* [Documentation](https://docs.readur.app/)

---

## ❤️ PROVIDED WITH LOVE

This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the [official GitHub repository](https://github.com/readur/readur/issues).
