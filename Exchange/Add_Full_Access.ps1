#This script is for adding Full Access to another user's mailbox
#Perams
[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $DistinguishedName_Mailbox,
        [Parameter(Mandatory=$true)]
        $Username_Requesting
        )
 
#Giving user access to another user's mailbox
Add-MailboxPermission -Identity $DistinguishedName_Mailbox -User "DomainName\$Username_Requesting" -AccessRights 'FullAccess'