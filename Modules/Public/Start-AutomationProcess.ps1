<# 
    .SYNOPSIS 
        Start the Process for XML files.

    .DESCRIPTION 
        Start the Process for XML files.
#> 
function Start-AutomationProcess() {
    Begin {
        Clear-Host

        #Initialize default settings such as, default paths, sql table name, store procedures.
        Initialize-ConfigSettings
        #Fron this step, Use Write-LogInfo and Write-Exception for the log information and exception respectively.
        Initialize-GlobalObjects
    }
    Process {
        $processFileCount = 0;
        $fileIssueCount = 0;
        $totalFileProcessCount = 0;
        $isAllSave = $true;

        $xmlFolderPath = $Global:RootPath + $Global:Resources.XmlPath;
        $userTextFilePath = Get-LastOrDefault (Create-File -FolderPath $xmlFolderPath -FileName "users.txt");
        Write-FilePathsFromDirectory -FolderPath $xmlFolderPath -FilePath $userTextFilePath -Filter '*.xml'

        Get-Content $userTextFilePath | ForEach-Object {
            $xmlFilePath = $_;
            if (Test-Path $xmlFilePath) {
                Start-XMLFileProcess -FilePath $xmlFilePath
                $isAllSave = $false;
                $processFileCount++;
                $totalFileProcessCount++;

                if ($totalFileProcessCount -eq $Global:Resources.BatchSize) {
                    Save-ObjectData
                    $totalFileProcessCount = 0;
                    $isAllSave = $true;

                    Write-LogInfo -Message "Continue process to next $($Resources.XmlBatchSize) bunch of File Process." -Separator $true
                }
            }
            else {
                $fileDetail = [FileDetailModel]::new($xmlFilePath);
                $ProgressMessage = $('FileName: {0}, File not found at: {1}' -f $fileDetail.FileName, $fileDetail.FullPath);
                Write-LogInfo -Message $ProgressMessage -Separator $true
                $fileIssueCount++;
            }
        }
        if (!$isAllSave) {
            Save-DatabaseTableData
            $isAllSave = $true;

            Write-LogInfo -Message "Save the remaining table data from object of $($Resources.XmlBatchSize)" -Separator $true
        }
    }
    End {
    }
}