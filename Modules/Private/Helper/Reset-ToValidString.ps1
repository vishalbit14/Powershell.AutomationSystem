<#
    .SYNOPSIS
        Returns a string with fixing the single quote or empty string converting $Value.

    .DESCRIPTION
        Returns a string with fixing the single quote or empty string converting $Value

    .PARAMETER Value
        String or $null value.

    .OUTPUTS
        string

    .EXAMPLE
        Reset-ToValidString -Value "I'm here!"
#>
function Reset-ToValidString() {
    [cmdletbinding()]
    Param (
        $Value
    )
    Begin {
        $result = '';
    }
    Process {
        try {
            if ($null -ne $Value -and $Value.Length -gt 0) {
                # replace any single quote in the string with **TWO** single quotes
                $result = $Value -replace "'", "''"
            }
            else {
                if ($null -eq $Value) {
                    # If the value was null then set the result to an empty string
                    $result = ''
                } 
                else {
                    # if the result is already and empty string, then leave it alone. 
                    $result = $Value
                }
            }
            return $result
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Reset-ToValidString'" -Stop $false
            return ''
        }
        finally {
        }
    }
    End {
    }
}