---
description: Complete workflow to add new app with validation and commit (orchestrates multiple commands)
---

# Add App - Complete Workflow

Complete end-to-end workflow that orchestrates: app creation → validation → commit.

This is a **meta-command** that chains together:
1. `/add-app` - Create app files
2. `/validate` - Comprehensive validation
3. `/commit-app` - Commit with proper message

## Process

### Step 1: Create App Files

Execute `/add-app` workflow:
- Gather information (app name, GitHub URL)
- Research phase (Docker image, docs, PUID/PGID)
- Create all files (config.json, docker-compose.json, description.md, logo.jpg)
- Update READMEs

**Do NOT commit yet** - validation comes next.

### Step 2: Automatic Validation

After files created, immediately run `/validate`:

```
Running automatic validation...

Validation Report for: [app-name]
=====================================

Checking 15 validation points...
```

**If validation FAILS:**
- Show errors to user
- Ask: "Would you like to run /fix-app to auto-correct?"
  - If yes → Run `/fix-app` in interactive mode
  - If no → Stop, let user fix manually

**If validation PASSES:**
- Show success message
- Continue to commit

### Step 3: Automatic Commit

After validation passes, run `/commit-app`:

```
All validation passed! ✓

Proceeding to commit...
```

Generate commit message and push.

---

## Complete Example

```
User: /add-app-complete

Claude: Let's add a new app with complete workflow!

=== STEP 1: CREATE APP ===
What application would you like to add?
User: Beszel

[... /add-app process ...]

✓ Files created:
- apps/beszel/config.json
- apps/beszel/docker-compose.json
- apps/beszel/metadata/description.md
- apps/beszel/metadata/logo.jpg
✓ READMEs updated

=== STEP 2: VALIDATION ===
Running automatic validation...

✅ All 15 checks passed!
- File structure ✓
- JSON syntax ✓
- Docker tag exists ✓
- Variables prefixed ✓
- ... (11 more checks)

Status: READY TO COMMIT ✓

=== STEP 3: COMMIT ===
Creating feature branch: feat/add-beszel
Staging files...
Committing: 🎉 Added: beszel application to tipi-store

✓ Complete! App added, validated, and committed.

Next steps:
1. Push: git push -u origin feat/add-beszel
2. Create Pull Request on GitHub
```

---

## Error Handling

### Validation Fails

```
=== STEP 2: VALIDATION ===
Running automatic validation...

❌ Failed: 2/15 checks

CRITICAL ISSUES:
- Variables not prefixed: API_KEY, DB_URL
- short_desc too long (8 words)

Options:
1. Run /fix-app to auto-correct issues
2. Fix manually and retry validation
3. Cancel workflow

Your choice? 1

Running /fix-app...
[... auto-fix process ...]

✓ Fixed 2 issues
Re-running validation...
✅ All checks passed!

Continuing to commit...
```

---

## Advantages

**Single Command:**
- One command does everything
- No manual steps between
- Automatic validation
- Automatic error recovery

**Safety:**
- Validates before committing
- Offers to fix errors automatically
- User can abort at any point

**Efficiency:**
- Saves time (no need to run 3 commands)
- Ensures nothing is forgotten
- Consistent workflow every time

---

## When to Use

**Use `/add-app-complete` when:**
- Adding new app from start to finish
- Want automated workflow
- Trust validation and auto-fixes

**Use individual commands when:**
- Want more control at each step
- Testing or experimenting
- Need to review each step carefully

---

**Ready to add a complete app with automated workflow?**
