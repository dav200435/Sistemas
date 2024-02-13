function copy ($copia, $destino){
    Get-ChildItem $copia | Select-Object Name
    $aux = $copia + "\*"
    $aux2 = $destino + "\backup.zip"
    Compress-Archive -Path $aux -DestinationPath $aux2
}

copy "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\ejercicios" "C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\ejercicios\copias"