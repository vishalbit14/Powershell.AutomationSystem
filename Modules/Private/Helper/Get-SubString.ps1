<#
    .SYNOPSIS
        Substring based on the Start and Length value of any string.

    .DESCRIPTION
        Substring based on the Start and Length value of any string. However, Handling the Substring $null value and also used with the Default length. So, overwhelmed the exception in any of the cases.

    .PARAMETER String*
        The string to extract from

    .PARAMETER Start
        Optional, The start position. Default is 0.

    .PARAMETER Length
        Optional, The number of characters to extract. Default is 100.

    .OUTPUTS
        Returns extracts characters from a $String based on the $Start and $Length.

    .EXAMPLE
        Get-SubString -String 'This is substring function. This is extracted string' -Start 0 -Length 27
#>
function Get-SubString() {
    [cmdletbinding()]
    Param (
        [string] $String = '',
        [int]$Start = 0,
        [int]$Length = 100
    )
    Begin {
    }
    Process {
        try {
            if (($String.Length -eq 0) -or ($Start -le 0) -or ($Length -le 0)) {
                return '';
            }

            if ($String.Length -gt $Length) {
                return $String.Substring($Start, $Length)
            }
            else {
                return $String;
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-SubString'" -Stop $true
        }
        finally {
        }
    }
    End {
    }
}