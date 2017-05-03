<#
Add a date stamp to each archive file and move them onto a backup location
#>

$dest = "\\ntanet1\salesforcebackup"
$org = get-childitem "$env:USERPROFILE\downloads" -filter *.zip | ForEach-Object {          
Rename-Item $_.FullName "$BackupFolder$($_.BaseName -replace " ", "_" -replace '\..*?$')_$(Get-Date -Format "ddMMyyyy").zip"
}

move-item "$env:userprofile\downloads\*.zip" -Destination $dest -recurse

remove-item "$env:userprofile\downloads\*.zip"
