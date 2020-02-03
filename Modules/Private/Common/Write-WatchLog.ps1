<#
    .SYNOPSIS
        Write the exact time of the execution process.

    .DESCRIPTION
        Write the exact time of the execution process. However, When starting the process $Timer would start and stop when process execution is finished. Also, Can able to add into the logs file as well based on the $Write flag.

    .PARAMETER Timer
        Default $true, If $false timer will be stopped. Note that, Timer will be reset every time before starting.

    .PARAMETER Message
        Optional, Custom string message.

    .OUTPUTS
        Display the start or execution taken time on cmdlet and also, write into the log file based on a $Write flag.

    .EXAMPLE
        Write-WatchLog -Timer $true -Message "Daily user XMLs batch process has been started!" -Write $true
        Write-WatchLog -Timer $false -Message "Daily user XMLs batch process has been finished!" -Write $true
#>

function Write-WatchLog() {	
    [cmdletbinding()]
    Param (
        [bool]$Timer = $true,
        [string]$Message,
        [bool]$Write
    )

    Begin {
        if ($null -eq $Global:Timer) {
            $Global:Timer = New-Object System.Diagnostics.Stopwatch;
        }
    }
    Process {
        try {
            if ($Timer -eq $true) {
                $Global:Timer.Reset();

                $Global:Timer.Start();
                Write-LogInfo -Message "Execution start at: $("{0:$($Global:Resources.FullDateTimeFormat)}" -f (Get-Date))" -Write $Write
            }
            else {
                $Global:Timer.Stop();
                Write-LogInfo -Message "Execution taken time: $("{0:$($Global:Resources.DisplayTimeFormat)}" -f ([datetime]$Global:Timer.Elapsed.Ticks))" -Write $Write
            }
            if ($Message.Length -gt 0) {
                Write-LogInfo -Message $Message -Write $Write
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'Write-WatchLog'" -Stop $true
        }
        finally { }
    }
    End {
    }
}