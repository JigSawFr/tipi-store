# Docling Serve

![Version](https://img.shields.io/badge/version-1.9.0-blue)
![Docker](https://img.shields.io/badge/docker-ghcr.io%2Fdocling--project%2Fdocling--serve--cpu-blue)
![Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm64-green)

## SYNOPSIS

**Docling Serve** runs [Docling](https://github.com/docling-project/docling) as an API service for AI-powered document processing and conversion. It simplifies document parsing across diverse formats and provides seamless integrations with the generative AI ecosystem.

Part of the LF AI & Data Foundation, Docling was originally developed by the AI for knowledge team at IBM Research Zurich.

## FEATURES

### Document Processing
- **Multiple Formats**: PDF, DOCX, PPTX, XLSX, HTML, images (PNG, TIFF, JPEG), WAV, MP3, VTT, and more
- **Advanced PDF Understanding**: Page layout, reading order, table structure, code, formulas, image classification
- **OCR Support**: Extensive OCR for scanned PDFs and images
- **Audio Support**: Automatic Speech Recognition (ASR) models

### Export Options
- **Markdown**: Clean, readable output
- **HTML**: Web-ready format
- **DocTags**: Structured XML-like format
- **JSON**: Lossless document representation

### AI Integration
- **LangChain**: Native integration
- **LlamaIndex**: Document loading support
- **Crew AI**: Agent workflows
- **Haystack**: Search pipelines
- **MCP Server**: Connect to any agent

### Visual Language Models
- **GraniteDocling**: IBM's Vision Language Model (258M parameters)
- Local execution for sensitive data

## API ENDPOINTS

- **API**: `http://localhost:5001`
- **Documentation**: `http://localhost:5001/docs`
- **UI Playground**: `http://localhost:5001/ui`

## LINKS

- [Documentation](https://docling-project.github.io/docling/)
- [GitHub - Docling](https://github.com/docling-project/docling)
- [GitHub - Docling Serve](https://github.com/docling-project/docling-serve)
- [Technical Report](https://arxiv.org/abs/2408.09869)
