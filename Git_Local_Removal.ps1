<#
.SYNOPSIS
This script removes local Git branches that no longer exist on the remote repository.
.DESCRIPTION
It fetches the latest state of the remote repository, identifies local branches that are not present
on the remote, and deletes them to keep the local repository clean.   
.EXAMPLE
Git_Local_Removal.ps1 
#>

if (-not (test-path -path './.git' -PathType Container)) {
    Write-Error "The current directory is not a Git repository. Please navigate to a valid Git repository and try again."
    exit 1
}

# Remove locally tracked branches that no longer exist on the remote repository
git fetch --prune

$RemoteBranches = git branch -r | Where-Object { $_ -notmatch 'HEAD' } | ForEach-Object { $_.Trim().Replace('origin/', '') }

$LocalBranches = git branch | where-object { $_ -notmatch '^\*' } | ForEach-Object { $_.Trim() }

# Identify local branches that no longer exist on the remote and deletes them
foreach ($LocalBranch in $LocalBranches) {
    if ($RemoteBranches -notcontains $LocalBranch) {
        git branch -d $LocalBranch
    }
}