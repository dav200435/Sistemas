while ($true) {
    Clear-host
    Write-Host "1. Listar usuarios"
    Write-Host "2. Crear usuarios (pide usuario y contraseña)"
    Write-Host "3. Cambiar descripción de usuario"
    Write-Host "4. Desactivar usuario"
    Write-Host "5. Salir"
    $x=Read-Host "Seleccione opción"
    if ($x -eq 1) {
        Get-LocalUser
    }
    if ($x -eq 2) {
        crearUserConPw
    }
    if ($x -eq 3) {
        cambiarDescripcion
    }
    if ($x -eq 4) {
        desactivar
    }
    if ($x -eq 5) {
        $true=false
    }

}
function crearUserSinPw(){
    $user=Read-Host "Dime un nombre para el nuevo usuario"
    New-LocalUser -Name $user -NoPassword -FullName $user -Description "Descripción del Usuario"
    Get-Localuser -Name $user | Add-LocalGroupMember -Group 'Usuarios'
}

function crearUserConPw(){
    $userPass=Read-Host "Dime un nombre para el nuevo usuario"
    $pass=Read-Host "Dime una contraseña para el nuevo usuario"
    New-LocalUser -Name $userPass -Password (ConvertTo-SecureString $pass -AsPlainText -Force) -FullName $user -Description "Descripción del Usuario"
    Get-Localuser -Name $userPass | Add-LocalGroupMember -Group 'Usuarios'
}

function cambiarDescripcion(){
    $userDesc=Read-Host "Dime un nombre para el nuevo usuario"
    $desc=Read-Host "Dime una contraseña para el nuevo usuario"
    Set-LocalUser -Name "$userDesc" -Description "$desc"
}

function desactivar(){
    $userDisabled=Read-Host "Dime nombre de usuario a desactivar"
    Disable-LocalUser -Name $userDisabled
}