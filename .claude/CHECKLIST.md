# ✅ Checklist Rapide - Ajout d'App

Cette checklist vous garantit de ne rien oublier lors de l'ajout d'une application.

---

## 📋 Phase 1: RECHERCHE

### Docker Image
- [ ] Image vérifiée avec `docker manifest inspect [image:tag]`
- [ ] Préféré ghcr.io à Docker Hub (si disponible)
- [ ] Tag exact noté (avec ou sans préfixe 'v')
- [ ] Version propre (sans build number: `1.1.3` pas `1.1.3-ls382`)

### Documentation Officielle
- [ ] README.md lu en entier
- [ ] docker-compose.yml examiné (toutes les variables)
- [ ] .env.example examiné (liste complète variables)
- [ ] Wiki/docs consulté (webhooks, API, fonctionnalités)

### PUID/PGID
- [ ] Support vérifié dans docker-compose.yml original
- [ ] Décision: ajouter uid/gid ou non (SEULEMENT si supporté)

### Variables
- [ ] Liste complète des variables configurables
- [ ] Plan de prefixe: `APPNAME_*` pour TOUTES les variables

---

## 📋 Phase 2: CONFIG.JSON

### Structure Générale
- [ ] `$schema` en première position
- [ ] Ordre des propriétés schema v2 respecté (voir liste complète)
- [ ] `tipi_version: 1` (nouvelle app)
- [ ] `"version"` exacte matching Docker image
- [ ] Timestamps actuels de https://currentmillis.com

### Short Description
- [ ] Maximum 4-5 mots
- [ ] Focus sur fonction principale
- [ ] Pas de marketing ou jargon
- [ ] Exemples: "AI document analyzer", "Media streaming server"

### Form Fields
- [ ] TOUS les `env_variable` préfixés: `APPNAME_*`
- [ ] CHAQUE field a un `hint`
- [ ] Types natifs: `true` pas `"true"`, `8` pas `"8"`
- [ ] Passwords: `"type": "random"` avec `"encoding": "hex"`
- [ ] Placeholders ajoutés pour meilleure UX
- [ ] Validation min/max pour numbers

### UID/GID (optionnel)
- [ ] Ajouté SEULEMENT si PUID/PGID supporté
- [ ] Valeurs: `"uid": 1000, "gid": 1000`
- [ ] Position: après supported_architectures

### Ordre Propriétés Schema v2
```
1.  $schema
2.  id
3.  available
4.  port
5.  name
6.  description
7.  version
8.  tipi_version
9.  short_desc
10. author
11. source
12. website
13. categories
14. url_suffix (optionnel)
15. form_fields
16. exposable
17. no_gui (optionnel)
18. supported_architectures
19. uid (optionnel)
20. gid (optionnel)
21. dynamic_config
22. min_tipi_version
23. created_at
24. updated_at
```

---

## 📋 Phase 3: DOCKER-COMPOSE.JSON

### Structure
- [ ] Format array: `"services": [...]` (PAS objet)
- [ ] `$schema` présent
- [ ] `"schemaVersion": 2`

### Service Principal
- [ ] `"isMain": true`
- [ ] `"internalPort": 8080` (PAS addPorts)
- [ ] `"name"` correspond à l'app

### Variables d'Environnement
- [ ] Syntaxe: `"${VARIABLE}"` (PAS `{{VARIABLE}}`)
- [ ] Variables Runtipi utilisées: `${TZ}`, `${APP_PROTOCOL}`, `${APP_DOMAIN}`
- [ ] Fallbacks: `"${VAR:-${DEFAULT}}"`
- [ ] PUID/PGID hardcodés: `"1000"` (si uid/gid dans config.json)

### Image et Version
- [ ] Version EXACTE matching config.json
- [ ] Format: `ghcr.io/owner/app:VERSION` ou `owner/app:VERSION`
- [ ] Tag vérifié existe sur registry

### Volumes
- [ ] Pattern simple: `${APP_DATA_DIR}/data`
- [ ] Pattern multiple: `${APP_DATA_DIR}/data/<folder>`

### Health Check (si applicable)
- [ ] Test approprié (curl, wget, script)
- [ ] Interval raisonnable (30s)
- [ ] Timeout défini
- [ ] Retries défini

### Propriétés Avancées (si nécessaire)
- [ ] Security: `capAdd`, `securityOpt`, `devices`
- [ ] Network: `networkMode`, `extraHosts`, `dns`
- [ ] Resources: `ulimits`, `shmSize`, `sysctls`
- [ ] Process: `user`, `workingDir`, `entrypoint`

---

## 📋 Phase 4: METADATA

### description.md
- [ ] Format standardisé suivi
- [ ] Badges GitHub ajoutés (source + issues)
- [ ] Section SYNOPSIS présente
- [ ] Section MAIN FEATURES présente
- [ ] Section DOCKER IMAGE DETAILS présente
- [ ] Section VOLUMES (si applicable)
- [ ] Section ENVIRONMENT avec tableau
- [ ] Signature finale: "❤️ PROVIDED WITH LOVE by JigSawFr"

### logo.jpg
- [ ] Vérifié dans runtipi-appstore en premier
- [ ] Téléchargé avec curl (si existe)
- [ ] Sinon: téléchargé depuis source officielle
- [ ] Taille < 100KB (recommandé)
- [ ] Format: JPG ou PNG
- [ ] Fichier existe et est valide

---

## 📋 Phase 5: README (CRITIQUE - SOUVENT OUBLIÉ!)

### /README.md
- [ ] App ajoutée au tableau (ordre alphabétique)
- [ ] Compteur incrémenté (ex: 35 → 36)
- [ ] Description correcte
- [ ] Catégorie correcte
- [ ] Lien correct vers metadata/

