<#
.SYNOPSIS

.DESCRIPTION

.INPUTS

.EXAMPLE

.COMPONENT
PowerShell, Outlook, ComObject - Outlook.Application
.NOTES
This script is a template of sending an email to somebody using PowerShell and the ComObject - Outlook.Application using Outlook. 
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $ParameterName
    )

#Outlook must be running for this script to work.
try {
    Get-Process -ProcessName OUTLOOK
}
catch {
    Start-Process "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE" -Wait
}

$My_Signature = @"
"@

$Body = @"

$My_Signature
"@

$outlookComObject = New-Object -ComObject Outlook.Application
$NewMail = $outlookComObject.CreateItem(0)
$NewMail.Subject = ""
$NewMail.Body = $Body
$NewMail.To = "username@domain.com;username@domain.com"
$NewMail.Cc = "username@domain.com;username@domain.com"
$NewMail.Attachments.Add($Attached_File)
$NewMail.Send()

Write-Host "Email has been sent!" -ForegroundColor DarkRed -BackgroundColor Green 