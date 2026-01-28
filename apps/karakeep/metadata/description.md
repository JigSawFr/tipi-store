# Karakeep

![GitHub Stars](https://img.shields.io/github/stars/karakeep-app/karakeep?style=flat-square&logo=github)
![Docker Pulls](https://img.shields.io/badge/ghcr.io-karakeep--app%2Fkarakeep-blue?style=flat-square&logo=docker)
![License](https://img.shields.io/github/license/karakeep-app/karakeep?style=flat-square)

## SYNOPSIS

**Karakeep** (previously Hoarder) is a self-hostable bookmark-everything app with AI-powered automatic tagging and full text search. Save links, notes, images and PDFs in one place.

## FEATURES

- 🔗 **Bookmark Everything** - Save links, notes, images and PDFs
- ⬇️ **Automatic Fetching** - Auto-fetch titles, descriptions and images
- 📋 **Lists & Collaboration** - Organize bookmarks into lists and collaborate with others
- 🔎 **Full Text Search** - Meilisearch-powered search across all content
- ✨ **AI Tagging & Summary** - Automatic tagging using OpenAI or local Ollama models
- 🤖 **Rule Engine** - Customized bookmark management automation
- 🎆 **OCR** - Extract text from images with Tesseract
- 🔖 **Browser Extensions** - Chrome and Firefox extensions for quick saving
- 📱 **Mobile Apps** - iOS and Android apps available
- 📰 **RSS Feed Hoarding** - Auto-import from RSS feeds
- 🗄️ **Full Page Archive** - Protect against link rot with monolith
- ▶️ **Video Archiving** - Download videos with yt-dlp
- 🖍️ **Highlights** - Mark and store highlights from content
- 🔐 **SSO Support** - OAuth/OIDC authentication

## ENVIRONMENT

This deployment includes:

- **Karakeep** - Main application (all-in-one image)
- **Meilisearch** - Full text search engine
- **Chrome** - Headless browser for page crawling and screenshots

### Configuration Options

| Setting | Description |
|---------|-------------|
| **OpenAI API Key** | Enable AI tagging with OpenAI models |
| **Ollama Base URL** | Use local Ollama for AI inference |
| **Inference Language** | Language for AI-generated tags (e.g., french, english) |
| **Inference Context Length** | Max tokens for AI (higher = better quality, more cost) |
| **Auto Summarization** | Enable automatic AI summaries |
| **OCR Languages** | Tesseract languages for image text extraction |
| **Max Asset Size** | Maximum upload size in MB |
| **Disable Signups** | Lock registrations after setup |
| **Video Download** | Enable yt-dlp video archiving |
| **Full Page Archive** | Store complete page copies with monolith |

### Data Storage

All data is stored in `${APP_DATA_DIR}/data/`:
- `karakeep/` - SQLite database and assets
- `meilisearch/` - Search index data

## LINKS

- 📚 [Documentation](https://docs.karakeep.app/)
- 🐙 [GitHub Repository](https://github.com/karakeep-app/karakeep)
- 🌐 [Official Website](https://karakeep.app/)
- 💬 [Discord Community](https://discord.gg/NrgeYywsFh)
- 🧪 [Demo](https://try.karakeep.app/) (demo@karakeep.app / demodemo)
