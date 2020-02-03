<#
    .SYNOPSIS
        Returns a string or $null if empty.

    .DESCRIPTION
        Returns a string or $null if empty.

    .PARAMETER Value
        String or $null value.

    .OUTPUTS
        $Value or $null

    .EXAMPLE
        Reset-ToNullIfEmpty -Value ''
#>
function Reset-ToNullIfEmpty() {
    [cmdletbinding()]
    Param (
        [string]$Value
    )
    Begin {
    }
    Process {
        try {
            if ([string]::IsNullOrEmpty($Value)) {
                return $null;
            }
            return $Value
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Reset-ToNullIfEmpty'" -Stop $false
            return $null;
        }
        finally {
        }
    }
    End {
    }
}