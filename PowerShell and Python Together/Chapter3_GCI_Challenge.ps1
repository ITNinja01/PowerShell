     <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .EXAMPLE
    Example of how to use this cmdlet
    .EXAMPLE
    Another example of how to use this cmdlet
    .INPUTS
    Inputs to this cmdlet (if any)
    .OUTPUTS
    Output from this cmdlet (if any)
    .NOTES
    General notes
    .COMPONENT
    The component this cmdlet belongs to
    .ROLE
    The role this cmdlet belongs to
    .FUNCTIONALITY
    The functionality that best describes this cmdlet
    #>
    [CmdletBinding()]
    param (
        # Param1 help description
        [Parameter(Mandatory)]
        $Directory,
        # Param2 help description
    [Parameter(Mandatory)]
        $TargeComputer,
        # Param3 help description
    [Parameter(Mandatory)]
     $User
    )

    Get-ChildItem 'C:\' -Recurse  | select name, LastWriteTime, Attributes,Parent, Length, mode

    # Get Owner
    Get-ChildItem 'C:\' -Recurse  | select name, LastWriteTime, Attributes,Parent, Length, @{Name="Owner";Expression={(Get-Acl $_.FullName).Owner}}

    #Files size
    Get-ChildItem -File | Select-Object Name, @{Name="Size(MB)"; Expression={$_.Length / 1MB}}
