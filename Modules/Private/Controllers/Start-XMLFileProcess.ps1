<#
    .SYNOPSIS
        Process on XML file for the inserting records in respecitve tables.

    .DESCRIPTION
        A process on XML file for the inserting records in respective tables. However, Read the XML based on the nodes and calling the respective class and split the data into the class methods and assign it to the respective global table objects.

    .PARAMETER FileName
        Required. XML FilePath

    .OUTPUTS
        Process the XML file path and stored the data temporarily into the respective global table objects.

    .EXAMPLE
        Start-XMLFileProcess -FilePath "FullPath/20203001.xml"
#>
function Start-XMLFileProcess() {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        $FilePath
    )
    Begin {
        $fileDetail = [FileDetailModel]::new($FilePath);
        $XmlProcessData = $null;
        try {
            $XmlProcessData = [xml](Get-Content $FilePath -Encoding:UTF8)
        }
        catch {
            Write-Exception -Message "Package Date: $PackageDate | FilePath: $FilePath";
            Write-Exception -ErrorObj $_ -Message "The loading of the xml using UTF7 and ASCII encoding has failed" -Stop $true;
        }
    }
    Process {
        try {
            $root_data_node = $XmlProcessData."users-data";
            $user_node = $root_data_node."user-detail";

            if ($Global:Resources.IsDataTable) {
                [UsersTable]::ToObjectList($user_node)
            }
            else {
                [UsersTable]::ToQueryList($user_node)
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an Exception in 'Start-XMLFileProcess', FileName: $($fileDetail.FileName)" -Stop $true
        }
        finally {
            Write-LogInfo -Message "Users data read successfully from '$($fileDetail.FileName)' file" -Write $true
        }
    }
    End {
    }
}