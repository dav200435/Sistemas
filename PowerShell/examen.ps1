function ej1-2(){
    $documentos = Get-ChildItem -Path "C:\Proyectos\Resources"
    foreach ($fichero in $documentos) {
        Copy-Item -Path $fichero.FullName -Destination "C:\Proyectos\TechApp\Src" 
    }
}

function ej1-3(){
    $documentos = Get-ChildItem -Path "C:\Proyectos\TechApp"
    foreach ($fichero in $documentos) {
        Move-Item -Path $fichero.FullName -Destination "C:\Proyectos\CodigoFuente" 
    }
}

function ej1-4(){
    Remove-Item -path "C:\Proyectos\TechApp\*.old"
}

function ej1-5(){
    $cont=0
    $documentos = Get-ChildItem -Path "C:\Proyectos\TechApp"
    foreach($fichero in $documentos){
        $cont=$cont+1
    }
    Write-Host "$cont"
}

function ej1-6(){
    Rename-Item -Path "C:\Proyectos\TechApp\Src\main_old.js" -NewName "main.js"
}

function ej1-7(){
    New-Item -ItemType File -Path "C:\Proyectos\TechApp\Readmr.txt" -Force
    Set-Content -Value "Instrucciones basicas" -Path "C:\Proyectos\TechApp\Readmr.txt"
}

# Ejercicio2

function ej2-1(){
    $Password = Read-Host -AsSecureString
    New-LocalUser -Name "NuevoUser" -Password -Password (ConvertTo-SecureString $password -AsPlainText -Force) -FullName "Nuevo Usuario" -Description "Descripción del Usuario"
    
}

function ej2-2(){
    Get-Localuser -Name "NuevoUser" | Add-LocalGroupMember -Group 'Empleados'
}

function ej2-3(){
    New-LocalUser -Name "Ejemplo" -AccountExpires ""#introducir la fecha deseada
}

function ej2-4(){
    $UserAccount = Get-LocalUser -Name "UsuarioExistente"
    Disable-LocalUser -Name $UserAccount
}

function ej2-5(){
    $UserAccount = Get-LocalUser -Name "UsuarioOlvidado"
    $UserAccount | Set-LocalUser -Password $Password
}

function ej2-6(){
    Get-WmiObject Win32_UserAccount -filter “LocalAccount=True” | Select-Object Name,FullName,Disabled,MailUser

}

function ej2-7(){
    Remove-LocalUser -Name "Usuariodespedido"
}

function ej3-1(){
    Get-Process -ComputerName "ip/nombre de la otra maquina"
    # Esto se podria hacer para comprobar que no se este ejecutando ningun programa no deseado
}

function ej3-2(){
    Get-Process sqlserver.exe -ComputerName "ip/nombre de la otra maquina"
    # Se puede ejecutar para ver el estado del proceso y verificar que no este gastando demasiados recursos del server
}

function ej3-3(){
    Get-Process PrintSpooler | Format-List *
    # Los procesos pueden ser importantes ya que si uno utilizado no esta en uso puede causar una pausa en el equipo/empresa
}

function ej3-4(){
    foreach($conex in @(netstat -ano)) { foreach($proceso in ps) { if($conex -match $proceso.Id -and $proceso.Id -ne 4 -and $proceso.Id -ne 0) { write-host $conex "-PROCESO->" $proceso.Name $proceso.Id } } }
    # Esta informacion se usa para verificar que no hay conexiones fraudulentas en los equipos
}

function ej3-5(){
    $id = Get-Process iexplorer.exe id
    Stop-Process $id  # id del proceso
    #
}

function ej3-6(){
    Get-Process -Name w33wp.exe | Select-Object -ExpandProperty Threads
    # esto puede ser para preservar la disponivilidad del servidor ya uno puede tener varios servicios y uno no deveria poder tumbar el resto
}