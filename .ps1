# Change to main branch
Write-Host "Changing to main branch..."
git checkout main

# Fetch remote branches
Write-Host "Fetching remote branches..."
git fetch -p

# Get list of local branches
$localBranches = git branch -l | ForEach-Object {
    $_.Trim().Replace("* ", "") # Remove spaces and asterisk from current branch
} | Where-Object { $_ -ne "" } # Remove empty lines

# Get list of remote branches
$remoteBranches = git branch -r | ForEach-Object {
    $_.Trim() -replace 'origin/', '' -replace 'HEAD -> origin/.*', '' # Clean output
} | Where-Object { $_ -ne "" } # Remove empty lines

# Compare lists and delete local branches that don't exist in remote
Write-Host "Comparing local and remote branches..."
$localBranches | ForEach-Object {
    if ($remoteBranches -notcontains $_) {
        Write-Host "Local branch '$_' doesn't exist in remote."

        try {
            git branch -D $_
            Write-Host "Branch '$_' deleted locally."
        }
        
        catch {
            Write-Warning "Failed to delete branch '$_'. Error: $($_.Exception.Message)"
        }
    } else {
        Write-Host "Branch '$_' found in remote."
    }
}

# Update main branch
Write-Host "Updating main branch..."
git pull origin main