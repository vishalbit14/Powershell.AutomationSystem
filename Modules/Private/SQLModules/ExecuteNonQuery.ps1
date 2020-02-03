<#
    .SYNOPSIS
        Execute the INSERT, UPDATE, DELETE Statement or Store procedure.

    .DESCRIPTION
        Execute the INSERT, UPDATE, DELETE Statement or Store procedure.

    .PARAMETER Name*
        Name should be either Store Procedure or you can directly pass the SQL query statement.

    .PARAMETER Procedure
        Optional. If $false Execute the Procedure else Execute the Query Statement. Default value is $true.

    .PARAMETER Stage
        Optional. If $false create a connection for the Production database. Default value is $true.

    .OUTPUTS
        Return number of affected rows.

    .EXAMPLE
        $sql_insert_query = "insert into $($Global:DatabaseTable.UsersTable) values('2018200571','0','2019257412', 'Divisional Child')"
        ExecuteNonQuery $sql_insert_query -Procedure $false

        ExecuteNonQuery $Global:StoreProcedure.UpdateUsersTable -Procedure $true
#>

function ExecuteNonQuery() {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        $Name,
        [bool]$Procedure = $true,
        [bool]$Stage = $true
    )

    Begin {
        $sqlConnection = Open-SqlConnection $Stage
    }
    Process {
        try {
            $sqlTransaction = $sqlConnection.BeginTransaction();

            [System.Data.SqlClient.SqlCommand] 
            $sqlCommand = New-object System.Data.SqlClient.SqlCommand;
            
            $sqlCommand.CommandTimeout = 0;
            $sqlCommand.Transaction = $sqlTransaction
            $sqlCommand.Connection = $sqlConnection;
            $sqlCommand.CommandText = $Name;

            if ($IsProcedure) {
                $sqlCommand.CommandType = [System.Data.CommandType]::StoredProcedure;
            }

            $rowsAffected = $sqlCommand.ExecuteNonQuery();

            $sqlTransaction.Commit()
            return $rowsAffected;
        }
        catch [System.Data.SqlClient.SqlException] { 
            $sqlTransaction.Rollback()
            Write-Exception -ErrorObj $_ -Message "Throws an '[System.Data.SqlClient.SqlException]' in 'ExecuteNonQuery'" -Stop $true
        }
        catch {
            $sqlTransaction.Rollback()
            Write-Exception -ErrorObj $_ -Message "Throws an SqlException in 'ExecuteNonQuery'" -Stop $true
        }
        finally {
            Close-SqlConnection -Connection $sqlConnection
        }
    }
    End {
    }
}