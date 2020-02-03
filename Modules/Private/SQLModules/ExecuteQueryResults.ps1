<#
    .SYNOPSIS
        Execute the Query Statements, Store procedure with parameter and returns a result.

    .DESCRIPTION
        Execute the Query Statements, Store procedure with parameter and returns a results either multiple tables or single table based on the statement.

    .PARAMETER Name*
        Required. Name should be either Store Procedure or you can directly pass the SQL query statement.

    .PARAMETER Parameters
        Optional. Parameters is array object. Default value is blank array object.

    .PARAMETER Procedure
        Optional. If $false Execute the Procedure else Execute the Query Statement. Default value is $true.

    .PARAMETER Stage
        Optional. If $false create a connection for the Production database. Default value is $true.

    .OUTPUTS
        System.DataTables

    .EXAMPLE
        ExecuteQueryResults -Name "GetUserList" -Parameters @{objname="value"} -Procedure $true
#>
function ExecuteQueryResults() {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        $Name,
        $Parameters = @{ },
        $Procedure = $true,
        $Stage = $true
    )
    Begin {
        $sqlConnection = Open-SqlConnection $Stage
    }
    Process {
        try {
            [System.Data.SqlClient.SqlCommand] 
            $sqlCommand = New-object System.Data.SqlClient.SqlCommand
            $sqlCommand.CommandTimeout = 30
            $sqlCommand.Connection = $sqlConnection;

            foreach ($p in $Parameters.Keys) {
                [Void] $sqlCommand.Parameters.AddWithValue("@$p", $Parameters[$p])
            }
            
            $sqlCommand.CommandText = $Name
            if ($IsProcedure) {
                $sqlCommand.CommandType = [System.Data.CommandType]::StoredProcedure
            }

            $sqlDataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($sqlCommand)
            $dataSet = New-Object System.Data.DataSet
            $sqlDataAdapter.Fill($dataSet) | Out-Null
            return $dataSet.Tables
        }
        catch [System.Data.SqlClient.SqlException] { 
            Write-Exception -ErrorObj $_ -Message "Throws an '[System.Data.SqlClient.SqlException]' in 'ExecuteNonQuery'" -Stop $true
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an SqlException in 'ExecuteNonQuery'" -Stop $true
        }
        finally {
            Close-SqlConnection -Connection $sqlConnection
        }
    }
    End {
    }
}