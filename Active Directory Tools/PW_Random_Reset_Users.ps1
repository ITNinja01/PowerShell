<#
.SYNOPSIS
This script is for resetting user's password with Get-Random.
#>

#Parameter for username which their password is being configured. 
 [CmdletBinding()]
   param ([Parameter(Mandatory=$true)]
        $Username
    )

#Var. for username's full name
$username_Fullname = Get-ADUser $username | select name -ExpandProperty name

#Var for from Read-Host and If/Else statements for answer given
$Answer = Read-Host -Prompt "Is $username_Fullname ($username) the user you wish to modify?: y or n"
If ($Answer -eq 'y') {
                        Write-Host "$username_Fullname has been verified has the correct user."
}
ElseIf ($Answer -eq 'n') {
                        Write-Error "$username and $username_Fullname do not match" -ErrorAction Stop
}

#Getting password from Get-Random from set below and will be eight of them
$new_password = (Get-Random '!','@','#','$','%','^','&','*','(',')','-','_','<','>','[',']','\','?',';',1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,Y,Z  -Count 8) -join ''

#Set users password and -Server maybe needed to communicate with a domain controller (DC).
Set-ADAccountPassword -Identity $UserName -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $new_password -Force) -ErrorAction Stop -Verbose -PassThru | select DistinguishedName, SID
Set-ADUser $Username -ChangePasswordAtLogon $true

#Writing the password to the screen
Set-Clipboard  "$username_Fullname's new temporary password is: $new_password."  
Get-Clipboard