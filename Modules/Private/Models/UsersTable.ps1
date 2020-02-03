<#
    .Description
        Class created for the handling $($Global:DbTable.UsersTable) table operation
#>
class UsersTable {
    [int]$UserId
    [string]$UserCode
    [ValidatePattern("^[a-z]+$")]
    [string]$FirstName
    [ValidatePattern("^[a-z]+$")]
    [string]$LastName
    [ValidatePattern("^[\w-']+(\.[\w-']+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$")]
    [string]$Email
    [string]$AddressLine1
    [string]$AddressLine2
    [string]$Country
    [string]$State
    [string]$City
    [string]$PostCode
    [boolean]$IsActive
    [datetime]$CreatedDate
    [datetime]$ModifiedDate

    UsersTable() {
        $this.CreatedDate = Get-Date
        $this.ModifiedDate = Get-Date
    }

    Static [void] ToObjectList($user_node) {
        try {
            foreach ($property in $user_node) {
                $userObj = [UsersTable]::new();
                $userObj.UserCode = $property."user-code";
                $userObj.FirstName = $property."first-name";
                $userObj.LastName = $property."last-name";
                $userObj.Email = $property."email";
                $userObj.AddressLine1 = $property."addressbook"."addressline1";
                $userObj.AddressLine2 = $property."addressbook"."addressline2";
                $userObj.Country = Get-CountryCode -Value $property."addressbook"."country";
                $userObj.State = $property."addressbook"."state";
                $userObj.City = $property."addressbook"."city";
                $userObj.PostCode = Reset-ToNullIfEmpty $property."addressbook"."postcode";
                $userObj.IsActive = $true;
                    
                $Global:UsersTableObject += $userObj;
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Exception while $($Global:DatabaseTable.UsersTable) Object processing" -Stop $true
        }
    }

    Static [void] ToQueryList($user_node) {
        try {
            foreach ($property in $user_node) {
                $sqlQuery = $("'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}'" -f 
                    $property."user-code",
                    $property."first-name",
                    $property."last-name",
                    $property."email",
                    $(Reset-ToValidString $property."addressbook"."addressline1"),
                    $(Reset-ToValidString $property."addressbook"."addressline2"),
                    $(Get-CountryCode -Value $property."addressbook"."country"),
                    $property."addressbook"."state",
                    $property."addressbook"."city",
                    $(Reset-ToNullIfEmpty $property."addressbook"."postcode"),
                    $true,
                    $(New-Date),
                    $(New-Date)
                );

                if ($Global:UsersTableSqlQuery.Length -eq 0) {
                    $Global:UsersTableSqlQuery = "SELECT " + $sqlQuery;
                }
                else {
                    $Global:UsersTableSqlQuery += " UNION ALL SELECT " + $sqlQuery;
                }
            }
        }
        catch {
            Write-Exception -ErrorObj $_ -Message "Exception while $($Global:DatabaseTable.UsersTable) Query processing" -Stop $true
        }
    }
}