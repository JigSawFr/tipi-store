# 🤖 Instructions Claude pour tipi-store

Bienvenue! Ce guide vous permet d'ajouter des applications au tipi-store sans rien oublier.

## 🎯 Vue d'ensemble

**tipi-store** est un AppStore personnalisé pour Runtipi.io avec 35+ applications auto-hébergées. Chaque app nécessite 3 fichiers minimum et suit des standards stricts.

## 📚 Ressources principales

Pour des instructions détaillées, consultez:
- **`.github/prompts/new-app.prompt.md`** - Guide complet pour ajouter une app (34KB, 90+ points de vérification)
- **`.github/prompts/commit-app.prompt.md`** - Workflow Git et standards de commit
- **`.github/prompts/audit-apps.prompt.md`** - Vérification qualité

## ⚡ Quick Start: Ajouter une nouvelle app

### Étape 1: Utiliser le slash command
```
/add-app
```
Ceci lancera le processus guidé d'ajout d'application.

### Étape 2: Structure requise

Chaque app nécessite cette structure exacte:
```
apps/[app-name]/
├── config.json                    # Configuration Tipi (metadata + form fields)
├── docker-compose.json            # Configuration Docker (format Runtipi v2)
└── metadata/
    ├── description.md             # Documentation standardisée
    └── logo.jpg                   # Logo officiel (< 100KB)
```

## 🔑 Points critiques à ne JAMAIS oublier

### ✅ Avant de commencer
1. **Vérifier l'image Docker**: Utiliser `docker manifest inspect [image:tag]`
2. **Préférer ghcr.io** (GitHub Container Registry) à Docker Hub
3. **Lire la doc officielle** ET examiner `docker-compose.yml` + `.env.example` originaux

### ✅ Fichier config.json
- **Ordre des propriétés**: Suivre strictement le schema v2 (voir checklist)
- **`tipi_version: 1`** pour les nouvelles apps
- **Tous les `env_variable`** doivent être préfixés: `APPNAME_*` (ex: `PAPERLESS_API_KEY`)
- **`short_desc`**: Maximum 4-5 mots (ex: "AI document analyzer")
- **Chaque `form_field`** DOIT avoir un `hint`
- **Types natifs**: `true`/`false` pour boolean, `8` pour number (PAS de strings)
- **Timestamps**: Utiliser https://currentmillis.com
- **uid/gid**: Ajouter SEULEMENT si PUID/PGID supporté par l'image

