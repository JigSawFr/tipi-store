# 📁 Documentation Claude pour tipi-store

Bienvenue dans le dossier d'instructions Claude! Ce dossier contient tout ce dont Claude a besoin pour ajouter des applications au tipi-store sans rien oublier.

## 📚 Fichiers Disponibles

### 🎯 [`instructions.md`](instructions.md) - Guide Principal
**Quand l'utiliser**: Référence rapide pour comprendre le projet et les standards

Le guide principal contenant:
- Vue d'ensemble du projet tipi-store
- Points critiques à ne JAMAIS oublier
- Patterns courants et exemples
- Erreurs fréquentes à éviter
- Commandes utiles
- Liens vers les guides détaillés

**🔗 Référence rapide**: Consulter ce fichier pour se rappeler des règles importantes.

---

### ✅ [`CHECKLIST.md`](CHECKLIST.md) - Checklist Complète
**Quand l'utiliser**: Avant de commit pour vérifier que rien n'a été oublié

Checklist exhaustive organisée en 7 phases:
1. **Phase 1: RECHERCHE** - Docker image, documentation, PUID/PGID
2. **Phase 2: CONFIG.JSON** - Structure, form fields, propriétés
3. **Phase 3: DOCKER-COMPOSE.JSON** - Services, variables, volumes
4. **Phase 4: METADATA** - description.md et logo
5. **Phase 5: README** - Mise à jour des deux README
6. **Phase 6: VALIDATION** - JSON, schema, Docker
7. **Phase 7: GIT WORKFLOW** - Branch, commit, push

**✅ Validation Finale**: 15 points critiques à vérifier avant commit

---

### 📋 [`TEMPLATES.md`](TEMPLATES.md) - Templates de Référence
**Quand l'utiliser**: Pour créer rapidement les fichiers nécessaires

Templates prêts à l'emploi pour:

#### config.json
- Template minimal (app simple)
- Template avec form fields
- Template avec PUID/PGID

#### docker-compose.json
- Service simple
- Avec health check
- Avec PUID/PGID
- Multi-service
- Sécurité avancée (FUSE)
- Network mode host
- Resource limits

#### description.md
- Format standardisé complet

#### Form Fields
- Exemples pour tous les types: text, password, email, number, boolean, random, url, fqdn, ip

#### Référence
- Variables Runtipi disponibles
- Catégories valides
- Exemples de short_desc
- Naming conventions

---

### 🚀 [`commands/add-app.md`](commands/add-app.md) - Slash Command /add-app
**Quand l'utiliser**: Pour ajouter une nouvelle application de manière guidée

Processus guidé en 7 étapes:
1. **GATHER INFORMATION** - Collecter nom et URL
2. **RESEARCH PHASE** - Analyser image Docker, docs, variables
3. **CREATE FILE STRUCTURE** - Créer tous les fichiers nécessaires
4. **UPDATE README FILES** - Mettre à jour les deux README
5. **VALIDATION** - Vérifier JSON, schema, Docker
6. **GIT WORKFLOW** - Branch, commit, push
7. **FINAL REVIEW** - Présenter le résumé

**✅ DO / ❌ DON'T**: Liste des bonnes pratiques et erreurs à éviter

**Usage**: Taper `/add-app` dans Claude Code pour lancer le processus guidé.

---

### 📝 [`commands/commit-app.md`](commands/commit-app.md) - Slash Command /commit-app
**Quand l'utiliser**: Pour committer les changements avec les bons messages

Workflow complet pour:
- **Nouvelle application**: Feature branch + commit formaté
- **Modification existante**: Commits atomiques par scope

**Standards de commit**:
- Format: `[Gitmoji] [Category]: [description] for [app-name]`
- Gitmojis par catégorie (Added, Fixed, Changed, Removed, Security, Docs)
- Exemples de messages par scénario

**Scénarios couverts**:
1. Docker image tag correction
2. Environment variable prefixing
3. Schema compliance
4. PUID/PGID removal

**CRITICAL**: Checklist pré-commit avec tipi_version et timestamp

**Usage**: Taper `/commit-app` dans Claude Code pour être guidé.

---

## 🎯 Workflow Recommandé

### Pour Ajouter une Nouvelle App

1. **Lancer le processus guidé**:
   ```
   /add-app
   ```

2. **Consulter les templates** si nécessaire:
   - Ouvrir [`TEMPLATES.md`](TEMPLATES.md)
   - Copier le template approprié
   - Adapter selon l'application

3. **Vérifier avec la checklist**:
   - Ouvrir [`CHECKLIST.md`](CHECKLIST.md)
   - Cocher chaque point
   - Vérifier la validation finale (15 points)

4. **Committer**:
   ```
   /commit-app
   ```

### Pour Modifier une App Existante

1. **Faire les modifications**

2. **Consulter les instructions**:
   - Ouvrir [`instructions.md`](instructions.md)
   - Section "Points critiques"

