#This script is for decommissioning the Exchange part of a user 
#Parameter for username being configured.
param(
    [Parameter(Mandatory = $true)]
    $UserName
)
#Username is the SAMAccountName of the user being configured
#Disables Voice Mail 
Disable-UMMailbox -Identity $username@domainname.com -KeepProperties $False 
#Removes the users from the Exchange GAL
Set-Mailbox -Identity domain\$Username -HiddenFromAddressListsEnabled $true