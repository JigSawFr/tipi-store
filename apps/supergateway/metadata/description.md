# 🌐 Supergateway

[![GitHub](https://img.shields.io/badge/GitHub-supercorp--ai%2Fsupergateway-blue?logo=github)](https://github.com/supercorp-ai/supergateway)
[![Docker](https://img.shields.io/badge/Docker-ghcr.io%2Fsupercorp--ai%2Fsupergateway-blue?logo=docker)](https://github.com/supercorp-ai/supergateway/pkgs/container/supergateway)

---

## 📖 SYNOPSIS

**Supergateway** runs MCP (Model Context Protocol) stdio-based servers over SSE (Server-Sent Events), WebSockets (WS), or Streamable HTTP with one command. This is essential for remote access, debugging, or connecting to AI clients when your MCP server only supports stdio.

---

## ✨ MAIN FEATURES

- **stdio → SSE**: Expose local MCP stdio servers as SSE endpoints for remote access
- **stdio → WebSocket**: Expose MCP stdio servers as WS endpoints
- **stdio → Streamable HTTP**: Expose MCP stdio servers as HTTP endpoints (stateless/stateful)
- **SSE → stdio**: Connect to remote SSE MCP servers and expose locally
- **Streamable HTTP → stdio**: Connect to remote HTTP MCP servers and expose locally
- **CORS Support**: Configurable CORS with custom origins
- **Authentication**: OAuth2 Bearer token and custom headers support
- **Health Checks**: Built-in health check endpoints
- **Logging**: Configurable log levels (debug, info, none)

---

## 🚀 ADVANTAGES

| Feature | Description |
|---------|-------------|
| 🔌 **Protocol Bridge** | Convert between stdio, SSE, WS, and HTTP transports |
| 🌍 **Remote Access** | Access local MCP servers from anywhere |
| 🔐 **Secure** | Built-in authentication support |
| 🐳 **Docker Ready** | Official Docker images with uvx/deno variants |
| ⚡ **Lightweight** | Minimal overhead for protocol translation |

---

## 🎯 USE CASES

### Expose LubeLogger MCP via SSE

Connect your local LubeLogger MCP server to remote AI clients:

```
SUPERGATEWAY_SSE_URL=https://your-lubelog-mcp.example.com/sse
```

### Bridge to ChatGPT/Claude

Use Supergateway as a bridge to expose your MCP servers to AI assistants via Cloudflare Tunnel.

### Debug MCP Servers

Use the MCP Inspector with Supergateway for debugging:
```bash
npx @modelcontextprotocol/inspector
```

---

## ⚙️ ENVIRONMENT VARIABLES

| Variable | Description | Default |
|----------|-------------|---------|
| `SUPERGATEWAY_STDIO_CMD` | Command to run MCP server in stdio mode | - |
| `SUPERGATEWAY_SSE_URL` | Remote SSE MCP server URL | - |
| `SUPERGATEWAY_HTTP_URL` | Remote Streamable HTTP MCP server URL | - |
| `SUPERGATEWAY_OUTPUT_TRANSPORT` | Output transport: sse, ws, streamableHttp, stdio | `sse` |
| `SUPERGATEWAY_BASE_URL` | Base URL for SSE/WS clients | - |
| `SUPERGATEWAY_SSE_PATH` | SSE subscription path | `/sse` |
| `SUPERGATEWAY_MESSAGE_PATH` | Message path | `/message` |
| `SUPERGATEWAY_OAUTH2_BEARER` | OAuth2 Bearer token | - |
| `SUPERGATEWAY_HEADERS` | Custom headers (JSON object) | - |
| `SUPERGATEWAY_CORS` | Enable CORS | `true` |
| `SUPERGATEWAY_CORS_ORIGINS` | Allowed CORS origins (comma-separated) | All |
| `SUPERGATEWAY_HEALTH_ENDPOINT` | Health check endpoint path | `/healthz` |
| `SUPERGATEWAY_LOG_LEVEL` | Log level: debug, info, none | `info` |

---

## 📂 VOLUMES

| Container Path | Description |
|----------------|-------------|
| `/data` | Data directory for MCP servers |

---

## 🔗 ENDPOINTS

| Endpoint | Description |
|----------|-------------|
| `GET /sse` | SSE subscription endpoint |
| `POST /message` | Message endpoint |
| `GET /mcp` | Streamable HTTP endpoint |
| `GET /healthz` | Health check endpoint |

---

## 🔐 INTEGRATION WITH CLOUDFLARE TUNNEL

To expose Supergateway securely via Cloudflare Tunnel:

1. Deploy **cloudflared-web** from this store
2. Create a tunnel pointing to `http://supergateway:8000`
3. Secure with Cloudflare Access Service Token
4. Connect ChatGPT/Claude using the tunnel URL

---

## 📚 MORE INFO

- [GitHub Repository](https://github.com/supercorp-ai/supergateway)
- [Supermachine (Hosted MCPs)](https://supermachine.ai/)
- [MCP Protocol Specification](https://spec.modelcontextprotocol.io/)

---

## ⚠️ NOTES

- Choose ONE mode: either `SUPERGATEWAY_STDIO_CMD` for stdio→SSE or `SUPERGATEWAY_SSE_URL`/`SUPERGATEWAY_HTTP_URL` for remote→stdio
- For Python MCP servers, use the `uvx` image variant
- CORS is enabled by default for ease of use

---
