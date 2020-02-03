# Powershell.AutomationSystem
Powershell Automation System has a collection of useful PowerShell modules and scripts. In Powershell.AutomationSystem, you can find mostly all the common functions for processing a XMLs files and transform into the SQL database. You can handle the whole process with the distinct to the Production and Stage database with either using of the DataTable or QueryStatements. Also, handle the logs files for the step by step process and adds the exception logs file when throws an any exception.


# SQL-Modules
Please check below to the list of SQL modules overview and their usage.

<h4/>Get-ConnectionString</h4>
<p>Returns Database connection string either Production/Stage based on '$Stage' flag. Please click <a href="Modules/Private/SQLModules/Get-ConnectionString.ps1">here</a> to check parameter details.</p>

<h4/>Set-ConnectionString</h4>
<p>Set the Connection string Globally of the Production and Staging and <b>Get-ConnectionString</b> function return the connection string. Please click <a href="Modules/Private/SQLModules/Set-ConnectionString.ps1">here</a> to check parameter details.</p>

<h4/>Open-SqlConnection</h4>
<p>Open a new SQL Connection object based on the $Stage flag for the Stage or Production database. Please click <a href="Modules/Private/SQLModules/Open-SqlConnection.ps1">here</a> to check parameter details.</p>

<h4/>Close-SqlConnection</h4>
<p>SQL Connection should be closed if no longer required. It will automatically handles and closed the current SQL connection when there is no longer needs. Please click <a href="Modules/Private/SQLModules/Close-SqlConnection.ps1">here</a> to check parameter details.</p>

<h4/>ExecuteNonQuery</h4>
<p>Execute the INSERT, UPDATE, DELETE Statement or Store procedure. You can execute either SQL query or Procedure based on the functions parameters. Please click <a href="Modules/Private/SQLModules/ExecuteNonQuery.ps1">here</a> to check parameter details.</p>

<h4/>ExecuteQueryResults</h4>
<p>Execute the Query Statements or Stored procedure with parameter and returns a result. Please click <a href="Modules/Private/SQLModules/ExecuteQueryResults.ps1">here</a> to check parameter details.</p>

<h4/>Write-BulkData</h4>
<p>Insert the bulk data to SQL Server database tables. However, the data source is not limited to SQL Server; any data source can be used, as long as the data can be loaded to a DataTable instance or read with  IDataReader instance. Please click <a href="Modules/Private/SQLModules/Write-BulkData.ps1">here</a> to check parameter details.</p>


# Common
Please check below to the list of Common modules overview and their usage.

<h4/>Get-CountryCode</h4>
<p>Get Country code from the string. However, The string can be either Address Line or full country name. Please click <a href="Modules/Private/Common/Get-CountryCode.ps1">here</a> to check parameter details and examples.</p>


<h4/>Initialize-ConfigSettings</h4>
<p>Load the Default Settings of the System. Loading the Default Settings at the very begging of the system and can use the global settings to the whole system. Currently, Reading from the Config.json file. Where to mention all the resources, connections, and other configs. Please click <a href="Modules/Private/Common/Initialize-ConfigSettings.ps1">here</a> to check how to loads default configs and example for how to use configs.</p>


<h4/>Initialize-GlobalObjects</h4>
<p>Initialize the global objects. However, we are using those objects while processing the bunch of XMLs files in one go. So, Global objects holds the table data until the save and clear once bunch of data save. Please click <a href="Modules/Private/Common/Initialize-GlobalObjects.ps1">here</a> to check how to intialize globals and example for how to use them.</p>


<h4/>Remove-OnRequest</h4>
<p>Used for the remove files or folders from Explorer. However remove items from either directly using file path, files which contain a list of file paths, directory, and Object which contains a list of the path. Please click <a href="Modules/Private/Common/Remove-OnRequest.ps1">here</a> to check parameter details and examples.</p>


<h4/>Write-Exception</h4>
<p>Write the exception logs in the exception log file. When throws an exception in the system we are handling the write the exception message and stack trace in the exception log file. which is generating based on the current date. Please click <a href="Modules/Private/Common/Write-Exception.ps1">here</a> to check parameter details and examples.</p>


<h4/>Write-FilePathsFromDirectory</h4>
<p>Write the list of paths into the text file from the directory. However, Get all child items from directory either from subfolders and writes the file paths into the given file location. Please click <a href="Modules/Private/Common/Write-FilePathsFromDirectory.ps1">here</a> to check parameter details and examples.</p>


<h4/>Write-LogInfo</h4>
<p>Write the execution logs information into the log file. Write the step by step log information for the usage of tracking or keep as how the process goes on. We write the logs based on the needs and some messages only print in cmdlet to check the current status of the execution and important steps are written into the log file for later use. Please click <a href="Modules/Private/Common/Write-LogInfo.ps1">here</a> to check parameter details and examples.</p>