### ✅ Fichier docker-compose.json
- **Format array**: `"services": [...]` (PAS d'objet)
- **Service principal**: `"isMain": true` + `"internalPort": 8080`
- **Variables**: Syntaxe `"${VARIABLE}"` (PAS `"{{VARIABLE}}"`)
- **Version exacte**: Doit matcher config.json (ex: si config = `"1.1.3"`, image = `vendor/app:v1.1.3`)
- **PUID/PGID**: Valeurs hardcodées `"1000"` si uid/gid dans config.json

### ✅ Fichier description.md
- **Format standardisé**: Badges GitHub + sections obligatoires (voir template)
- **Sections**: SYNOPSIS, MAIN FEATURES, DOCKER IMAGE DETAILS, VOLUMES, ENVIRONMENT, etc.
- **Signature**: Toujours terminer par "❤️ PROVIDED WITH LOVE by JigSawFr"

### ✅ Logo
**Ordre de priorité**:
1. Vérifier runtipi-appstore: `https://github.com/runtipi/runtipi-appstore/tree/master/apps/[app-name]/metadata/`
2. Si existe: `curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"`
3. Sinon: télécharger depuis la source officielle

### ✅ Mise à jour des README (SOUVENT OUBLIÉ!)
1. **`/README.md`**: Ajouter l'app au tableau + incrémenter le compteur (ex: 35 → 36)
2. **`/apps/README.md`**: Ajouter à la section catégorie + incrémenter "Total Applications"

## 🔧 Propriétés avancées Docker (quand nécessaire)

Runtipi supporte 40+ propriétés Docker via ServiceBuilder:

### Sécurité
```json
"capAdd": ["SYS_ADMIN"],              // Capacités Linux
"capDrop": ["ALL"],                    // Retirer capacités
"securityOpt": ["no-new-privileges:true"],
"devices": ["/dev/fuse:/dev/fuse"]    // Accès matériel
```

### Réseau
```json
"networkMode": "host",
"extraHosts": ["host.docker.internal:host-gateway"],
"dns": ["1.1.1.1", "8.8.8.8"]
```

### Ressources
```json
"ulimits": {"nofile": {"soft": 1024, "hard": 2048}},
"shmSize": "2gb",
"sysctls": {"net.core.somaxconn": "1024"}
```

## 📋 Checklist minimale (AVANT de commit)

### Config.json
- [ ] `$schema` présent en première position
- [ ] Ordre des propriétés respecté (schema v2)
- [ ] `tipi_version: 1` pour nouvelle app
- [ ] Tous les `env_variable` préfixés avec `APPNAME_`
- [ ] Chaque `form_field` a un `hint`
- [ ] `short_desc` 4-5 mots max
- [ ] Types natifs (boolean, number, pas strings)
- [ ] Timestamps actuels (currentmillis.com)
- [ ] `uid/gid` SEULEMENT si PUID/PGID supporté

### Docker-compose.json
- [ ] Format array: `"services": [...]`
- [ ] Service principal: `"isMain": true`
- [ ] Port: `"internalPort": 8080` (pas `addPorts`)
- [ ] Variables: `"${VARIABLE}"` (pas `{{}}`)
- [ ] Version exacte matching config.json
- [ ] Tag Docker vérifié avec `docker manifest inspect`
- [ ] PUID/PGID hardcodés `"1000"` si applicable

### Metadata
- [ ] `description.md` suit format standardisé
- [ ] Logo téléchargé (< 100KB recommandé)
- [ ] Logo existe et est valide

### README
- [ ] `/README.md` mis à jour (tableau + compteur)
- [ ] `/apps/README.md` mis à jour (catégorie + compteur)

### Validation
- [ ] VS Code: Pas d'erreur de schema
- [ ] JSON syntaxe valide
- [ ] Image Docker existe sur registry

## 🔄 Workflow Git

### Nouvelle app
```bash
# 1. Créer branche feature
git checkout -b feat/add-[app-name]

# 2. Faire tous les changements
# 3. Avant commit:
#    - tipi_version = 1
#    - updated_at = timestamp actuel

# 4. Commit
git add apps/[app-name]/ README.md apps/README.md
git commit -m "🎉 Added: [app-name] application to tipi-store"

# 5. Push et PR
git push -u origin feat/add-[app-name]
```

### Modification d'app existante
```bash
# 1. Faire les changements
# 2. AVANT commit: incrémenter tipi_version (+1)
# 3. Commits atomiques par scope

# Exemple:
git add apps/[app]/docker-compose.json
git commit -m "🔧 Fixed: correct Docker image tag for [app]"

git add apps/[app]/config.json
git commit -m "🔧 Fixed: increment tipi_version for [app] changes"
```

## 🎨 Standards de commit

### Format
```
[Gitmoji] [Category]: [description] for [app-name]
```

### Gitmojis principaux
- 🎉 `Added` - Nouvelle app ou fonctionnalité majeure
- ✨ `Added` - Nouvelle fonctionnalité
- 🔧 `Fixed` - Corrections, bugfix
- 🔄 `Changed` - Améliorations, migrations
- 📚 `Docs` - Documentation
- 🔒 `Security` - Sécurité

### Exemples
```bash
🎉 Added: paperless-ai application to tipi-store
✨ Added: webhook configuration for sonarr
🔧 Fixed: remove unsupported PUID/PGID from beszel config
🔄 Changed: prefix all environment variables with SONARR_
📚 Docs: update readarr environment variables section
```

## 🚀 Catégories valides

Choisir parmi:
- `network` - Outils réseau, DNS, VPN
- `media` - Serveurs média, streaming
- `development` - Outils dev, IDEs
- `automation` - Home automation, IoT
- `social` - Communication, chat
- `utilities` - Outils généraux
- `photography` - Photos, galeries
- `security` - Sécurité, monitoring
- `featured` - Apps recommandées
- `books` - E-books, bibliothèques
- `data` - Bases de données, analytics
- `music` - Serveurs musique
- `finance` - Finance, budgeting
- `gaming` - Gaming servers
- `ai` - IA, machine learning

## 💡 Patterns courants

### Variables avec fallback
```json
"APP_URL": "${APPNAME_APP_URL:-${APP_PROTOCOL}://${APP_DOMAIN}}"
```

### Mot de passe aléatoire sécurisé
```json
{
  "type": "random",
  "label": "Database Password",
  "encoding": "hex",
  "env_variable": "APPNAME_DB_PASSWORD"
}
```

### Boolean avec valeur par défaut
```json
{
  "type": "boolean",
  "label": "Trust Proxy",
  "default": true,
  "env_variable": "APPNAME_TRUST_PROXY"
}
```

## 🛠️ Validation VS Code

Assurez-vous que `.vscode/settings.json` contient:
```json
{
  "json.schemas": [
    {
      "fileMatch": ["**/apps/*/config.json"],
      "url": "https://schemas.runtipi.io/v2/app-info.json"
    },
    {
      "fileMatch": ["**/apps/*/docker-compose.json"],
      "url": "https://schemas.runtipi.io/v2/dynamic-compose.json"
    }
  ]
}
```

## 📖 Exemples de référence

### Apps simples (bonne base)
- `beszel` - Configuration minimale
- `homebox` - App standard

### Apps complexes (pour référence avancée)
- `paperless-ai` - Nombreux form_fields, configuration avancée
- `paperless-ngx` - 400 lignes, très complète

## ⚠️ Erreurs fréquentes à éviter

1. ❌ Oublier de mettre à jour les README
2. ❌ Ne pas préfixer les variables avec APPNAME_
3. ❌ Oublier d'incrémenter `tipi_version` lors de modifications
4. ❌ Version différente entre config.json et docker-compose.json
5. ❌ Utiliser `{{VARIABLE}}` au lieu de `${VARIABLE}`
6. ❌ Ajouter uid/gid sans vérifier le support PUID/PGID
7. ❌ `short_desc` trop long (> 5 mots)
8. ❌ Oublier les `hint` dans les form_fields
9. ❌ Utiliser des strings pour boolean/number (`"true"` au lieu de `true`)
10. ❌ Ne pas vérifier que le tag Docker existe

## 🎯 Commandes utiles

### Vérifier image Docker
```bash
docker manifest inspect ghcr.io/owner/app:tag
```

### Valider JSON
```bash
cat apps/[app]/config.json | jq .
cat apps/[app]/docker-compose.json | jq .
```

### Télécharger logo depuis runtipi-appstore
```bash
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg"
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app-name]/metadata/logo.jpg" -o "apps/[app-name]/metadata/logo.jpg"
```

### Obtenir timestamp actuel
```bash
date +%s%3N  # Linux/Mac
# Ou visiter: https://currentmillis.com
```

---

## 🚀 Pour commencer

Utilisez le slash command pour un processus guidé:
```
/add-app
```

Ou consultez les guides détaillés:
- `.github/prompts/new-app.prompt.md` - Guide complet
- `.github/prompts/commit-app.prompt.md` - Standards Git
- `.github/prompts/audit-apps.prompt.md` - Vérification qualité

---

**Bonne chance!** 🎉
