# Check if there are any changes to commit
$gitStatus = git status --porcelain

if ($gitStatus) {
    # Generate commit message with date & time
    $commitMessage = "Auto-commit on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

    # Run Git commands
    git add .
    git commit -m "$commitMessage"
    git push

    # Parse added files from git status
    $addedFiles = $gitStatus | Where-Object { $_.Substring(0, 1) -eq 'A' -or $_.Substring(1, 1) -eq 'A' } | ForEach-Object {
        $_.Substring(3)
    }

    # Show confirmation message with added files in green
    if ($addedFiles.Count -gt 0) {
        Write-Host "Changes pushed successfully! New files added:" -ForegroundColor Green
        foreach ($file in $addedFiles) {
            Write-Host "  + $file" -ForegroundColor Green
        }
    } else {
        Write-Host "Changes pushed successfully!" -ForegroundColor Green
    }
} else {
    # No changes to commit
    Write-Host "No changes detected. Nothing to commit or push." -ForegroundColor Yellow
}
