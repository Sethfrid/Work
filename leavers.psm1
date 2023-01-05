# This removes the attributes Company, Mail, Phone Number, Proxy Addresses and Mobile. 
#The date/ time stamp along with the ticket number is added to the user under notes in the telephone tab of the user. 
#Disables the account and moves to the Disabled Users OU

function Disable-User {
[cmdletbinding()]
param(
     [Parameter(Mandatory=$True)]
     [string]$username,

     [Parameter(Mandatory=$True,
     HelpMessage = "Enter ticket number")]
     [string]$ticketnumber
)

get-ADPrincipalGroupMembership $username | select name | export-csv "\Leaver's Groups\$username.csv"

start-sleep -s 3

get-ADPrincipalGroupMembership $username | where {$_.Name -notlike "Domain Users" -and $_.Name -notlike "License - Enterprise Mobility Security E5" -and $_.Name -notlike "License - Microsoft Office 365 E5"} | foreach {Remove-ADPrincipalGroupMembership $username -memberof $_ -Confirm:$false}

$date = get-date

set-aduser $username -clear company, department, mail, telephonenumber, mobile -replace @{description= "Account disabled on $date by $env:USERNAME (T# $ticketnumber )"}

Get-ADUser $username -Properties DirectReports | select -expandproperty DirectReports | Set-ADUser -clear manager

disable-adaccount $username

start-sleep -s 5

Invoke-Command -ComputerName computer1 -ScriptBlock {sync}
