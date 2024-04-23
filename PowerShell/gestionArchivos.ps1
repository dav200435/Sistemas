New-Item -ItemType Directory -Path "C:\NuevaCarpeta" -Force

$sourceFolder = "C:\SourceFolder"
$destinationFolder = "C:\DestinationFolder"
$exampleFolder = "C:\ExampleFolder"

New-Item -ItemType Directory -Path $sourceFolder -Force
New-Item -ItemType Directory -Path $destinationFolder -Force
New-Item -ItemType Directory -Path $exampleFolder -Force
New-Item -ItemType File -Path "$sourceFolder\ejemplo.txt" -Force

Copy-Item -Path "$sourceFolder\ejemplo.txt" -Destination $destinationFolder -Force

Move-Item -Path "$sourceFolder\ejemplo.txt" -Destination $destinationFolder -Force

Remove-Item -Path "$exampleFolder\ejemplo.txt" -Force

Rename-Item -Path "$exampleFolder\viejoNombre.txt" -NewName "nuevoNombre.txt" -Force