<h4/>Write-WatchLog</h4>
<p>Write the exact time of the execution process. However, When starting the process $Timer would start and stop when process execution is finished. Also, Can able to add into the logs file as well based on the $Write flag. Please click <a href="Modules/Private/Common/Write-WatchLog.ps1">here</a> to check parameter details and examples.</p>


# Helper
Please check below to the list of Helper modules overview and their usage.

<h4/>Create-Directory</h4>
<p>Create a directory into the system. However, If given path directory does not exist into the system then create a new directory at given $Path. Please click <a href="Modules/Private/Helper/Create-Directory.ps1">here</a> to check parameter details and examples.</p>


<h4/>Create-File</h4>
<p>Create a file into the system. However, If given path file does not exist into the system then create a new file at given $Path. Please click <a href="Modules/Private/Helper/Create-File.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-DateTimeFromString</h4>
<p>Convert the date-time string into the DateTime. However, Parse the date from the $String and $Format and return DateTime. Note that, return $null if $String or $Format is not valid. Please click <a href="Modules/Private/Helper/Get-DateTimeFromString.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-FirstOrDefault</h4>
<p>Select the First record from the list of the object. Please click <a href="Modules/Private/Helper/Get-FirstOrDefault.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-LastOrDefault</h4>
<p>Select the Last record from the list of the object.. Please click <a href="Modules/Private/Helper/Get-LastOrDefault.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-StringFromDateTime</h4>
<p>Convert the DateTime into the string based on the $Date and $Format. Note that, return $null if $Date or $Format is not valid. Please click <a href="Modules/Private/Helper/Get-StringFromDateTime.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-SubString</h4>
<p>Substring based on the Start and Length value of any string. However, Handling the Substring $null value and also used with the Default length. So, overwhelmed the exception in any of the cases. Please click <a href="Modules/Private/Helper/Get-SubString.ps1">here</a> to check parameter details and examples.</p>


<h4/>Get-Type</h4>
<p>Get the valid type from the TypeName string. Please click <a href="Modules/Private/Helper/Get-Type.ps1">here</a> to check parameter details and examples.</p>


<h4/>New-Date</h4>
<p>Returns the date based format or default date format. $Format and other any of the. Please click <a href="Modules/Private/Helper/New-Date.ps1">here</a> to check parameter details and examples.</p>


<h4/>Out-DataTable</h4>
<p>Converts a Object list into the DataTable. Please click <a href="Modules/Private/Helper/Out-DataTable.ps1">here</a> to check parameter details and examples.</p>


<h4/>Reset-ToNull</h4>
<p>Returns a $null. Used for the assign $null value to any properties. Please click <a href="Modules/Private/Helper/Reset-ToNull.ps1">here</a> to check parameter details and examples.</p>


<h4/>Reset-ToNullIfEmpty</h4>
<p>Returns a string or $null if empty. Please click <a href="Modules/Private/Helper/Reset-ToNullIfEmpty.ps1">here</a> to check parameter details and examples.</p>


<h4/>Reset-ToValidInt</h4>
<p>Returns $Value or 0 if value is $null. Please click <a href="Modules/Private/Helper/Reset-ToValidInt.ps1">here</a> to check parameter details and examples.</p>


<h4/>Reset-ToValidString</h4>
<p>Returns a string with fixing the single quote or empty string converting $Value. Please click <a href="Modules/Private/Helper/Reset-ToValidString.ps1">here</a> to check parameter details and examples.</p>


<h4/>Reset-ToZeroStringIfNull</h4>
<p>Returns $Value or '0' if $Value is null or empty. Please click <a href="Modules/Private/Helper/Reset-ToZeroStringIfNull.ps1">here</a> to check parameter details and examples.</p>


# Controllers
Please check below to the list of Controllers modules overview and their usage.

<h4/>Start-XMLFileProcess</h4>
<p>A process on XML file for the inserting records in respective tables. However, Read the XML based on the nodes and calling the respective class and split the data into the class methods and assign it to the respective global table objects. Please click <a href="Modules/Private/Controllers/Start-XMLFileProcess.ps1">here</a> to check parameter details and examples.</p>

<h4/>Save-DatabaseTableData</h4>
<p>Call to Save data into the database to all Global objects here. Please click <a href="Modules/Private/Controllers/Save-DatabaseTableData.ps1">here</a> to check parameter details and examples.</p>

# Public
Public is the starting point of the processing on XMLs. Calling from the <b>AutomationSystem.Tests.ps1</b>

<h4/>Start-AutomationProcess</h4>
<p>Call to Save data into the database to all Global objects here. Please click <a href="Modules/Public/Start-AutomationProcess.ps1">here</a> to check parameter details and examples.</p>

# Config.json
Config.json holds all the system settings in json format. Currently, Stored configuration such as resources, connections, and other configs

# Tests
Loads all the modules before start the process

<h4/>AutomationSystem.Tests</h4>
<p>Call to Save data into the database to all Global objects here. Please click <a href="Tests/AutomationSystem.Tests.ps1">here</a> to check how to execute and parameter details.</p>


# Uploads
Uploads directory holds all the log informations of executions and exceptions.
