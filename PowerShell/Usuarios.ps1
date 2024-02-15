function crearUsuarios($archivo){
    Get-Content $archivo | foreach{
        $usuario = $_.Trim()
        crearUser ($usuario)
        echo("se ha creado $usuario")
    }
}

function borrarUsuarios($archivo){
    Get-Content $archivo | foreach{
        $usuario = $_.Trim()
        borrarUser ($usuario)
        echo("se ha borrado el usuario: $usuario")
    }
}

function crearUser($user){
    New-LocalUser -Name $user -Password (ConvertTo-SecureString "Contraseña" -AsPlainText -Force) -FullName $user -Description "Descripción del Usuario"
    Get-Localuser -Name $user | Add-LocalGroupMember -Group 'Usuarios'
}

function borrarUser($user){
    Remove-LocalUser -Name $user
}