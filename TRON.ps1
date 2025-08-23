<#
.SYNOPSIS
A script to clean and optimize a Windows PC.
.DESCRIPTION
This script performs various maintenance tasks to clean and optimize a Windows PC, including deleting temporary files, clearing the recycle bin, updating PowerShell help files, syncing time with an NTP server, running Disk Cleanup, installing Windows updates, running System File Checker (sfc), repairing the Windows image using DISM, and defragmenting the hard drive.
.COMPONENT
PowerShell, Windows Update, DISM, SFC, Disk Cleanup
.EXAMPLE
Run the script in a PowerShell window with administrative privileges to perform all maintenance tasks.
.LINK
Tron text art source:
https://github.com/mikebell/asciitron/blob/master/tron.txt#L1
.ROLE   
This script is intended for use by system administrators and advanced users who want to maintain and optimize their Windows PCs.
It assumes the user has administrative privileges.
#>

$Tron_Art = @"
........'''''.      ..'',,,,,,,,,;;;;;;;;;;;;;;;;;;;;;;;;;;,..                ..';:cc::;,..           .;;;;,                   .''''''.'
,:'........,dc    ,loc;;;,,,,,,,,,,,;;;;;;;;;;;;;;;;;;;;;;;cod1'           'codlc:,,,,;:loxxc'      ..xx;;;dd.                 cx,....,o'
,c.        .x:  ,ol'...                                      .,oo'      .:ol,.           ..':xkl.   ..kk. ..ckl.               cO.    'o'
;l.        .kc cx:..     .......................................;d,   .cd:.        ...       .'oO1. .'kk.   .'lkc.             lO.    'd'
.;,,,,,,,,;;c;'ko..   ;ddllllllllooooooooooodddddddddddddddddddxxdo. .dc.     .,:oodddxdl;.    .;kO,.'Ok.    ..'dk:.           lO.    'd'
              ,x: .   .kd............................................ol.     ,dl,......'ckOc.....,OO''OO.      ..;xx'          l0.    .d'
              ,kc .   .ko..   ....,kdlclllxd'.:kdooodddddddddddddxx':x...  .lo............1Kx.....;0d'OO.        ..cko. .......o0.    ,d'
              ,kc .   .kd..  .....:Kd.....O0,.oK;...............:kc.dc.....ck'.............1Xc.....k0,OO.          .,Ox,xc'''',':.    ,x'
              ,k: .   .kd..    ...:0d.....O0,.oK;.............;dd,..d:.....lO..............cKc.....x0,0O.    .......;0x;0:            ,x'
              ,k: .    kd..      .;0d.....O0,.,kd,.....':::cloc'....co.    ,ko............,OO.....,0x'0O.  ..ox:,,'';:''dx;           ,x,
              ,x:      ko..       ;0d.....O0'...ckd;.....'oxc........o,     .ox;.........1Ox......xK;,OO.  ..oO,       ..;xd.         ,x,
              ,x:      xo..       ;0o.   .k0'.....:xo,.....'ld;......'o'.    .'colc::cldd1'    ..xK:.'OO.  ..oO,          .cxc.       ,x'
              ,x;      xo..       ;Oo.   .k0'.     .;dd;.    .:o;.    .lc.       .......      .;Ox' .'OO.  ..lO,            .cd;      ,x'
              ,x;      xl .       ,Oo.   .k0'.       .,od;,    .:dc.    'cc'.              .'lkk;   .'Ok.  ..lO,              .ld;    ,d'
              ,d;      xl .       ,kl.   .xO..          'dd;.    .:o:.    .;ll;'........':okxc.     .'kk.  ..lk,               .'oo.  ,d,
              .c;;''',;,          .oo::cccl:.             'ldigitalllc.      ..,;:ccllllc:'.         .:c:::::ll.                 .,,',,c.
"@

$Intro = @"
Welcome to TRON!
Tron fights for the users!
This script is designed to speed up and protect your computer; this script assumes you are running it with administrative privileges. If not, please run PowerShell as an administrator.
"@

Write-Host $Tron_Art
Write-Host $Intro

Write-Host "Deleting temporary files..."
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -Verbose

Write-Host "Clearing recycle bin..."
Read-Host "Do you want to clear the recycle bin? (Y/N)
" -Prompt "Confirm" | ForEach-Object {
    if ($_ -eq 'Y' -or $_ -eq 'y') {
        Write-Host "Clearing recycle bin..."
        Clear-RecycleBin -Force -Verbose
    } else {
        Write-Host "Skipping recycle bin clearance."
    }
}

Write-Host "Updating PowerShell Help..."
Update-help -UICulture ENG -Verbose -Force

$Write_Info = {
    Write-Host "These help files updated successfully." -ForegroundColor Green
}

if ($IsWindows -eq $true) {
    #Paths where help files are stored
$Local_Help_Path    = "$env:USERPROFILE\Documents\PowerShell\Help"
$OneDrive_Help_Path = "$env:OneDrive\Documents\PowerShell\Help"

if (Test-Path $Local_Help_Path) {
    Get-ChildItem $Local_Help_Path -Recurse | Where-Object {$_.LastWriteTime -ge ((get-date).AddHours(-8))}
    & $Write_Info
}
if (Test-Path $OneDrive_Help_Path) {
    Get-ChildItem $OneDrive_Help_Path -Recurse | Where-Object {$_.LastWriteTime -ge ((get-date).AddHours(-8))}
    & $Write_Info
}
}
else {
#Paths where help files are stored in Linux or Mac.
$Local_Help_Path = "/home/$env:USER/.local/share/powershell/Help"
    if (Test-Path $Local_Help_Path) {
        Get-ChildItem $Local_Help_Path -Recurse | Where-Object {$_.LastWriteTime -ge ((get-date).AddHours(-8))}
        & $Write_Info
    }
}

Write-Host "Syncing time with NTP server..."
w32tm /resync /nowait

Write-Host "Running Disk Cleanup..."
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait -NoNewWindow

Write-Host "Running Windows Update..."
Install-WindowsUpdate -AcceptAll -Wait -NoNewWindow -Verbose

Write-Host "Running System File Checker..."
sfc /scannow

Write-Host "Running DISM to repair Windows image..."
dism /Online /Cleanup-Image /RestoreHealth

Write-Host "Defragmenting hard drive..."
Start-Process -FilePath "defrag.exe" -ArgumentList "/C /O /H /V" -Wait -NoNewWindow

write-host $Tron_Art
Write-Host "TRON has completed its mission. Goodbye, user!"