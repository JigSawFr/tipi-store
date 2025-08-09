# Verified Commits Configuration for GitHub Actions

## Overview

GitHub Actions commits are now automatically signed and verified using the [`iarekylew00t/verified-bot-commit`](https://github.com/IAreKyleW00t/verified-bot-commit) action.

## How it works

### Action used

The `verified-bot-commit@v1` action:
- ✅ **Automatically creates signed commits** via GitHub API
- ✅ **Uses GitHub's public PGP key** for signing
- ✅ **Shows "Verified" badge on GitHub** without additional configuration
- ✅ **Works with standard GITHUB_TOKEN** (no additional secrets required)

### Current configuration

```yaml
- name: Commit and push config.json updates with verified signature
  uses: iarekylew00t/verified-bot-commit@v1
  with:
    message: "ci: update config.json after renovate docker-compose update"
    files: |
      apps/*/config.json
```

### Benefits

1. **No secret configuration** required
2. **Automatically verified commits** by GitHub
3. **Compatible with branch protection rules** that require signed commits
4. **Simplicity**: no manual GPG key management

## Solving PR #93 issue

This configuration resolves the PR #93 issue that couldn't auto-merge because:
- The `github-actions[bot]` commit was unsigned (`verified: false`)
- Branch protection rules require verified commits (`web_commit_signoff_required: true`)

Now all commits created by the workflow will be automatically verified and Renovate PRs can auto-merge successfully.

## Verification

### On GitHub

- Commits appear with **"Verified" ✅** badge
- Author is displayed as `github-actions[bot]`
- Signature is automatically verified by GitHub

### Complete workflow

1. **Renovate** creates a PR with Docker updates
2. **GitHub Actions** detects changes in `apps/*/docker-compose.json`
3. **PowerShell scripts** update corresponding `config.json` files
4. **verified-bot-commit action** creates a signed and verified commit
5. **Auto-merge** triggers automatically if all conditions are met

## Migration from manual GPG solution

✅ **Advantages of this approach**:
- No GPG secret management
- No complex configuration
- Automatically verified commits
- Reduced maintenance
- Robust and proven solution
