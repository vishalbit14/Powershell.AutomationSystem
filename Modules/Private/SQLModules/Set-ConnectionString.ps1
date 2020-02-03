<#
    .SYNOPSIS
        Set the Connection string Globally for the Production and Staging

    .DESCRIPTION
        Set the Connection string Globally for the Production and Staging.

    .OUTPUTS
        string

    .EXAMPLE
        Set-ConnectionString
#>

function Set-ConnectionString() {
    Param()
    Begin {
    }
    Process {
        if ($Global:ProductionConnectionString.length -eq 0 -or $Global:StageConnectionString.length -eq 0 ) {
            $configPath = $Global:RootPath + $Global:Resources.ConfigJsonPath
            $configs = Get-Content "$configPath" -Raw -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue | ConvertFrom-Json | Select-Object -Property "DatabaseConfiguration" -ErrorAction:SilentlyContinue -WarningAction:SilentlyContinue
            $dbConfiguration = @{
                UserName        = '';
                Password        = '';
                ServerName      = '';
                DatabaseName    = '';
                ApplicationName = '';
            }
        
            $dbConfiguration.UserName = $configs.DatabaseConfiguration.Stage.UserName;
            $dbConfiguration.Password = $configs.DatabaseConfiguration.Stage.Password;
            $dbConfiguration.ServerName = $configs.DatabaseConfiguration.Stage.ServerName;
            $dbConfiguration.DatabaseName = $configs.DatabaseConfiguration.Stage.DatabaseName;
            $dbConfiguration.ApplicationName = $configs.DatabaseConfiguration.Stage.ApplicationName;

            $Global:StageConnectionString = "User ID=" + $dbConfiguration.UserName + 
            ";Password=" + $dbConfiguration.Password + 
            ";server=" + $dbConfiguration.ServerName + 
            ";database=" + $dbConfiguration.DatabaseName + 
            ";Application Name=" + $dbConfiguration.ApplicationName
            
            $dbConfiguration.UserName = $configs.DatabaseConfiguration.Production.UserName;
            $dbConfiguration.Password = $configs.DatabaseConfiguration.Production.Password;
            $dbConfiguration.ServerName = $configs.DatabaseConfiguration.Production.ServerName;
            $dbConfiguration.DatabaseName = $configs.DatabaseConfiguration.Production.DatabaseName;
            $dbConfiguration.ApplicationName = $configs.DatabaseConfiguration.Production.ApplicationName;

            $Global:ProductionConnectionString = "User ID=" + $dbConfiguration.UserName + 
            ";Password=" + $dbConfiguration.Password + 
            ";server=" + $dbConfiguration.ServerName + 
            ";database=" + $dbConfiguration.DatabaseName + 
            ";Application Name=" + $dbConfiguration.ApplicationName
        }
    }
    End {
    }
}