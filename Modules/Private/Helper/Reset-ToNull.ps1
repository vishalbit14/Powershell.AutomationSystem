<#
    .SYNOPSIS
        Returns a $null

    .DESCRIPTION
        Returns a $null. Used for the assign $null value to any properties.

    .OUTPUTS
        Returns $null

    .EXAMPLE
        Reset-ToNull
#>
function Reset-ToNull() {
    [cmdletbinding()]
    Param ()
    Begin {
    }
    Process {
        return $null;
    }
    End {
    }
}