<#
.SYNOPSIS

.LINK
https://github.com/mikebell/asciitron/blob/master/tron.txt#L1
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
Update-help -Force -Verbose

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

Write-Host "Defragmenting hard drive...
if (-not trimmed -eq $true) {
    Write-Host "Defragmentation is not supported on this system."
} else {
    Start-Process -FilePath "defrag.exe" -ArgumentList "/C /O /H /V" -Wait -NoNewWindow
}

write-host $Tron_Art
Write-Host "TRON has completed its mission. Goodbye, user!"

#look into this code
    Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3" | ForEach-Object {
        $drive = $_
        $supportsTrim = $false

        # Check if the drive is an SSD (a strong indicator of TRIM support)
        $isSSD = ($drive.MediaType -match "SSD") -or ($drive.Model -match "SSD") -or ($drive.Description -match "SSD")

        # Check the filesystem (NTFS generally supports TRIM)
        $filesystem = Get-Volume -DriveLetter $drive.DeviceID | Select-Object FileSystem

        # Output the information.  We can't definitively say TRIM is *enabled*, but this gives strong hints.
        Write-Host "Drive: $($drive.DeviceID)"
        Write-Host "Media Type: $($drive.MediaType)"
        Write-Host "Model: $($drive.Model)"
        Write-Host "Description: $($drive.Description)"
        Write-Host "File System: $($filesystem.FileSystem)"
        Write-Host "Likely SSD: $($isSSD)"
        if ($isSSD -and ($filesystem.FileSystem -eq "NTFS")) {
            Write-Host "TRIM likely enabled (but not guaranteed)."
        } else {
            Write-Host "TRIM likely not enabled (or not applicable)."
        }
        Write-Host "--------------------"
    }