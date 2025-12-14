# Open Archiver

![Version](https://img.shields.io/badge/version-0.4.0-blue)
![Docker](https://img.shields.io/badge/docker-logiclabshq%2Fopen--archiver-blue)
![Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm64-green)

## SYNOPSIS

**Open Archiver** is a secure, sovereign, and open-source platform for legally compliant email archiving. It provides a robust, self-hosted solution for archiving, storing, indexing, and searching emails from major platforms including Google Workspace (Gmail), Microsoft 365, PST files, and generic IMAP-enabled email inboxes.

Use Open Archiver to keep a permanent, tamper-proof record of your communication history, free from vendor lock-in.

## FEATURES

### Universal Ingestion
- **IMAP Connection**: Connect to any IMAP-enabled mailbox
- **Google Workspace**: Full integration with Gmail
- **Microsoft 365**: Complete Outlook/Exchange support
- **PST Files**: Import from Outlook archives
- **Mbox Files**: Standard mailbox format support
- **Zipped .eml Files**: Bulk import capabilities

### Security & Compliance
- **AES-256 Encryption at Rest**: All archived data is encrypted
- **File Integrity Verification**: SHA256 hashing for tamper detection
- **Deletion Protection**: Instance-wide deletion controls
- **Comprehensive Audit Trails**: Immutable logging of all activities
- **Retention Policies**: Automated data lifecycle management

### Search & Discovery
- **Full-Text Search**: Powered by Meilisearch for blazing fast results
- **Attachment Indexing**: Search within PDFs, DOCX, and more
- **Thread Discovery**: Automatic conversation grouping
- **eDiscovery Ready**: Legal hold capabilities (TBD)

### Storage Options
- **Local Storage**: Standard filesystem storage
- **S3-Compatible**: AWS S3, MinIO, and other compatible services
- **Deduplication**: Minimize storage costs
- **Compression**: Efficient data storage

## ENVIRONMENT

This deployment includes:
- **PostgreSQL 17**: Metadata and user database
- **Valkey (Redis-compatible)**: Job queue and caching
- **Meilisearch**: High-performance search engine

## DEFAULT CREDENTIALS

- **Admin Email**: Configure during first login
- **Admin Password**: Set via form field during installation

## LINKS

- [Documentation](https://docs.openarchiver.com)
- [Discord Community](https://discord.gg/MTtD7BhuTQ)
- [GitHub Repository](https://github.com/LogicLabs-OU/OpenArchiver)
- [Live Demo](https://demo.openarchiver.com)
