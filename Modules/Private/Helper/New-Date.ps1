<#
    .SYNOPSIS
        Returns the date based format or default date format.

    .DESCRIPTION
        Returns the date based format or default date format. $Format and other any of the 

    .PARAMETER Format
        Optional. $Format must be the following of the $String string datetime format. Default format is 'dd MMMM yyyy hh:mm:ss'

    .PARAMETER Day
        The value parameter can be negative or positive.

    .PARAMETER Month
        A number of months. The months parameter can be negative or positive.

    .PARAMETER Year
        A number of years. The value parameter can be negative or positive.

    .PARAMETER Hour
        A number of whole and fractional hours. The value parameter can be negative or positive.

    .PARAMETER Minute
        A number of whole and fractional minutes. The value parameter can be negative or positive.

    .PARAMETER Second
        A number of whole and fractional seconds. The value parameter can be negative or positive.

    .PARAMETER Millisecond
        A number of whole and fractional milliseconds. The value parameter can be negative or positive. Note that this value is rounded to the nearest integer.

    .PARAMETER Ticks
        A number of 100-nanosecond ticks. The value parameter can be positive or negative.

    .OUTPUTS
        Return SQL DateTime with provided $Format or Default date-time format.

    .EXAMPLE
        New-Date -Format 'yyyy-MM-dd' -Day 1
        New-Date -Day 7
        New-Date -Month -3
        New-Date -Year 5
        New-Date -Hour 12
        New-Date -Minute 60
        New-Date -Second 360
        New-Date -Millisecond 36000
        New-Date -Ticks 360006
#>
function New-Date() {	
    Param (
        [string]$Format,
        [int]$Day,
        [int]$Month,
        [int]$Year,
        [double]$Hour,
        [double]$Minute,
        [double]$Second,
        [double]$Millisecond,
        [long]$Ticks
    )
    Begin {
        $newDate = Get-Date
    }
    Process {
        try {
            if ($Days -gt 0) { $newDate.AddDays($Day) }
            elseif ($Month -gt 0) { $newDate.AddMonths($Month) }
            elseif ($Year -gt 0) { $newDate.AddYears($Year) }
            elseif ($Hour -gt 0) { $newDate.AddHours($Hour) }
            elseif ($Minute -gt 0) { $newDate.AddMinutes($Minute) }
            elseif ($Second -gt 0) { $newDate.AddSeconds($Second) }
            elseif ($Millisecond -gt 0) { $newDate.AddMilliseconds($Millisecond) }
            elseif ($Ticks -gt 0) { $newDate.AddTicks($Ticks) }

            if ($Format.Length -gt 0) {
                return ([datetime]$newDate).ToString($Format);
            }
            return ([datetime]$newDate).ToString($Global:Resources.SQLDateTimeFormat);
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Throws an exception in 'New-Date'" -Stop $true
            return ([datetime]$newDate).ToString($Global:Resources.SQLDateTimeFormat);
        }
        finally { }
    }
    End {
    }
}