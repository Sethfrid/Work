#This is a script that is run for when a user leaves the business for my current client I support.

#Enter the username of the leaver and it wil be disabled and moved to the disabled OU and set to null the relevant attributes.
function disable-user {
[cmdletbinding()]
param(
     [Parameter(Mandatory=$True)]
          [string]$username
)

$date = get-date -Format "dd-MM-yyyy - hh:mm"
set-aduser $username -clear company, mail, telephonenumber, ProxyAddresses, mobile -replace @{info= "Account disabled on $date by $env:USERNAME"}
disable-adaccount $username
$person = get-aduser $username 
move-adobject -identity $person.DistinguishedName -targetpath "OU=Disabled Users,OU=Managed Users,DC=domain,DC=org,DC=uk"

}

# This copies the leaver's group members and export it to a text file so it makes it easier if the leaver's replacement can have the same groups
function remove-group {
[cmdletbinding()]
param (
[Parameter(Mandatory=$True)]
          [string]$username

)

get-ADPrincipalGroupMembership $username | select name | export-csv c:\temp\$username.csv

start-sleep -s 5

get-ADPrincipalGroupMembership $username | where {$_.Name -notlike "Domain Users"} | foreach {Remove-ADPrincipalGroupMembership $username -memberof $_ -Confirm:$false}

}
