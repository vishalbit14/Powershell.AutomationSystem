<#
    .SYNOPSIS
    Load the Default Settings of the System.

    .DESCRIPTION
    Load the Default Settings of the System. Loading the Default Settings at the very begging of the system and can use the global settings to the whole system. Currently, Reading from the Config.json file. Where to mention all the resources, connections, and other configs.

    DatabaseConfiguration
    - DatabaseConfiguration has two separate objects Production and Staging. Both objects hold the Connection strings of the staging and production database.

    $Global:StageConfigs
    StageConfigs holds the staging database credentials and details

    $Global:ProductionConfigs
    ProductionConfigs holds the staging database credentials and details

    $Global:Resources
    Resources mainly hold those configurations which should be used for the basic settings, important flags, system global paths, validation regex, URLs, or many more which can be used at system config levels

    $Global:DatabaseTable
    DatabaseTable holds all table names, Later on, we can use tables names directly at multiple places and its good practice to all are on the same place to check and also saves us from changes on multiple changes.

    $Global:StoreProcedure
    StoreProcedure holds all stored procedures, Later on, we can use those stored procedure names directly at multiple places and its good practice to all are on the same place to check and also saves us from changes on multiple changes.
#>

function Initialize-ConfigSettings() {	
    Begin {
        Write-Information -Message "Application Root Path: $Global:RootPath" -InformationAction Continue

        $configFilePath = "$Global:RootPath\Modules\Config.json"
        Write-Information -Message "Application Config Settings file at: $configFilePath" -InformationAction Continue
    }
    Process {
        try {
            $configObject = Get-Content "$configFilePath" -Raw -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue | ConvertFrom-Json -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue
        
            if ($null -eq $configObject) {
                Write-Information -Message "Please check config location - either the Json is invalid (eg \ character not escaped) or the config file is missing)" -InformationAction Continue
                Break;
            }
            else {
                Write-Information -Message "Configuration read successfully from .json file at: $configFilePath" -InformationAction Continue
            }

            $Global:StageConfigs = $configObject.StageConfigs;
            Write-LogInfo -Message "Loading Stage Configuration: $Global:StageConfigs"
        
            $Global:ProductionConfigs = $configObject.ProductionConfigs;
            Write-LogInfo -Message "Loading Production Configuration: $Global:ProductionConfigs"

            $Global:Resources = $configObject.Resources;
            Write-LogInfo -Message "Loading Application Resources Name: $Global:Resources"

            $Global:DatabaseTable = $configObject.DatabaseTable;
            Write-LogInfo -Message "Loading Database Tables Name: $Global:DatabaseTable"
        
            $Global:StoreProcedure = $configObject.StoreProcedure;
            Write-LogInfo -Message "Loading Stored Procedures Name: $Global:StoreProcedure"
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Initialize-ConfigSettings'" -Stop $true
        }
        finally {
            Write-LogInfo -Message "Config settings loading successfully." -Write $true
        }
    }
    End { }
}