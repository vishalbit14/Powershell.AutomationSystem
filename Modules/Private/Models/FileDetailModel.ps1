<#
    .Description
        FileDetailModel holds the file details
#>
class FileDetailModel {
    [string]$FileName
    [string]$FileExtention
    [string]$FullPath

    FileDetailModel([string]$filePath) {
        $this.FileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath);
        $this.FileExtention = [System.IO.Path]::GetExtension($filePath);
        $this.FullPath = $filePath;
    }
}