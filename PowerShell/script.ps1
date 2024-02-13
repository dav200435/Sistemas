function buckup ($rutaOrigen, $rutaDestino) {
    Get-ChildItem $rutaOrigen | Select-Object Name

    $fileHashes = Get-FileHash $rutaOrigen\*
    $fileHashes | Out-File "$rutaOrigen\watchdog.txt"

    $aux = $rutaOrigen + "\*"
    $aux2 = "$rutaDestino\buckup.zip"
    $passwd = $rutaDestino +"\passwd.txt"
    Compress-Archive -Path $aux -DestinationPath $aux2 -Force

    $key = New-CryptographyKey -Algorithm AES -AsPlainText
    $key > $passwd

    Protect-File "$rutaDestino\buckup.zip" -Algorithm AES -KeyAsPlainText $key -RemoveSource 

}

buckup "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell" "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\ejercicios\copias"