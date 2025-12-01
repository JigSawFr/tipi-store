# LUBELOG MCP

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/hargata/lubelog_mcp) [<img src="https://img.shields.io/github/issues/hargata/lubelog_mcp?color=7842f5">](https://github.com/hargata/lubelog_mcp/issues)

MCP (Model Context Protocol) Server for LubeLogger, enabling AI agents to interact with your vehicle maintenance tracker.

---

## 📖 SYNOPSIS
LubeLog MCP is a technical tool for experimentation and exploration into AI-enabled features in LubeLogger. It allows AI agents like Claude Desktop to interact with your LubeLogger instance through the MCP protocol.

---

## ⚠️ EXPERIMENTAL
AI and MCP are still evolving technologies. Implementations of this project are subject to break without prior notice.

---

## ✨ MAIN FEATURES
- 🚗 **Retrieve list of vehicles** - Get all vehicles from your LubeLogger instance
- ⛽ **Add Fuel Record** - Create fuel records from images of receipts
- 🔧 **Add Service/Repair/Upgrade records** - Log maintenance from invoices
- 📊 **Add Odometer record** - Record mileage from dashboard images
- 📈 **Get latest odometer reading** - Fetch current mileage for a vehicle
- ✅ **Check status** - Verify LubeLogger instance connectivity

---

## 📋 PREREQUISITES
- A running LubeLogger instance (you can install it from this app store!)
- An AI agent with MCP support (e.g., Claude Desktop)
- Node.js with npx (for the MCP client)

---

## 🐳 DOCKER IMAGE DETAILS
- **Based on [hargata/lubelog_mcp](https://github.com/hargata/lubelog_mcp)**
- Lightweight image for fast deployment
- Secure CI/CD, automatic updates
- Thanks to [hargata](https://github.com/hargata) for the original project

---

## 📝 ENVIRONMENT
| Variable | Required | Description |
| --- | --- | --- |
| `LUBELOG_INSTANCE` | Yes | URL where your LubeLogger is hosted (e.g., `http://lubelogger:8080`) |
| `LUBELOG_USER` | No | Username for LubeLogger authentication |
| `LUBELOG_PASS` | No | Password for LubeLogger authentication |

---

## ⚙️ CONFIGURATION

### In Tipi

1. **LubeLogger Instance URL**: The URL where your LubeLogger is hosted
   - If using Tipi's LubeLogger: `http://lubelogger:8080`
   - If using an external instance: `https://lubelog.yourdomain.com`

2. **Username/Password**: Only required if authentication is enabled on your LubeLogger instance

### In Claude Desktop (or other MCP client)

Add the following to your MCP configuration:

```json
{
  "mcpServers": {
    "lubelogger": {
      "command": "npx",
      "args": [
        "mcp-remote",
        "http://your-tipi-server:40150/api/mcp"
      ]
    }
  }
}
```

Replace `your-tipi-server` with your Tipi server's IP or hostname.

---

## 🎯 USAGE EXAMPLES
Once configured, you can ask your AI agent things like:

- "Show me all my vehicles in LubeLogger"
- "Add this fuel receipt to my Honda Civic" (with image)
- "What's the current mileage on my truck?"
- "Log this service invoice for my car"

---

## 💾 SOURCE
* [hargata/lubelog_mcp](https://github.com/hargata/lubelog_mcp)
* [LubeLogger Main Project](https://github.com/hargata/lubelog)
* [MCP Protocol Documentation](https://modelcontextprotocol.io/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
