#removes all groups for a user

get-adprinciplegroupmembership samaccount | where {$_.Name -notlike "Domain Users"} |% {Remove-AdPrincipleGroupmembership samaccount -memberof $_ -Confirm:$false}

#Empties the mail, company and proxyaddresses fields
set-aduser  samaccountname -replace @{mail="$null"; company ="$null"; proxyAddresses="$null"}

remove-adgroupmember -identity sec-emsE5 -members SAMACCOUNTNAME -confirm:$false

remove-adgroupmember -identity sec-o365e5 -members SAMACCOUNTNAME -confirm:$false

disable-adaccount samaccountname

set-adaccountexpiration samaccount -DateTime "07/08/2017" 
# In this date's example the account is set to expire the EOD of the previous day.
