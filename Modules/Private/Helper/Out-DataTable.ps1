<# 
    .SYNOPSIS 
        Converts a Object list into the DataTable.
        
    .DESCRIPTION 
        Converts a Object list into the DataTable.
        
    .PARAMETER Object
        Pass Object
        
    .OUTPUTS 
        System.Data.DataTable 
        
    .EXAMPLE 
        Out-DataTable $ObjectList
        Converts a Object list into the DataTable from the object properties and assigns output to $dt variable .
#> 

function Out-DataTable { 
    [CmdletBinding()] 
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $true)] 
        [PSObject[]]$InputObject
    ) 
    Begin { 
        $dt = new-object Data.datatable   
        $First = $true  
    } 
    Process { 
        try {
            if ($InputObject.Count -le 0) {
                return $null;
            }
            foreach ($object in $InputObject) { 
                $DR = $DT.NewRow()   
                foreach ($property in $object.PsObject.get_properties()) {
                    if ($first) {   
                        $Col = new-object Data.DataColumn   
                        $Col.ColumnName = $property.Name.ToString()   
                        if ($property.value) { 
                            if ($property.value -isnot [System.DBNull]) { 
                                $Col.DataType = [System.Type]::GetType("$(Get-Type $property.TypeNameOfValue)")
                            } 
                        } 
                        $DT.Columns.Add($Col) 
                    }   
                    if ($property.Gettype().IsArray) { 
                        $DR.Item($property.Name) = $property.value | ConvertTo-XML -AS String -NoTypeInformation -Depth 1 
                    }   
                    else { 
                        switch ($property.TypeNameOfValue) {
                            "System.String" { 
                                $DR.Item($property.Name) = Reset-ToValidString $property.value;
                                Break;
                            }
                            "System.Int16" { 
                                $DR.Item($property.Name) = Reset-ToZeroStringIfNull $property.value;
                                Break;
                            }
                            "System.Int32" { 
                                $DR.Item($property.Name) = Reset-ToZeroStringIfNull $property.value;
                                Break;
                            }
                            "System.Int64" { 
                                $DR.Item($property.Name) = Reset-ToZeroStringIfNull $property.value;
                                Break;
                            }
                            Default { 
                                $DR.Item($property.Name) = Reset-ToZeroStringIfNull $property.value;
                                Break;
                            }
                        }
                    } 
                }   
                $DT.Rows.Add($DR)   
                $First = $false 
            } 
            return @(, ($dt))
        }
        catch {
            Write-Exception $_ "Throws an exception in 'OUT-DataTable'" $true
        }
    }  
    End { 
    } 
}