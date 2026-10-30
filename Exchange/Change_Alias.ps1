[CmdletBinding()]
param (
    [Alias('New_User_Name')]
    [Parameter(Mandatory = $true)]
    $NewUserName
)
#Must use new user name ran Change_User_Last_Name.ps1 to first
#Stores variable for user's mailbox
$Mailbox = Get-Mailbox -Identity $NewUserName -ErrorAction SilentlyContinue
#Making sure that the mailbox exist
if ($Mailbox -eq $null) {
    throw "Mailbox not found using: $NewUserName"
}
#'Try' to change alias
Try {
    Set-Mailbox $NewUserName -alias $NewUserName -ErrorAction SilentlyContinue
}
catch {
    throw "Changing mailbox alias did not work: $_"
}