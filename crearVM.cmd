@echo off
title MAQUINAS VIRTUALES
VBoxManage storagectl KaliLinux --name "IDE Controller" --add ide --controller PIIX4

:inicio
cls
echo -------------------------------------------------------------------------------------------------
echo ----------------------------------¿QUE QUIERES HACER?--------------------------------------------
echo 1. Crear una maquina virtual
echo 2. Arrancar maquina virtual
echo 3. Cambiar memoria
echo 4. Comprobar maquina virtual
echo 5. Crear disco virtual
echo 6. Salir
echo -------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------

set /p op=¿Que quieres hacer?: 

if %op% == 1 ( goto crear)
if %op% == 2 ( goto  arrancar)
if %op% == 3 ( goto  memoria)
if %op% == 4 ( goto  configuracion)
if %op% == 5 ( goto  disco)
if %op% == 6 ( goto  salir)
else (goto inicio)

:crear
set /p nameCreate=¿Como se va a llamar la maquina?: 
set /p ruteDVI=¿Cual es el tipo de SO?: 
VBoxManage createvm --name %nameCreate% --ostype %ruteDVI% --register
pause
goto inicio

:arrancar
set /p nameStart=¿Como se llama la maquina?: 
VBoxManage modifyvm %nameStart% --vrde on
VBoxManage modifyvm %nameStart% --vrdemulticon on --vrdeport 3390
VBoxHeadless --startvm %nameStart%
pause
goto inicio

:memoria
set /p nameAmount=¿Como se llama la maquina?:
set /p amount=¿Cantidad de memoria?:

VBoxManage modifyvm %nameAmount% --memory %amount%
pause
goto inicio

:configuracion
set /p nameOptions=¿Como se llama la maquina?: 
VBoxManage showvminfo %nameOptions%

pause
goto inicio

:disco
set /p discAmount=¿Cuanta memoria en MB le quieres dar?: 
set /p nameDisc=¿Como se llama la maquina?:
VBoxManage createhd --filename C:\Users\DAV_2004_35\VirtualBoxVMs\%nameDisc%.vdi --size %discAmount% --format VDI
VBoxManage storageattach KaliLinux --storagectl "%nameDisc%" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/KaliLinux/KaliLinux.vdi 

pause
goto inicio

:salir
cls