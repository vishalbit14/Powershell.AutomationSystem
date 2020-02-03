<#
    .SYNOPSIS
        Returns Database connection string based on the production and stage database.

    .DESCRIPTION
        Returns Database connection string based on the production and stage database.

    .PARAMETER Stage
        Optional. If $false create a connection for the Production database. Default value is $true.

    .OUTPUTS
        Returns the Connection string as per the Stage flag.

    .EXAMPLE
        Get-ConnectionString -Stage $true
#>

function Get-ConnectionString() {
    [cmdletbinding()]
    Param(
        [bool]$Stage = $true
    )
    Begin {
        Set-ConnectionString
    }
    Process {
        if ($Stage) {
            return $Global:StageConnectionString
        }
        else {
            return $Global:ProductionConnectionString
        }
    }
    End {
    }
}