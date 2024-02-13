$documentos = Get-ChildItem -Path "C:\Users\DAV_2004_35\Documents" -Filter "*.txt"
foreach ($fichero in $documentos) {
    Copy-Item -Path $fichero.FullName -Destination ".\" 
    $nombre = "old_" + $fichero.Name
    Rename-Item -Path ".\$($fichero.Name)" -NewName $nombre
}
Get-ChildItem *.txt | Rename-Item -NewName {"old2_" + $_.Name}