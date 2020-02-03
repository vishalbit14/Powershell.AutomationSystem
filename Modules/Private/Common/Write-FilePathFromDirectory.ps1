<#
    .SYNOPSIS
        Write the list of paths into the text file from the directory.

    .DESCRIPTION
        Write the list of paths into the text file from the directory. However, Get all child items from directory either from subfolders and writes the file paths into the given file location.

    .PARAMETER FolderPath*
        Required. Directory full path

    .PARAMETER FilePath
        Required. Writes the file to $FilePath. $FilePath should be a full path with the file name and It will create a new one if the file not exists.

    .PARAMETER Filter
        Default '*'. $Filter can be extensions of the file path. 

    .OUTPUTS
        Writes the file path at $FilePath location

    .EXAMPLE
        Write-FilePathsFromDirectory -FolderPath 'FullPath/{DirectoryName}' -FilePath 'FullPath/{WriteMe}.txt' -Filter '*.xml'
#>

function Write-FilePathsFromDirectory() {	
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$FolderPath,
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$FilePath,
        [string]$Filter
    )

    Begin {
    }
    Process {
        try {
            if (!(Test-Path $FilePath)) {
                $fileDetail = [FileDetailModel]
                $FilePath = Get-LastOrDefault (Create-File -FolderPath $FolderPath -FileName $FilePath);
            }
    
            if($null -eq $Filter){
                $Filter = '*';
            }
    
            Get-ChildItem -Path $FolderPath -Filter $Filter -Recurse | ForEach-Object { $_.FullName } | Out-File -FilePath $FilePath -Encoding oem   
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Write-FilePathsFromDirectory'" -Stop $true
        }
    }
    End {
    }
}