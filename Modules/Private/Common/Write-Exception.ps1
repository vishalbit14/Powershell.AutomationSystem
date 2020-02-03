<#
    .SYNOPSIS
        Write the exception logs in the exception log file.

    .DESCRIPTION
        Write the exception logs in the exception log file. When throws an exception in the system we are handling the write the exception message and stack trace in the exception log file. which is generating based on the current date.

    .PARAMETER ErrorObj
        Optional, Stack trace of the exception.

    .PARAMETER Message
        Optional, Custom string message.

    .PARAMETER Stop
        Default $false, If $true execution will be stopped.

    .OUTPUTS
        Write the exception into the exception file. File generate at '/Uploads/Logs/Exception_{CurrentDate}.txt'

    .EXAMPLE
        Write-Exception -ErrorObj $_ -Message "Scripts will be stop execution" -Stop $true
        Write-Exception -ErrorObj $_ -Message "Scripts will be contniue after logging the exception details" -Stop $false
#>
function Write-Exception() {	
    [cmdletbinding()]
    Param (
        $ErrorObj,
        $Message,
        [bool]$Stop = $false
    )

    Begin {
    }
    Process {
        $currentDate = (Get-Date).ToString($Global:Resources.DateFormat);
        $errorLogFilePath = Create-File -FolderPath "$($Global:RootPath+$Global:Resources.LogPath)" -FileName "Exception_$currentDate.txt"
    
        #Check this condition because when file not exists and create new one, It's returning Array so needs to select last-one
        if ($errorLogFilePath.GetType().Name -ne 'String') {
            $errorLogFilePath = Get-LastOrDefault $errorLogFilePath
        }

        $separator = "------------------------------$(Get-Date)---Stopped: $Stop------------------------------"
        $separator | Out-File $errorLogFilePath -Append -Encoding oem
        $Message | Out-File $errorLogFilePath -Append -Encoding oem

        if ($null -ne $ErrorObj) {
            "Error Message: " + $ErrorObj.Exception.Message | Out-File $errorLogFilePath -Append -Encoding oem
            $ErrorObj[0] | Format-List -Force | Out-File $errorLogFilePath -Append -Encoding oem
        }
        Write-Information -Message $Message -InformationAction Continue

        if ($Stop) {
            EXIT
        }
    }
    End {
    }
}