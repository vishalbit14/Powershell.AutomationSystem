<#
    .SYNOPSIS
        Get the valid type from the TypeName string.

    .DESCRIPTION
        Get the valid type from the TypeName string.

    .PARAMETER Type
        Optional. TypeName string name.
    
    .OUTPUTS
        Return valid Type of the any object or properties

    .EXAMPLE
        Get-Type -Type 'System.Byte' 
        [System.Type]::GetType("$(Get-Type 'System.String')")
#>
function Get-Type { 
    param($Type) 
 
    $TypeList = @( 
        'System.Boolean', 
        'System.Byte[]', 
        'System.Byte', 
        'System.Char', 
        'System.Datetime', 
        'System.Decimal', 
        'System.Double', 
        'System.Guid', 
        'System.Int16', 
        'System.Int32', 
        'System.Int64', 
        'System.Single', 
        'System.UInt16', 
        'System.UInt32', 
        'System.UInt64') 
 
    if ( $TypeList -contains $Type ) { 
        Write-Output "$Type" 
    } 
    else { 
        Write-Output 'System.String' 
    } 
}