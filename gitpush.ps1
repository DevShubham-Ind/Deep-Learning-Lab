# Check if there are any changes to commit
$gitStatus = git status --porcelain

if ($gitStatus) {
    # Generate commit message with date & time
    $commitMessage = "Auto-commit on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

    # Run Git commands
    git add .
    git commit -m "$commitMessage"
    git push

    # Confirmation message
    Write-Host "Changes pushed successfully!" -ForegroundColor Green
} else {
    # No changes to commit
    Write-Host "No changes detected. Nothing to commit or push." -ForegroundColor Yellow
}
