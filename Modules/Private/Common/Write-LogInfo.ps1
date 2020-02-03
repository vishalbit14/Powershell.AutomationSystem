<#
    .SYNOPSIS
        Write the execution logs information into the log file.

    .DESCRIPTION
        Write the execution logs information into the log file. Write the step by step log information for the usage of tracking or keep as how the process goes on. We write the logs based on the needs and some messages only print in cmdlet to check the current status of the execution and important steps are written into the log file for later use.

    .PARAMETER Message
        Optional, Custom string message.

    .PARAMETER Separator
        Default $false, If $true Add a separator with the full date-time format for the important task has been started and The separator can easily to eye-catching.

    .PARAMETER Write
        Default $false, If $true write the logs information in log file. File generate at '/Uploads/Logs/Log_{CurrentDate}.txt'

    .PARAMETER Stop
        Default $false, If $true execution will be stopped.

    .OUTPUTS
        Display the message on cmdlet and Write the log information into the log file. File generate at '/Uploads/Logs/Log_{CurrentDate}.txt'

    .EXAMPLE
        Write-LogInfo -Message "Started the important task here.!" -Separator $true
        Write-LogInfo -Message "Records has been inserted in Userstable." -Write $true
        Write-LogInfo -Message "Records are not found in UsersTable." -Write $true -Stop $true
#>

function Write-LogInfo() {	
    [cmdletbinding()]
    Param (
        [Parameter(Position = 0)]
        [string]$Message,
        [bool]$Separator = $false,
        [bool]$Write = $false,
        [bool]$Stop = $false
    )

    Begin {
    }
    Process {
        try {
            if ($Write -eq $true -or $Separator -eq $true) {
                $currentDate = (Get-Date).ToString($Global:Resources.DateFormat);
                $logFilePath = Create-File -FolderPath "$($Global:RootPath+$Global:Resources.LogPath)" -FileName "Log_$currentDate.txt"
        
                if ($logFilePath.GetType().Name -ne 'String') {
                    $logFilePath = Get-LastOrDefault $logFilePath
                }

                if ($Separator) {
                    $txtSeparator = "------------------------------$("{0:dd/MM/yyyy HH:mm:ss.fff}" -f (Get-Date))------------------------------"
                    $txtSeparator | Out-File $logFilePath -Append -Encoding oem
                }
                (Get-Date).ToString() + ": " + $Message | Out-File $logFilePath -Append -Encoding oem
                Write-Information -Message $Message -InformationAction Continue
    
                IF ($Stop) {
                    EXIT
                }
            }
            else {
                Write-Information -Message $Message -InformationAction Continue
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Write-LogInfo'" -Stop $true
        }
    }
    End {
    }
}