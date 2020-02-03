<#
    .SYNOPSIS
        Returns $Value or 0 if value is $null.

    .DESCRIPTION
        Returns $Value or 0 if value is $null.

    .PARAMETER Value
        int, empty or $null.

    .OUTPUTS
        int

    .EXAMPLE
        Reset-ToValidInt -Value ''
#>
function Reset-ToValidInt() {
    [cmdletbinding()]
    Param (
        $Value
    )
    Begin {
    }
    Process {
        try {
            if ([int]$Value.Length -le 0) {
                $Value = 0
            }
            return [int]$Value;
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Reset-ToValidInt'" -Stop $false
            return 0;
        }
        finally {
        }
    }
    End {
    }
}