### /apps/README.md
- [ ] App ajoutée à la section catégorie appropriée
- [ ] Compteur "Total Applications" incrémenté
- [ ] Format cohérent avec apps existantes

---

## 📋 Phase 6: VALIDATION

### JSON Syntax
- [ ] `cat apps/[app]/config.json | jq .` sans erreur
- [ ] `cat apps/[app]/docker-compose.json | jq .` sans erreur

### Schema Validation (VS Code)
- [ ] config.json: Aucune erreur schema
- [ ] docker-compose.json: Aucune erreur schema
- [ ] Types natifs utilisés (pas strings pour boolean/number)

### Docker Verification
- [ ] `docker manifest inspect [image:tag]` réussit
- [ ] Tag existe sur registry
- [ ] Version exacte matching config.json

### File Structure
- [ ] apps/[app-name]/config.json existe
- [ ] apps/[app-name]/docker-compose.json existe
- [ ] apps/[app-name]/metadata/description.md existe
- [ ] apps/[app-name]/metadata/logo.jpg existe

---

## 📋 Phase 7: GIT WORKFLOW

### Branch Creation
- [ ] Branche créée: `git checkout -b feat/add-[app-name]`
- [ ] Format: `feat/add-[nom-app]`

### Staging
- [ ] `apps/[app-name]/` staged
- [ ] `README.md` staged
- [ ] `apps/README.md` staged
- [ ] Rien d'autre staged (vérifier avec `git status`)

### Commit
- [ ] Message: `🎉 Added: [app-name] application to tipi-store`
- [ ] Gitmoji correct
- [ ] Description claire

### Push
- [ ] `git push -u origin feat/add-[app-name]`
- [ ] Branche remote créée

### Pull Request
- [ ] PR créé sur GitHub
- [ ] Description complète
- [ ] Checklist attachée (si applicable)

---

## 📋 Validation Finale AVANT Commit

### Config.json
- [ ] $schema présent
- [ ] Ordre propriétés respecté
- [ ] tipi_version = 1
- [ ] ALL env_variable préfixés APPNAME_
- [ ] Tous form_fields ont hint
- [ ] short_desc 4-5 mots max
- [ ] Types natifs (boolean, number)
- [ ] Timestamps actuels
- [ ] uid/gid SEULEMENT si PUID/PGID

### Docker-compose.json
- [ ] Format array
- [ ] isMain: true
- [ ] internalPort (pas addPorts)
- [ ] Variables ${} syntax
- [ ] Version matching config.json
- [ ] PUID/PGID hardcodés "1000"

### Metadata
- [ ] description.md format standard
- [ ] Logo < 100KB
- [ ] Logo existe et valide

### README
- [ ] /README.md: tableau + compteur
- [ ] /apps/README.md: catégorie + compteur

### Validation Technique
- [ ] VS Code: 0 erreur schema
- [ ] JSON syntax valide
- [ ] Docker tag existe (manifest inspect)

---

## ⚠️ Erreurs Fréquentes à Éviter

### Top 10 Erreurs
1. ❌ Oublier de mettre à jour les README
2. ❌ Ne pas préfixer les variables avec APPNAME_
3. ❌ Oublier les `hint` dans form_fields
4. ❌ Utiliser strings pour boolean/number (`"true"` au lieu de `true`)
5. ❌ Version différente entre config.json et docker-compose.json
6. ❌ Syntaxe `{{VARIABLE}}` au lieu de `${VARIABLE}`
7. ❌ Ajouter uid/gid sans vérifier PUID/PGID
8. ❌ short_desc trop long (> 5 mots)
9. ❌ Ne pas vérifier que le tag Docker existe
10. ❌ Oublier la signature dans description.md

---

## 🚀 Quick Commands

### Validation
```bash
# Valider JSON
cat apps/[app]/config.json | jq .
cat apps/[app]/docker-compose.json | jq .

# Vérifier image Docker
docker manifest inspect [image:tag]

# Vérifier logo runtipi-appstore
curl -I "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg"

# Télécharger logo
curl -L "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/[app]/metadata/logo.jpg" -o "apps/[app]/metadata/logo.jpg"

# Timestamp actuel
date +%s%3N
# Ou: https://currentmillis.com
```

### Git
```bash
# Créer branche
git checkout -b feat/add-[app-name]

# Vérifier status
git status

# Stage files
git add apps/[app-name]/ README.md apps/README.md

# Commit
git commit -m "🎉 Added: [app-name] application to tipi-store"

# Push
git push -u origin feat/add-[app-name]
```

---

## ✅ Résumé: Checklist Minimale

**Avant de commit, ces 15 points DOIVENT être vérifiés:**

1. ✅ Docker tag existe (manifest inspect)
2. ✅ config.json: ordre propriétés schema v2
3. ✅ config.json: tipi_version = 1
4. ✅ config.json: ALL variables préfixées APPNAME_
5. ✅ config.json: tous form_fields ont hint
6. ✅ config.json: short_desc ≤ 5 mots
7. ✅ config.json: types natifs (pas strings)
8. ✅ docker-compose: format array
9. ✅ docker-compose: isMain + internalPort
10. ✅ docker-compose: version matching config
11. ✅ docker-compose: ${VARIABLE} syntax
12. ✅ description.md: format standard + signature
13. ✅ logo.jpg: existe et < 100KB
14. ✅ README.md: table + compteur updated
15. ✅ apps/README.md: catégorie + compteur updated

**Si tous les points sont ✅, vous êtes prêt à commit!** 🎉

---

Pour un processus guidé, utilisez:
```
/add-app
```
