<#
    .SYNOPSIS
        SQL Connection should be closed if no longer required.

    .DESCRIPTION
        SQL Connection should be closed if no longer required.

    .PARAMETER Connection
        Required. System.Data.SqlClient.SqlConnection Object

    .OUTPUTS
        Close SQL Connection

    .EXAMPLE
        Close-SqlConnection -Connection $sqlConnection
#>
function Close-SqlConnection() {	
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [System.Data.SqlClient.SqlConnection]$Connection
    )
    Begin {
    }
    Process {
        try {
            #SQL Connection should be closed once the whole XML has been processed.
            $isOpenConnection = ($Connection.State -eq [System.Data.ConnectionState]'Open')
            if ($isOpenConnection) { 
                $Connection.Close()
            }  
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Close-SqlConnection'" -Stop $true
        }
    }
    End { 
    }
}