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

 

get-ADPrincipalGroupMembership $username | select name | export-csv "\\##\##\IT\Leaver's Groups\$username.csv"

 

start-sleep -s 5

 

get-ADPrincipalGroupMembership $username | where {$_.Name -notlike "Domain Users" -and $_.Name -notlike "sec-emsE5" -and $_.Name -notlike "sec-o365e5"} | foreach {Remove-ADPrincipalGroupMembership $username -memberof $_ -Confirm:$false}

 

 

$date = get-date

 

set-aduser $username -clear company, mail, title, telephonenumber, mobile -replace @{description= "Account disabled on $date by $env:USERNAME (T# $ticketnumber )"}

 

disable-adaccount $username

 

$person = get-aduser $username

move-adobject -identity $person.DistinguishedName -targetpath "OU=Disabled Users,OU=Managed Users,DC=##,DC=##,DC=##"

 

}
