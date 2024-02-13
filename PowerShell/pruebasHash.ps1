#foreach($file in Get-ChildItem "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell"){
#    Write-Host "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell" -join $file
#    Get-FileHash "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\"+$file
#}
$actual = Get-FileHash "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\Ejemplos3.ps1"
$actual2 = Get-FileHash "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\backup.ps1"

compare-object $actual $actual2 -Property Hash