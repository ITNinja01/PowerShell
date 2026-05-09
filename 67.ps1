<#
.SYNOPSIS
    This script will display the number 67 in random colors on the console.
.DESCRIPTION
    The script defines an array of available colors and uses the Get-Random cmdlet to select random foreground and background colors for the number 67. It ensures that the foreground and background colors are not the same to maintain readability. The script runs in an infinite loop, continuously displaying the number 67 in different color combinations every 0.25 seconds.
.EXAMPLE
    & .\67.ps1
    This command will execute the script, and you will see the number 67 displayed in random colors on the console until you stop the script.
.NOTES
    This script is intended for educational purposes and can be stopped by closing the PowerShell window or by using Ctrl+C in the console. I created this script for my nephew.
#>
$X = 1

# Define an array of available colors
$Colors = 'Black',
'DarkBlue',
'DarkGreen',
'DarkCyan',
'DarkRed',
'DarkMagenta',
'DarkYellow',
'Gray',
'DarkGray',
'Blue',
'Green',
'Cyan',
'Red',
'Magenta',
'Yellow',
'White'

do {
    $ForegroundColor = Get-Random -InputObject $Colors
    $BackgroundColor = Get-Random -InputObject $Colors

    # Ensure that the foreground and background colors are not the same
    if ($ForegroundColor -eq $BackgroundColor) {
        $BackgroundColor = Get-Random -InputObject $Colors
        $ForegroundColor = Get-Random -InputObject $Colors
    }

    write-host "67 " -NoNewline -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
    Start-Sleep -Seconds .25
}
while ($X -eq 1)