#Me genera una clave
$key = New-CryptographyKey -Algorithm AES 

#Encrypt the file 
Protect-File 'C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\encriptacion\ficheroOculto.txt' -Algorithm AES -Key $key -RemoveSource 

#Decrypt the file 
Unprotect-File 'C:\Users\DAV_2004_35\repositorios\sistemas\PowerShell\encriptacion\ficheroOculto.txt.AES' -Algorithm AES -Key $key -RemoveSource