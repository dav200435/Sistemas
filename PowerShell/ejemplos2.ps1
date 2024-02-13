$texto = Read-Host "Escribe un texto"
if ($texto.Length -lt 4){
    echo "texto invalido"
}else{
    $texto[3]
}