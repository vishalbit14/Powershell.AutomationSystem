$Global:RootPath = Split-Path $PSScriptRoot -Parent

$PSVersion = $PSVersionTable.PSVersion.Major
Import-Module $PSScriptRoot\..\AutomationSystem -Force

Describe "Automation-System PS$PSVersion Integrations tests" {
    Set-StrictMode -Version latest
    
    $XmlFolderPath = "$Global:RootPath\Uploads\XMLs"
    if (Test-Path $XmlFolderPath) {
        Start-AutomationProcess -XmlFolderPath $XmlFolderPath -Name "Users"
    }
    else {
        Write-Information -Message "Directory Path Not exists: $XmlFolderPath" -InformationAction Continue
    }
}
 