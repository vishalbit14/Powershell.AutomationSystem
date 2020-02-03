<#
    .SYNOPSIS
        Select the First record from the list of the object.

    .DESCRIPTION
        Select the First record from the list of the object.

    .PARAMETER Object[]
        Optional. Passed the Object[]. A parameter is optional because of the handling $null object.

    .OUTPUTS
        Return the First records from the list of the object or return blank if object is $null.

    .EXAMPLE
        $ListItems = @()
        $ListItems += 'First Index'
        $ListItems += 'Second Index'
        $ListItems += 'Third Index'
        Get-FirstOrDefault -Object $ListItems 
#>
function Get-FirstOrDefault() {
    [cmdletbinding()]
    Param (
        [PSObject[]]$Object
    )

    Begin {
    }
    Process {
        try {
            if (($null -ne $Object) -and ($Object.Count -gt 0)) {
                return $Object[0];
            }
            else {
                return $Object;
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Get-FirstOrDefault'" -Stop $true
        }
    }
    End {
    }
}