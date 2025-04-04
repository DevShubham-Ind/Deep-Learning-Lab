# Generate commit message with date & time
$commitMessage = "Auto-commit on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# Run Git commands
git add .
git commit -m "$commitMessage"
git push

# Confirmation message
Write-Host "Changes pushed successfully! Commit: $commitMessage" -ForegroundColor Green
