function disable-user {
[cmdletbinding()]
param(
     [Parameter(Mandatory=$True)]
          [string]$user
)
 
set-aduser $user -clear company, mail, telephonenumber, ProxyAddresses, mobile
disable-adaccount $user
$person = get-aduser $user 
move-adobject -identity $person.DistinguishedName -targetpath "OU=Disabled Users,OU=Managed Users,DC=domain,DC=org,DC=uk"
 
}
 
 
function remove-groups {
[cmdletbinding()]
param (
[Parameter(Mandatory=$True)]
          [string]$user
 
)
get-ADPrincipalGroupMembership $user | where {$_.Name -notlike "Domain Users"} |% {Remove-ADPrincipalGroupMembership $user -memberof $_ -Confirm:$false}
 
}
