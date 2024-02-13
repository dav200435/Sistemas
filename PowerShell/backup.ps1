function backup{

    $Sta = New-ScheduledTaskAction  powershell.exe -Argument “-file C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\script.ps1” -WorkingDirectory "C:\WINDOWS\system32\WindowsPowerShell\v1.0"
    $Stt =  New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 3)

    Register-ScheduledTask Task01 -Action $Sta -Trigger $Stt
}