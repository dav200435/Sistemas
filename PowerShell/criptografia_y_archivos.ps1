New-Item -ItemType Directory -path "C:\archivos_comprimidos" -Force
New-Item -ItemType File -path "C:\archivos_comprimidos\ejemplo.txt" -Force
Compress-Archive -Path "C:\archivos_comprimidos\ejemplo.txt" -DestinationPath "C:\archivos_comprimidos\ejemplo.zip" -Update
Set-Content -Path "C:\archivos_comprimidos\saludo.txt" -Value "Hola, mundo!"
Import-Module C:\Users\DAV_2004_35\repositorios\Sistemas\PowerShell\FileCryptography.psm1