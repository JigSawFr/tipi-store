#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Commits and pushes config.json updates for Renovate PRs
.DESCRIPTION
    This script commits configuration updates and pushes them to the Renovate PR branch.
    It's designed to work within GitHub Actions workflow context.
.PARAMETER CommitMessage
    Custom commit message (optional, defaults to standard Renovate update message)
.OUTPUTS
    Exit code 0 for success, 1 for errors
#>

param(
    [string]$CommitMessage = "ci: update config.json after renovate docker-compose update"
)

# Validate environment
if (-not $env:GITHUB_HEAD_REF) {
    Write-Error "❌ Environment variable GITHUB_HEAD_REF is required (PR head branch)"
    exit 1
}

if (-not $env:GITHUB_REPOSITORY) {
    Write-Error "❌ Environment variable GITHUB_REPOSITORY is required"
    exit 1
}

Write-Output "📝 Committing and pushing config.json updates..."
Write-Output "Branch: $env:GITHUB_HEAD_REF"
Write-Output "Repository: $env:GITHUB_REPOSITORY"

try {
    # Configure Git user
    Write-Output "🔧 Configuring Git user..."
    
    # Use custom bot info if provided, otherwise fallback to github-actions
    $gitName = if ($env:BOT_NAME) { $env:BOT_NAME } else { "github-actions[bot]" }
    $gitEmail = if ($env:BOT_EMAIL) { $env:BOT_EMAIL } else { "github-actions[bot]@users.noreply.github.com" }
    
    git config user.name $gitName
    git config user.email $gitEmail
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "❌ Failed to configure Git user"
        exit 1
    }
    
    # Add config.json files
    Write-Output "📂 Adding config.json files..."
    git add apps/*/config.json
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "❌ Failed to add config.json files"
        exit 1
    }
    
    # Check if there are changes to commit
    $gitStatus = git status --porcelain apps/*/config.json
    if (-not $gitStatus) {
        Write-Output "ℹ️  No config.json changes to commit"
        exit 0
    }
    
    Write-Output "📝 Changes to commit:"
    git status --porcelain apps/*/config.json | ForEach-Object { Write-Output "   $_" }
    
    # Commit changes
    Write-Output "💾 Committing changes..."
    git commit -m $CommitMessage --signoff
    
    if ($LASTEXITCODE -ne 0) {
        Write-Output "ℹ️  No changes to commit (this is normal if config.json files are already up to date)"
        exit 0
    }
    # Set up remote with SSH authentication (Deploy Key)
    Write-Output "🔗 Setting up SSH remote for Deploy Key authentication..."
    $sshRemoteUrl = "git@github.com:$env:GITHUB_REPOSITORY.git"
    git remote set-url origin $sshRemoteUrl
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "❌ Failed to set SSH remote URL"
        exit 1
    }
    # Pull latest changes from remote branch to avoid non-fast-forward errors
    Write-Output "🔄 Pulling latest changes from remote branch..."
    git pull origin $env:GITHUB_HEAD_REF --rebase
    
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "⚠️ Pull failed, attempting to push without rebase..."
    }
    
    # Push changes
    Write-Output "📤 Pushing changes to branch $env:GITHUB_HEAD_REF..."
    git push origin HEAD:$env:GITHUB_HEAD_REF
    
    if ($LASTEXITCODE -ne 0) {
        Write-Output "⚠️ Direct push failed, trying force push..."
        git push origin HEAD:$env:GITHUB_HEAD_REF --force-with-lease
        
        if ($LASTEXITCODE -ne 0) {
            Write-Error "❌ Failed to push changes even with force-with-lease"
            exit 1
        }
        
        Write-Output "✅ Force push successful"
    }
    
    Write-Output "✅ Successfully committed and pushed config.json updates"
    exit 0
}
catch {
    Write-Error "❌ An error occurred: $($_.Exception.Message)"
    Write-Error "Stack trace: $($_.ScriptStackTrace)"
    exit 1
}
