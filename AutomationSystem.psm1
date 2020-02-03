#Fetch all public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Modules\Public\* -Include @("*.ps1") -recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Modules\Private\* -Include @("*.ps1") -recurse -ErrorAction SilentlyContinue )

#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

#Export all modules members
Export-ModuleMember -Function $Public.Basename