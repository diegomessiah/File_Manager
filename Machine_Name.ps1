$ipaddress=Get-Content -Path .\ip.txt
$results = @()
# [System.Net.Dns]::GetHostByAddress($i).HostName
ForEach ($i in $ipaddress)
{
$o=new-object psobject
$o | Add-Member -MemberType NoteProperty -Name hostname -Value ([System.Net.Dns]::GetHostByAddress($i).HostName)
$results +=$o
}
$results | Select-Object -Property hostname | Export-Csv .\machinenames.csv
