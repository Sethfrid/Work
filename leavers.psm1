function disable-user {
[cmdletbinding()]
param(
     [Parameter(Mandatory=$True)]
          [string]$username
)

set-aduser $username -clear company, mail, telephonenumber, ProxyAddresses, mobile
disable-adaccount $username
$person = get-aduser $username 
move-adobject -identity $person.DistinguishedName -targetpath "OU=Disabled Users,OU=Managed Users,DC=domain,DC=org,DC=uk"

}


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