3. **Vérifier tipi_version**:
   - ⚠️ **TOUJOURS incrémenter** (+1)
   - ⚠️ **TOUJOURS mettre à jour** `updated_at`

4. **Committer**:
   ```
   /commit-app
   ```

---

## 🔍 Quick Reference

### Commandes Slash Disponibles

| Commande | Description | Quand l'utiliser |
|----------|-------------|------------------|
| `/add-app` | Ajouter une nouvelle app | Nouvelle application complète |
| `/commit-app` | Committer les changements | Prêt à commit |

### Fichiers à Consulter

| Besoin | Fichier | Section |
|--------|---------|---------|
| Comprendre le projet | `instructions.md` | Vue d'ensemble |
| Ne rien oublier | `CHECKLIST.md` | Validation finale |
| Créer rapidement | `TEMPLATES.md` | Template approprié |
| Process guidé | `commands/add-app.md` | Toutes les étapes |
| Bien committer | `commands/commit-app.md` | Standards Git |

---

## 📖 Guides Détaillés (dans .github/prompts/)

Pour des informations encore plus détaillées, consulter:

- **[`.github/prompts/new-app.prompt.md`](../.github/prompts/new-app.prompt.md)** (34KB)
  - Guide ultra-complet pour nouvelle app
  - 90+ points de vérification
  - Propriétés avancées Docker (40+ options)
  - Patterns spécialisés (FUSE, VPN, Monitoring, etc.)

- **[`.github/prompts/commit-app.prompt.md`](../.github/prompts/commit-app.prompt.md)** (14KB)
  - Workflow Git détaillé
  - Standards de commit avec Keep a Changelog
  - Leçons apprises de vraies implémentations

- **[`.github/prompts/audit-apps.prompt.md`](../.github/prompts/audit-apps.prompt.md)** (16KB)
  - Procédures de vérification complètes
  - Méthodologie d'audit
  - Standards de qualité

---

## 🚨 Les 10 Erreurs Critiques à Éviter

1. ❌ **Oublier de mettre à jour les README** (main + apps/)
2. ❌ **Ne pas préfixer les variables** avec APPNAME_
3. ❌ **Oublier d'incrémenter tipi_version** lors de modifications
4. ❌ **Version différente** entre config.json et docker-compose.json
5. ❌ **Mauvaise syntaxe variables**: `{{VAR}}` au lieu de `${VAR}`
6. ❌ **Ajouter uid/gid** sans vérifier PUID/PGID
7. ❌ **short_desc trop long** (> 5 mots)
8. ❌ **Oublier les hints** dans form_fields
9. ❌ **Utiliser des strings** pour boolean/number
10. ❌ **Ne pas vérifier** que le tag Docker existe

---

## ✅ Checklist Minimale (15 Points)

Avant chaque commit, ces 15 points DOIVENT être ✅:

1. ✅ Docker tag existe (manifest inspect)
2. ✅ config.json: ordre propriétés schema v2
3. ✅ config.json: tipi_version = 1 (ou incrémenté)
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

---

## 💡 Tips

### Pour Claude Code Users

- Les slash commands (`/add-app`, `/commit-app`) sont le moyen le plus simple
- Gardez `CHECKLIST.md` ouvert pendant le développement
- Référez-vous à `TEMPLATES.md` pour copier-coller rapidement
- Consultez `instructions.md` pour les règles importantes

### Pour les Contributeurs

- Tous les fichiers sont en français pour faciliter la compréhension
- Les templates incluent des commentaires explicatifs
- Les exemples sont tirés de vraies applications du store
- La checklist suit l'ordre logique de création

---

## 🎓 Apprendre par l'Exemple

### Apps Simples (Bonne Base)
- `apps/beszel/` - Configuration minimale
- `apps/homebox/` - App standard

### Apps Complexes (Référence Avancée)
- `apps/paperless-ai/` - Nombreux form_fields
- `apps/paperless-ngx/` - Configuration très complète (400 lignes)

### Examiner une App
```bash
# Structure complète
tree apps/[app-name]/

# Config
cat apps/[app-name]/config.json | jq .

# Docker compose
cat apps/[app-name]/docker-compose.json | jq .

# Description
cat apps/[app-name]/metadata/description.md
```

---

## 📞 Support

- **Questions générales**: Consulter [`instructions.md`](instructions.md)
- **Problème spécifique**: Chercher dans [`.github/prompts/`](../.github/prompts/)
- **Bugs/Issues**: [GitHub Issues](https://github.com/JigSawFr/tipi-store/issues)

---

## 🎉 Bon Développement!

Avec ces ressources, vous avez tout ce qu'il faut pour ajouter des applications au tipi-store sans rien oublier. Bonne chance! 🚀

---

**Dernière mise à jour**: 2025-12-14
**Maintenu par**: [JigSawFr](https://github.com/JigSawFr)
