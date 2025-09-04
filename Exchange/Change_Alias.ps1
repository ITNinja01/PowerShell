[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    $New_User_Name
)
#Must use new user name ran Change_User_Last_Name.ps1 to first
#Stores variable for user's mailbox
$Mailbox = Get-Mailbox -Identity $New_User_Name -ErrorAction SilentlyContinue
#Making sure that the mailbox exist
if ($Mailbox -eq $null) {
    throw "Mailbox not found using: $New_User_Name"
}
#'Try' to change alias
Try {
    Set-Mailbox $New_User_Name -alias $New_User_Name -ErrorAction SilentlyContinue 
}
catch {
    throw "Changing mailbox alias did not work: $_"
}