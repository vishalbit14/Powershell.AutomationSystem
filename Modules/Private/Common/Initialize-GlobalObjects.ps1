<#
    .SYNOPSIS
        Initialize the global objects

    .DESCRIPTION
        Initialize the global objects. However, we are using those objects while processing the bunch of XMLs files in one go. 
        So, Global objects holds the table data until the save and clear once bunch of data save.

    .EXAMPLE
        Initialize-GlobalObjects
#>
function Initialize-GlobalObjects() {
    Begin {
    }
    Process {
        if ($Global:Resources.IsDataTable) {
            $Global:UsersTableObject = @();
        }
        else {
            $Global:UsersTableSqlQuery = '';
        }
    }
    End {
    }
}