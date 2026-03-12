function Disable-User {
[cmdletbinding()]
param(
     [Parameter(Mandatory=$True)]
     [string]$username,

     [Parameter(Mandatory=$True,
     HelpMessage = "Enter ticket number")]
     [string]$ticketnumber
)

get-ADPrincipalGroupMembership $username | select name | export-csv "\\location\$username.csv"

get-ADPrincipalGroupMembership $username | where {$_.Name -notlike "Domain Users"} | foreach {Remove-ADPrincipalGroupMembership $username -memberof $_ -Confirm:$false}

$date = get-date

set-aduser $username -clear company, mail, telephonenumber, mobile, manager -replace @{description= "Account disabled on $date by $env:USERNAME (T# $ticketnumber )"}

Get-ADUser $username -Properties DirectReports | select -expandproperty DirectReports | Set-ADUser -clear manager

disable-adaccount $username

start-sleep -s 5

Get-ADUser $username | Move-ADObject -TargetPath 'OU=Leavers,OU=Managed Users,DC=,DC=,DC='

Invoke-Command -ComputerName core-aadc-01 -ScriptBlock {sync}

}
