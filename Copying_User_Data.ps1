<#
.SYNOPSIS 
This script is for copying data to a new PC
.NOTES
This script was written a very long time ago. If I am to do it again there would be error handling,arrays, and more data would be transferred. 
#>

[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $NewPC,
        [Parameter(Mandatory=$true)]
        $OldPC,
        [Parameter(Mandatory=$true)]
        $Username
        )

Copy-Item "\\$OldPC\C$\Users\$Username\Desktop" -Recurse -Destination "\\$NewPC\C$\Users\$Username\" -Verbose -Force 
Copy-Item "\\$OldPC\C$\Users\$Username\Downloads" -Recurse -Destination "\\$NewPC\C$\Users\$Username\" -Verbose -Force 
Copy-Item "\\$OldPC\C$\Users\$Username\Favorites" -Recurse -Destination "\\$NewPC\C$\Users\$Username\" -Verbose -Force 
Copy-Item "\\$OldPC\C$\Users\$Username\Pictures" -Recurse -Destination "\\$NewPC\C$\Users\$Username\" -Verbose -Force 
Copy-Item "\\$OldPC\C$\Users\$Username\Videos" -Recurse -Destination "\\$NewPC\C$\Users\$Username\" -Verbose -Force