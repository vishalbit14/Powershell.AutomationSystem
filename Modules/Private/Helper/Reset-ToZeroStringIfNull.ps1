<#
    .SYNOPSIS
        Returns $Value or '0' if $Value is null or empty.

    .DESCRIPTION
        Returns $Value or '0' if $Value is null or empty.

    .PARAMETER Value
        String or $null value.

    .OUTPUTS
        string

    .EXAMPLE
        Reset-ToZeroStringIfNull -Value ""
#>
function Reset-ToZeroStringIfNull() {
    [cmdletbinding()]
    Param (
        $Value
    )
    Begin {
    }
    Process {
        try {
            if ([string]::IsNullOrEmpty($Value)) {
                $Value = '0'
            }
            return $Value
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Reset-ToZeroStringIfNull'" -Stop $false
            return '0';
        }
        finally {
        }
    }
    End {
    }
}