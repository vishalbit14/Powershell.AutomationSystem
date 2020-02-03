<#
    .SYNOPSIS
        Convert the DateTime into the string.

    .DESCRIPTION
        Convert the DateTime into the string based on the $Date and $Format. Note that, return $null if $Date or $Format is not valid.

    .PARAMETER Date*
        Required. Date must be valid DateTime. Return $null if the $Format is not valid.

    .PARAMETER Format
        Optional. Date format string. If $Format is $null, convert with the default DateTime string format.

    .OUTPUTS
        Return DateTime or $null if $Date or $Format is not valid.

    .EXAMPLE
        Get-StringFromDateTime '12 December 2010 00:00:00'
#>
function Get-StringFromDateTime() {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [datetime]$Date,
        [string]$Format
    )
    Begin {
        if ($Format.Length -le 0) {
            $Format = $Global:Resources.DefaultDateTimeFormat;
        }
    }
    Process {
        try {
            return ([datetime]$Date).ToString($Format);
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-StringFromDateTime'" -Stop $true
            return $null;
        }
    }
    End {
    }
}