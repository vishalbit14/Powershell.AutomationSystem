<#
    .SYNOPSIS
        Create a directory into the system.

    .DESCRIPTION
        Create a directory into the system. However, If given path directory does not exist into the system then create a new directory at given $Path

    .PARAMETER Path*
        Required. Directory full path.

    .OUTPUTS
        Generate a new directory if not exists.

    .EXAMPLE
        Create-Directory -Path "FullPath/{DirectoryName}"
#>
function Create-Directory() {	
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Path
    )

    Begin {
    }
    Process {
        try {
            if (!(Test-Path $Path)) {
                New-Item -ItemType Directory -Path $Path
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Create-Directory', at: $Path" -Stop $true
        }
    }
    End {
    }
}