# PAPERLESS-AI

[![GitHub commit activity](https://img.shields.io/github/commit-activity/t/clusterzx/paperless-ai)](https://github.com/clusterzx/paperless-ai)
[![Docker Pulls](https://img.shields.io/docker/pulls/clusterzx/paperless-ai)](https://hub.docker.com/r/clusterzx/paperless-ai)
[![GitHub Stars](https://img.shields.io/github/stars/clusterzx/paperless-ai)](https://github.com/clusterzx/paperless-ai/stargazers)
[![MIT License](https://img.shields.io/github/license/clusterzx/paperless-ai)](https://github.com/clusterzx/paperless-ai/blob/main/LICENSE)

An automated AI-powered document analyzer for Paperless-ngx with intelligent tagging, metadata extraction, and RAG-powered chat functionality.

---

## 📖 SYNOPSIS

Paperless-AI is a comprehensive automation tool that enhances your Paperless-ngx document management system with artificial intelligence capabilities. It automatically analyzes documents, extracts metadata, assigns tags and correspondents, and provides an interactive chat interface to query your document archive using natural language.

## ✨ MAIN FEATURES

- **🔄 Automated Document Processing**: Automatic scanning and AI-powered analysis of new documents
- **🏷️ Intelligent Tagging**: AI-generated tags, titles, correspondents, and document dates
- **🤖 Multiple AI Provider Support**: Compatible with OpenAI, Ollama, DeepSeek, OpenRouter, Perplexity, Together.ai, VLLM, LiteLLM, Fastchat, and Gemini
- **💬 RAG-Powered Chat**: Interactive document querying with Retrieval-Augmented Generation
- **🎯 Manual Mode**: Web interface for manual document analysis and review
- **🔗 Webhook Integration**: API endpoints for seamless Paperless-ngx workflow integration
- **⚙️ Advanced Customization**: Predefined processing rules, selective tag assignment, and custom tagging options
- **🎨 Custom AI Prompts**: Configurable system prompts for personalized document analysis
- **📊 Modern Web Interface**: Intuitive dashboard with statistics and document management

## 🌟 ADVANTAGES

- **Time Savings**: Eliminate manual document tagging and organization
- **Accuracy**: AI-powered analysis provides consistent and precise metadata
- **Flexibility**: Support for multiple AI providers and custom configurations
- **Searchability**: Enhanced document discovery through intelligent chat interface
- **Integration**: Seamless integration with existing Paperless-ngx installations
- **Scalability**: Handles large document archives efficiently
- **Customization**: Extensive configuration options for different workflows

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `clusterzx/paperless-ai:3.0.7`
- **Architecture**: Multi-architecture support (amd64, arm64)
- **Base**: Node.js 22-slim with Python 3 virtual environment
- **Security**: Runs with dropped capabilities and no-new-privileges
- **Health Check**: Built-in health monitoring on `/health` endpoint

## 📁 VOLUMES

- **Application Data**: `/app/data` - Contains SQLite database, configuration files, and RAG index data

## 🗃️ DEFAULT PARAMETERS

- **Port**: 3000 (configurable via PAPERLESS_AI_PORT)
- **AI Provider**: Ollama (supports multiple providers)
- **Scan Interval**: Every 30 minutes
- **RAG Service**: Enabled by default
- **Processing Mode**: Automated document processing enabled
- **User Permissions**: PUID/PGID support (1000/1000 by default)
- **Security**: Capabilities dropped, no-new-privileges enabled

## 📝 ENVIRONMENT

### Required Variables
- `PAPERLESS_AI_PAPERLESS_API_URL`: URL of your Paperless-ngx API
- `PAPERLESS_AI_API_TOKEN`: API token from Paperless-ngx
- `PAPERLESS_AI_USERNAME`: Paperless-ngx username
- `PAPERLESS_AI_PROVIDER`: AI service provider (openai, ollama, custom, etc.)

### AI Provider Configuration
- `PAPERLESS_AI_OPENAI_API_KEY`: OpenAI API key (if using OpenAI)
- `PAPERLESS_AI_OPENAI_MODEL`: OpenAI model name
- `PAPERLESS_AI_OLLAMA_API_URL`: Ollama instance URL
- `PAPERLESS_AI_OLLAMA_MODEL`: Ollama model name
- `PAPERLESS_AI_CUSTOM_API_KEY`: Custom provider API key
- `PAPERLESS_AI_CUSTOM_BASE_URL`: Custom provider base URL
- `PAPERLESS_AI_CUSTOM_MODEL`: Custom provider model name

### Processing Configuration
- `PAPERLESS_AI_SCAN_INTERVAL`: Cron expression for document scanning
- `PAPERLESS_AI_PROCESS_PREDEFINED_DOCUMENTS`: Enable predefined document processing
- `PAPERLESS_AI_TAGS`: Tags for predefined processing
- `PAPERLESS_AI_ADD_AI_PROCESSED_TAG`: Add tag to AI-processed documents
- `PAPERLESS_AI_USE_EXISTING_DATA`: Use existing Paperless data in prompts
- `PAPERLESS_AI_RAG_SERVICE_ENABLED`: Enable RAG chat functionality

### Advanced Configuration
- `PAPERLESS_AI_API_KEY`: API key for webhook access (auto-generated if empty)
- `PAPERLESS_AI_SYSTEM_PROMPT`: Custom AI system prompt for document analysis
- `PAPERLESS_AI_PORT`: Application port (default: 3000)
- `PUID`/`PGID`: User/Group IDs for file permissions (default: 1000/1000)

## ⚠️ IMPORTANT

1. **Initial Setup**: After first installation, restart the container to ensure proper initialization of all services and RAG index building
2. **API Token**: Obtain your Paperless-ngx API token from Settings > API in your Paperless-ngx interface
3. **AI Provider**: Configure at least one AI provider (OpenAI, Ollama, or custom) for document analysis
4. **Webhook Integration**: Use the generated API key to set up workflows in Paperless-ngx for automatic document processing
5. **Custom Prompts**: Customize the system prompt to tailor AI analysis to your specific document types and requirements
6. **File Permissions**: PUID/PGID are supported for proper file ownership in Docker environments
7. **Resource Requirements**: RAG functionality requires additional memory for document indexing
8. **Network Access**: Ensure the container can access your Paperless-ngx instance and AI provider APIs
9. **Backup**: Regular backups of the `/app/data` volume are recommended to preserve configurations and RAG index

## 💾 SOURCE

- **GitHub Repository**: https://github.com/clusterzx/paperless-ai
- **Docker Hub**: https://hub.docker.com/r/clusterzx/paperless-ai
- **Documentation**: https://clusterzx.github.io/paperless-ai/
- **Discord Community**: https://discord.gg/AvNekAfK38

## ❤️ PROVIDED WITH LOVE

This application is maintained by clusterzx and the open-source community. It provides seamless AI integration for Paperless-ngx users, enabling intelligent document management with minimal configuration. Support the project through GitHub Stars, contributions, or sponsorship on Patreon, PayPal, BuyMeACoffee, or Ko-Fi.
