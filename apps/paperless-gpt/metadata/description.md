# PAPERLESS-GPT

[![GitHub commit activity](https://img.shields.io/github/commit-activity/t/icereed/paperless-gpt)](https://github.com/icereed/paperless-gpt)
[![Docker Pulls](https://img.shields.io/docker/pulls/icereed/paperless-gpt)](https://hub.docker.com/r/icereed/paperless-gpt)
[![GitHub Stars](https://img.shields.io/github/stars/icereed/paperless-gpt)](https://github.com/icereed/paperless-gpt/stargazers)
[![MIT License](https://img.shields.io/github/license/icereed/paperless-gpt)](https://github.com/icereed/paperless-gpt/blob/main/LICENSE)

Seamlessly pairs with Paperless-ngx to generate AI-powered document titles, tags, correspondents, and custom fields while supercharging OCR with LLMs.

---

## SYNOPSIS

Paperless-GPT enhances your Paperless-ngx document management system by using large language models (LLMs) to automatically generate meaningful titles, assign tags, set correspondents, and fill custom fields for your documents. It also provides LLM-enhanced OCR to produce searchable PDFs with embedded text layers, improving document discoverability and organization.

## MAIN FEATURES

- **AI-Powered Metadata**: Automatically generate titles, tags, correspondents, and custom field values using LLMs
- **LLM-Enhanced OCR**: Superior text extraction using vision models with searchable PDF output
- **Multiple AI Providers**: Support for OpenAI, Ollama, Google AI, Mistral, and Anthropic
- **Local LLM Support**: Use Ollama for fully local, private document processing
- **Web UI**: Built-in interface for manual review, batch processing, and prompt customization
- **Settings UI**: Configure prompts and processing options directly from the web interface
- **Searchable PDFs**: Generate PDFs with embedded text layers for full-text search
- **Customizable Prompts**: Tailor AI behavior through the Settings interface

## ADVANTAGES

- **Privacy**: Supports local LLMs via Ollama for fully offline processing
- **Flexibility**: Works with multiple AI providers and models
- **Accuracy**: Vision-based OCR produces better results than traditional OCR
- **Integration**: Seamless connection with existing Paperless-ngx installations
- **Ease of Use**: Web-based configuration and batch processing interface
- **Searchability**: Creates text-embedded PDFs for improved document search

## DOCKER IMAGE DETAILS

- **Image**: `ghcr.io/icereed/paperless-gpt:v0.25.0`
- **Architecture**: Multi-architecture support (amd64, arm64)
- **Security**: Runs with dropped capabilities and no-new-privileges
- **Health Check**: Built-in health monitoring on port 8080

## VOLUMES

- **Prompts**: `/app/prompts` - Persistent storage for custom prompt configurations

## DEFAULT PARAMETERS

- **Port**: 8080 (web UI and API)
- **LLM Provider**: OpenAI (supports Ollama, Google AI, Mistral, Anthropic)
- **LLM Model**: gpt-4o
- **OCR Provider**: LLM-based (supports Docling)
- **Language**: English
- **Token Limit**: Unlimited (0)
- **Security**: Capabilities dropped, no-new-privileges enabled

## ENVIRONMENT

### Required Variables
- `PAPERLESSGPT_PAPERLESS_BASE_URL`: Base URL of your Paperless-ngx instance
- `PAPERLESSGPT_PAPERLESS_API_TOKEN`: API token from Paperless-ngx
- `PAPERLESSGPT_LLM_PROVIDER`: AI provider (openai, ollama, googleai, anthropic)
- `PAPERLESSGPT_LLM_MODEL`: Model name for the selected provider

### AI Provider Configuration
- `PAPERLESSGPT_OPENAI_API_KEY`: OpenAI API key (if using OpenAI)
- `PAPERLESSGPT_OLLAMA_HOST`: Ollama instance URL (if using Ollama)
- `PAPERLESSGPT_GOOGLE_API_KEY`: Google AI API key (if using Google AI)
- `PAPERLESSGPT_ANTHROPIC_API_KEY`: Anthropic API key (if using Anthropic)

### OCR & Vision Configuration
- `PAPERLESSGPT_VISION_LLM_PROVIDER`: Vision provider for OCR processing
- `PAPERLESSGPT_VISION_LLM_MODEL`: Vision model name
- `PAPERLESSGPT_OCR_PROVIDER`: OCR engine (llm, docling)

### Advanced Configuration
- `PAPERLESSGPT_LLM_LANGUAGE`: Language for AI-generated content
- `PAPERLESSGPT_TOKEN_LIMIT`: Maximum tokens sent to the LLM (0 = unlimited)

## IMPORTANT

1. **Paperless-ngx Required**: This app requires a running Paperless-ngx instance to function
2. **API Token**: Obtain your API token from Paperless-ngx Settings > API Tokens
3. **AI Provider**: Configure at least one AI provider with valid credentials
4. **Ollama Local Setup**: For local AI processing, ensure your Ollama instance is accessible from the container
5. **Prompts Persistence**: Custom prompts are stored in the `/app/prompts` volume - back up regularly
6. **Network Access**: Ensure the container can reach your Paperless-ngx instance and AI provider APIs
7. **OCR Processing**: For vision-based OCR, configure both Vision LLM Provider and Vision LLM Model
8. **Web UI**: Access the Settings page to customize AI prompts and processing behavior

## SOURCE

- **GitHub Repository**: https://github.com/icereed/paperless-gpt
- **Docker Hub**: https://hub.docker.com/r/icereed/paperless-gpt
- **GHCR**: https://github.com/icereed/paperless-gpt/pkgs/container/paperless-gpt

## PROVIDED WITH LOVE

This application is maintained by icereed and the open-source community. It provides seamless AI-powered document enhancement for Paperless-ngx users, enabling intelligent title generation, tagging, and OCR with minimal configuration.
