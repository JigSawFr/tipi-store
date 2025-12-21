# Norish

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/norish-recipes/norish) [<img src="https://img.shields.io/github/issues/norish-recipes/norish?color=7842f5">](https://github.com/norish-recipes/norish/issues) [<img src="https://img.shields.io/docker/pulls/norishapp/norish?color=2496ED&logo=docker">](https://hub.docker.com/r/norishapp/norish)

A realtime, self-hosted recipe app for families & friends.

---

## 📖 SYNOPSIS

Norish is a shared recipe app designed for families and friends to build one big recipe catalogue together. The name is derived from a dog named Nora + dish, which can also be pronounced as "Nourish". The app is fully realtime, allowing multiple users to sync recipes, grocery lists, and meal plans in real-time.

---

## ✨ MAIN FEATURES

- **Easy recipe import** via URL with AI fallback
- **Video recipe import** from YouTube Shorts, Instagram Reels, TikTok (requires OpenAI)
- **Image recipe import** from photos (requires OpenAI)
- **Nutritional information** calculation
- **Allergy warnings** with auto-detection
- **Unit conversion** between metric and US
- **Recurring groceries** with natural language processing
- **Real-time sync** of recipes, grocery lists, and meal plans
- **Households** for sharing with family and friends
- **CalDAV sync** with calendar providers
- **Mobile-first design** for use in the kitchen
- **Light & dark mode** support
- **SSO authentication** (OIDC/OAuth2, Google, GitHub)
- **Admin Settings UI** for server management
- **Permission policies** for recipe access control

---

## 🔧 FIRST-TIME SETUP

1. The first user to sign in becomes the **Server Owner** and **Server Admin** automatically
2. After first login, user registration is automatically disabled
3. All server settings can be managed via **Settings → Admin** tab

### Authentication Options

By default, password authentication is enabled. After first login, you can configure additional providers via the Admin UI:

- **OIDC** (Authentik, Keycloak, PocketID, etc.)
- **GitHub OAuth**
- **Google OAuth**

---

## 🤖 AI FEATURES (Optional)

AI features require an OpenAI API key, configurable in **Settings → Admin → AI & Processing**:

- Video recipe import with transcription
- Image recipe recognition
- Nutritional information calculation
- Allergy detection
- Unit conversion

---

## 📁 FOLDER STRUCTURE

| Container Path | Description |
|---------------|-------------|
| `/app/uploads` | Recipe images and uploaded files |

---

## 🔗 LINKS

- [GitHub Repository](https://github.com/norish-recipes/norish)
- [Docker Hub](https://hub.docker.com/r/norishapp/norish)
- [Demo Video](https://imgur.com/a/07VpBIc)
