# Script:     Size Folder on Servers & Workstations
# Purpose:    This script print the size of folder on a remote/s machine
# Author:   Diego Messiah | https://github.com/diegomessiah

$dataColl = @()
foreach ($serverName in (get-content .\servers.txt)) #Recolect the name of list computers on file txt
{
       $path = "\\$serverName\c$\temp" #(i.e. folder temp)
       $dirSize = Get-ChildItem $path -recurse -force | select Length  |Measure-Object -Sum length
       $dirSize.sum = $dirSize.sum/1MB # folders more bigger than 1MB
       $finalResult = "{0:N2} MB" -f $dirSize.sum
       $dataObject = New-Object PSObject
       Add-Member -inputObject $dataObject -memberType NoteProperty -name "ServerName" -value $serverName
       Add-Member -inputObject $dataObject -memberType NoteProperty -name "Dir_Size" -value $finalResult
       $dataColl += $dataObject  
       $dataObject
}
$dataColl | Out-GridView -Title "Remote Directory Scan Results"
$dataColl | Export-Csv -noTypeInformation -path .\SizeFolderOnServer.csv
