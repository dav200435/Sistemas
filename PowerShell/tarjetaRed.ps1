# Configuraciones de red para el caso de DHCP
$ip = "192.168.10.245"
$subnet = "255.255.255.0"
$gateway = "192.168.10.1"
$dns = "8.8.8.8"

# Obtener el adaptador de red que está activo y conectado
$adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Verificar si se encontró un adaptador
if ($adapter) {
    # Obtener la configuración IP actual del adaptador
    $ipConfig = Get-NetIPAddress -InterfaceAlias $adapter.Name -AddressFamily IPv4
    
    # Verificar si la configuración es estática
    if ($ipConfig.PrefixOrigin -eq "Manual") {
        # Cambiar la configuración a DHCP
        Set-NetIPInterface -InterfaceAlias $adapter.Name -Dhcp Enabled
        Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ResetServerAddresses
        
        Write-Output "Configuración cambiada a DHCP exitosamente."
    } else {
        Write-Output "La configuración ya está en DHCP."
        
        # Aplicar las reglas de configuración de red
        Write-Output "Aplicando configuraciones de red específicas."
        
        # Configurar la IP estática y la puerta de enlace
        New-NetIPAddress -InterfaceAlias $adapter.Name -IPAddress $ip -PrefixLength 24 -DefaultGateway $gateway -Confirm:$false
        
        # Configurar el servidor DNS
        Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ServerAddresses $dns
        
        Write-Output "Configuraciones de red específicas aplicadas exitosamente."
    }
} else {
    Write-Output "No se encontró un adaptador de red activo."
}
