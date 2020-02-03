<#
    .DESCRIPTION
        Call to Save data into the database to all Global objects here.

    .EXAMPLE
        Save-DatabaseTableData
#>
function Save-DatabaseTableData() {
    Begin {
    }
    Process {
        try {
            if ($Global:Resources.IsDataTable) {
                Write-BulkData -TableName $Global:DatabaseTable.UsersTable -Data (Out-DataTable $Global:UsersTableObject);
            }
            else {
                $userDetailQuery = $("INSERT INTO {0} (UserCode,FirstName,LastName,Email,AddressLine1,AddressLine2,
                                        Country,State,City,PostCode,IsActive,CreatedDate,ModifiedDate)
                                    {1}" -f ($Global:DatabaseTable.UsersTable), ($Global:UsersTableSqlQuery));
                ExecuteNonQuery -Name $userDetailQuery -Procedure $false
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Save-DatabaseTableData'" -Stop $true
        }
        finally {
            Initialize-GlobalObjects
        }
    }
    End {
    }
}