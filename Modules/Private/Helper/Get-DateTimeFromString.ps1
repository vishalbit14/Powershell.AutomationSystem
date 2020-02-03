<#
    .SYNOPSIS
        Convert the date-time string into the DateTime.

    .DESCRIPTION
        Convert the date-time string into the DateTime. However, Parse the date from the $String and $Format and return DateTime. Note that, return $null if $String or $Format is not valid.

    .PARAMETER String*
        Required. String must be date-time string with the following of the $Format. Return $null if the $Format is not valid.

    .PARAMETER Format
        Optional. $Format must be the following of the $String string datetime format. Default format is 'dd MMMM yyyy hh:mm:ss'

    .OUTPUTS
        Return DateTime or $null if $String or $Format is not valid.

    .EXAMPLE
        Get-DateTimeFromString -String '2010-12-12' -Format 'yyyy-MM-dd'
        Get-DateTimeFromString -String '10-2020' -Format 'MM-yyyy'
        Get-DateTimeFromString -String '31 January 2020 15:39:43'
#>
function Get-DateTimeFromString() {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$String,
        [string]$Format
    )
    Begin {
        if ($Format.Length -le 0) {
            $Format = $Global:Resources.DefaultDateTimeFormat;
        }
    }
    Process {
        try {
            return [datetime]::ParseExact($String, $Format, $null);
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-DateTimeFromString'" -Stop $false
            return $null;
        }
    }
    End {
    }
}