$Global:RootPath = Split-Path $PSScriptRoot -Parent

$PSVersion = $PSVersionTable.PSVersion.Major
Import-Module $PSScriptRoot\..\AutomationSystem -Force

Describe "Automation-System PS$PSVersion Integrations tests" {
    Set-StrictMode -Version latest
    
    Start-AutomationProcess
}
 