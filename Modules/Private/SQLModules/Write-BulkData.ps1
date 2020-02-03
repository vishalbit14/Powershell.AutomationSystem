<# 
    .SYNOPSIS 
        Insert the bulk data to SQL Server database tables.

    .DESCRIPTION 
        Insert the bulk data to SQL Server database tables. However, the data source is not limited to SQL Server; any data source can be used, as long as the data can be loaded to a DataTable instance or read with  IDataReader instance. 

    .PARAMETER TableName*
        REquired. Destination Table Name.

    .PARAMETER Data*
        REquired. Source DataTable list of records.

    .PARAMETER BatchSize
        Default value 50000, Number of rows as the count parameter value to process from rows of source data

    .PARAMETER Timeout
        Default value 0, Seconds 0 (zero) = no timeout limit

    .PARAMETER Stage
        Optional. If $false create a connection for the Production database. Default value is $true.

    .OUTPUTS  
        Produces no output 
#> 

function Write-BulkData { 
    [CmdletBinding()] 
    Param( 
        [Parameter(Position = 0, Mandatory = $true)] [string]$TableName, 
        [Parameter(Position = 1, Mandatory = $false)] $Data, 
        [Parameter(Position = 2, Mandatory = $false)] [Int32]$BatchSize = 50000, 
        [Parameter(Position = 3, Mandatory = $false)] [Int32]$Timeout = 0, 
        [Parameter(Position = 4, Mandatory = $false)] [bool]$Stage = $true
    ) 
    Begin {
        $connectionString = Get-ConnectionString -Stage $Stage;
    }
    Process {
        try {
            if ($Data.Rows.Count -le 0) {
                Write-LogInfo -Message "Skip bulk data execution because $TableName has no Data";
                return;
            }

            $BulkCopy = New-Object ("Data.SqlClient.SqlBulkCopy") $connectionStrings;
            $BulkCopy.BatchSize = $BatchSize;
            $BulkCopy.BulkCopyTimeout = $Timeout;
            $BulkCopy.DestinationTableName = $TableName;
            $BulkCopy.WriteToServer($Data);
            $BulkCopy.Dispose();
            $BulkCopy.Close();
        } 
        catch { 
            Write-Exception $_ "Throws an exception at, 'Write-BulkData' - the time of excuting of $TableName" $true
        } 
        finally {
        }
    }
    End {
    }
}