<#
    .SYNOPSIS
        Open new SQL Connection.

    .DESCRIPTION
        Open a new SQL Connection object based on the $Stage flag for the Stage or Production database.

    .PARAMETER Stage
        Optional. If $false create a connection for the Production database. Default value is $true.

    .OUTPUTS
        System.Data.SqlClient.SqlConnection

    .EXAMPLE
        Open-SqlConnection -Stage $Stage
#>

function Open-SqlConnection() {
    [cmdletbinding()]
    Param(
        [bool]$Stage = $true
    )
    Begin {
        $connectionString = Get-ConnectionString -Stage $Stage
    }
    Process {    
        try {
            $sqlConnection = new-object System.Data.SqlClient.SqlConnection;
            $sqlConnection.ConnectionString = $connectionString;
            $isCloseConnection = ($sqlConnection.State -eq [System.Data.ConnectionState]'Closed')
            if ($isCloseConnection) { 
                $sqlConnection.Open()
            }
            return $sqlConnection;
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Open-SqlConnection'" -Stop $true
        }
    }
    End {
    }
}