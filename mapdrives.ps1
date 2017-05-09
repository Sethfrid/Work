#to map drives, the letter is the drive it will be assigned as

New-PSDrive -Name "G" -PSProvider Filesystem -Root "server location" -Persist
