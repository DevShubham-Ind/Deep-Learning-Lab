# Check if there are any changes to commit
$gitStatus = git status --porcelain

if ($gitStatus) {
    # Parse the changed files and their statuses
    $changes = $gitStatus | ForEach-Object {
        $status = $_.Substring(0, 2).Trim()
        $file = $_.Substring(3)
        "$status $file"
    }

    # Join the changes into a single string for the commit message
    $changeSummary = $changes -join "; "

    # Generate commit message with date/time and change summary
    $commitMessage = "Auto-commit on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $changeSummary"

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
