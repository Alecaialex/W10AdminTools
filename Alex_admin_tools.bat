@echo off
chcp 65001
:inicio
cls
echo Herramientas de administrador
echo.
echo.
echo 1) Crear un usuario
echo 2) Eliminar un usuario
echo 3) Modificar la contraseña de un usuario
echo 4) Añadir/eliminar usuario del grupo de administradores
echo 5) Eliminar usuario del grupo de administradores
echo 6) Deshabilitar usuario
echo 7) Habilitar usuario
echo 0) Salir
echo.
set /p opcion=¿Que acción quieres hacer?: 

if %opcion%==1 goto mkuser
if %opcion%==2 goto deluser
if %opcion%==3 goto chngpasswd
if %opcion%==4 goto admadd
if %opcion%==5 goto admrmv
if %opcion%==6 goto disbluser
if %opcion%==7 goto enbluser
if %opcion%==0 goto exit

:mkuser
cls
set /p nombre=Introduce un nombre para el usuario: 
cls
set /p contraseña=Introduce una contraseña: 
cls
net user %nombre% %contraseña% /add
echo Usuario creado con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:deluser
cls
set /p nombre=Indica el nombre del usuario a borrar: 
cls
net user %nombre% /delete
echo Usuario eliminado con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:chngpasswd
cls
set /p nombre=Introduce el nombre del usuario: 
cls
set /p contraseña=Introduce la nueva contraseña: 
cls
net user %nombre% %contraseña%
echo Contraseña cambiada con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:admadd
cls
set /p idioma=¿En que idioma está tu versión de windows? 1 Español 2 Inglés
if %idioma%==1 goto admaddesp
if %idioma%==2 goto admaddeng
:admaddesp
cls
set /p nombre=Introduce el nombre del usuario: 
cls
net localgroup Administradores %nombre% /add
echo Usuario añadido al grupo administradores con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio
:admaddeng
cls
set /p nombre=Introduce el nombre del usuario: 
cls
net localgroup Administrators %nombre% /add
echo Usuario añadido al grupo administradores con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls

:admrmv
cls
set /p idioma=¿En que idioma está tu versión de windows? 1)Español 2)Inglés
if %idioma%==1 goto admrmesp
if %idioma%==2 goto admrmeng
:admrmesp
cls
set /p nombre=Introduce el nombre del usuario:
cls
net localgroup Administradores %nombre% /delete
echo Usuario eliminado del grupo administradores con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio
:admrmeng
cls
set /p nombre=Introduce el nombre del usuario:
cls
net localgroup Administradtors %nombre% /delete
echo Usuario eliminado del grupo administradores con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:disbluser
cls
set /p nombre=Introduce el nombre del usuario: 
cls
net user %nombre% /active:no
echo Usuario deshabilitado con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:enbluser
cls
set /p nombre=Introduce el nombre del usuario: 
cls
net user %nombre% /active:yes
echo Usuario deshabilitado con éxito, volviendo al menú...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:exit
msg * chau
exit
