#This script is for adding Full Access to another user's mailbox
#Perams
[CmdletBinding()]
param (
    [Alias('DistinguishedName_Mailbox')]
    [Parameter(Mandatory = $true)]
    $DistinguishedNameMailbox,
    [Alias('Username_Requesting')]
    [Parameter(Mandatory = $true)]
    $UsernameRequesting
)
 
#Giving user access to another user's mailbox
Add-MailboxPermission -Identity $DistinguishedNameMailbox -User "DomainName\$UsernameRequesting" -AccessRights 'FullAccess'