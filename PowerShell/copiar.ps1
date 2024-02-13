function s{
    param($nombre)
    Get-Process -Name $nombre
}
#s("firefox")

function f ($process, $file){
    Get-Process -Name $process
    New-Item -path "" -ItemType file
}

f "firefox" "fichero.txt"