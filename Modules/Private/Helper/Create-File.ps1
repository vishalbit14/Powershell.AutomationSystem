<#
    .SYNOPSIS
        Create a file into the system.

    .DESCRIPTION
        Create a file into the system. However, If given path file does not exist into the system then create a new file at given $Path

    .PARAMETER FolderPath*
        Required. Directory path where to want to create a directory.

    .PARAMETER FileName*
        Required. FileName with extention.

    .OUTPUTS
        Generate a new file based on the $FileName at $FolderPath

    .EXAMPLE
        Create-File -FolderPath "FullPath/{DirectoryName}" -FileName "{FileName.extention}"
#>
function Create-File() {	
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $FolderPath,
        [Parameter(Mandatory = $true, Position = 1)]
        [string] $FileName
    )
    Begin {
    }
    Process {
        try {
            Create-Directory -Path $FolderPath

            $fullFilePath = $("$FolderPath\$FileName");
            IF (!(Test-Path $fullFilePath)) {
                New-Item -itemType File -Path $fullFilePath;
            }

            return $fullFilePath;
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Create-File', at: $FolderPath\$FileName" -Stop $true
        }
    }
    End {
    }
}