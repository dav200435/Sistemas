foreach($conex in @(netstat -ano))
{
    foreach($proceso in ps)
    {
        if($conex -match $proceso.Id -and $proceso.Id -ne 4 -and $proceso.Id -ne 0)
        {
            write-host $conex "-PROCESO->" $proceso.Name $proceso.Id
        }
    }
}
