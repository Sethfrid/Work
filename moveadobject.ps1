get-adcomputer computername | move-ADObject -TargetPath 'ou=OU,dc=DC,dc=NET'
#or for moving a user it will be get-aduser username