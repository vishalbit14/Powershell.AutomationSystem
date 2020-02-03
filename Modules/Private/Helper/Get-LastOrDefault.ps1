<#
    .SYNOPSIS
        Select the Last record from the list of the object.

    .DESCRIPTION
        Select the Last record from the list of the object.

    .PARAMETER Object[]
        Optional. Passed the Object[]. A parameter is optional because of the handling $null object.

    .OUTPUTS
        Return the last records from the list of the object or return blank if object is $null.

    .EXAMPLE
        $ListItems = @()
        $ListItems += 'First Index'
        $ListItems += 'Second Index'
        $ListItems += 'Third Index'
        Get-LastOrDefault -Object $ListItems
#>
function Get-LastOrDefault() {
    [cmdletbinding()]
    Param (
        [PSObject[]]$Object
    )
    Begin {
    }
    Process {
        try {
            if (($null -ne $Object) -and ($Object.Count -gt 0)) {
                return $Object[$Object.Count - 1];
            }
            else {
                return $Object;
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-LastOrDefault'" -Stop $true
        }
    }
    End {
    }
}