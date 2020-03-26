# Script:	Permission Folder Table
# Purpose:  This script print the permission folder on shared folder
# Author:   Diego Messiah | https://github.com/diegomessiah

$FolderPath = dir -Directory -Path "\\FileServer\SharedFolder" -Recurse -Force
$Report = @()
Foreach ($Folder in $FolderPath) {
    $Acl = Get-Acl -Path $Folder.FullName
    foreach ($Access in $acl.Access)
        {
            $Properties = [ordered]@{'FolderName'=$Folder.FullName;'AD
Group or
User'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'Inherited'=$Access.IsInherited}
            $Report += New-Object -TypeName PSObject -Property $Properties
        }
}
$Report | Export-Csv -path ".\FolderPermissions.csv"
