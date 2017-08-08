set-aduser samaccount -manager $null

get-adprinciplegroupmembership samaccount | where {$_.Name -notlike "Domain Users"} |% {Remove-AdPrincipleGroupmembership samaccount -memberof $_ -Confirm:$false}

disable-adaccount samaccount

set-adaccountexpiration samaccount -DateTime "07/08/2017" 
# In this date's example the account is set to expire the EOD of the previous day.