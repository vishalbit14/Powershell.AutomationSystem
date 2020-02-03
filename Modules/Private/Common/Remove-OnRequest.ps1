<#
    .SYNOPSIS
        Used for the remove files or folders from Explorer.

    .DESCRIPTION
        Used for the remove files or folders from Explorer. However remove items from either directly using file path, files which contain a list of file paths, directory, and Object which contains a list of the path.

    .PARAMETER Path
        Optional, Value can be either file or folder full path and remove it from the system if a path exists.

    .PARAMETER FilePath
        Optional, Value can be a file path in which data contains a list of paths. Read paths from file and remove every from the system one by one if it exists.

    .PARAMETER ObjectList
        Optional, Value can be the object and holds a list of file paths, Remove list of files one by one if exists.

    .EXAMPLE
        Remove-OnRequest -Path "D:/XML/RemoveMe.xml"
        Remove-OnRequest -FilePath "D:/XML/RemoveMe.txt"
        Remove-OnRequest -ObjectList @()
#>
function Remove-OnRequest() {	
    [cmdletbinding()]
    Param (
        $Path,
        $FilePath,
        $ObjectList
    )

    Begin {
    }
    Process {
        try {
            if ($null -ne $Path) {
                if (Test-Path $Path) {
                    Remove-Item -LiteralPath $Path -Force -Recurse
                }
            }
            elseif ($null -ne $FilePath) {
                Get-Content $FilePath | ForEach-Object {
                    if (Test-Path $_) {
                        Remove-Item $_
                    }
                }
            }
            elseif ($ObjectList.Count -gt 0) {
                $ObjectList | ForEach-Object {
                    if (Test-Path $_) {
                        Remove-Item $_
                    }
                }
                $ObjectList = @();
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Remove-OnRequest'" -Stop $true
        }
        finally{

        }
    }
    End {
    }
}