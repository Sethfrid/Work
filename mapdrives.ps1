#G Drive

New-PSDrive -Name "G" -PSProvider Filesystem -Root "\\ntanet1\Project Management" -Persist

######

#Sage K Drive

New-PSDrive -Name "K" -PSProvider Filesystem -Root "\\172.16.40.127\Sage" -Persist

######

#F drive

New-PSDrive -Name "F" -PSProvider Filesystem -Root "\\ntanet1\Data" -Persist

#####

#N Drive 

New-PSDrive -Name "N" -PSProvider Filesystem -Root "\\ntanet1\telemarketing" -Persist

New-PSDrive -Name "N" -PSProvider Filesystem -Root "\\sn-nas.snplc.local\shares" -Persist

#####

#For Echo users

New-PSDrive -Name "N" -PSProvider Filesystem -Root "\\ansystems\ops\service delivery management\" -Persist

#####

#P Drive

New-PSDrive -Name "P" -PSProvider Filesystem -Root "\\echoshare\public" -Persist

#####

#R Drive

New-PSDrive -Name "R" -PSProvider Filesystem -Root "\\echoshare\accounts" -Persist

#####

#S Drive

New-PSDrive -Name "R" -PSProvider Filesystem -Root "\\ntanet1\pricing" -Persist

#####

#T Drive

New-PSDrive -Name "T" -PSProvider Filesystem -Root "\\ansystems\clients" -Persist

#####

#X Drive

New-PSDrive -Name "X" -PSProvider Filesystem -Root "\\sharepoint\crm" -Persist

#####

#Y Drive

New-PSDrive -Name "Y" -PSProvider Filesystem -Root "\\ntanet1\Academy" -Persist

#####

#Z Drive for HR

New-PSDrive -Name "Z" -PSProvider Filesystem -Root "\\onealternative.net\fileservices\Team Shares\Human Resources" -Persist