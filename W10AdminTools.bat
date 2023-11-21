@echo off
chcp 65001
cls
:inicio
cls
echo Administrator Tools
echo.
echo.
echo 1) Create a user
echo 2) Delete a user
echo 3) Modify a user's password
echo 4) Add/remove user from the administrators group
echo 5) Remove user from the administrators group
echo 6) Disable user
echo 7) Enable user
echo 0) Exit
echo.
set /p opcion=What action do you want to perform?: 

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
set /p nombre=Enter a name for the user: 
cls
set /p contraseña=Enter a password: 
cls
net user %nombre% %contraseña% /add
echo User created successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:deluser
cls
set /p nombre=Enter the username to delete: 
cls
net user %nombre% /delete
echo User deleted successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:chngpasswd
cls
set /p nombre=Enter the username: 
cls
set /p contraseña=Enter the new password: 
cls
net user %nombre% %contraseña%
echo Password changed successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:admadd
cls
set /p idioma=What language is your Windows version in? 1 Spanish 2 English
if %idioma%==1 goto admaddesp
if %idioma%==2 goto admaddeng
:admaddesp
cls
set /p nombre=Enter the username: 
cls
net localgroup Administradores %nombre% /add
echo User added to the administrators group successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio
:admaddeng
cls
set /p nombre=Enter the username: 
cls
net localgroup Administrators %nombre% /add
echo User added to the administrators group successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls

:admrmv
cls
set /p idioma=What language is your Windows version in? 1)Spanish 2)English
if %idioma%==1 goto admrmesp
if %idioma%==2 goto admrmeng
:admrmesp
cls
set /p nombre=Enter the username:
cls
net localgroup Administradores %nombre% /delete
echo User removed from the administrators group successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio
:admrmeng
cls
set /p nombre=Enter the username:
cls
net localgroup Administradtors %nombre% /delete
echo User removed from the administrators group successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:disbluser
cls
set /p nombre=Enter the username: 
cls
net user %nombre% /active:no
echo User disabled successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:enbluser
cls
set /p nombre=Enter the username: 
cls
net user %nombre% /active:yes
echo User enabled successfully, returning to the menu...
ping 192.0.2.2 -n 1 -w 3500 > nul
cls
goto :inicio

:exit
msg * Goodbye
exit
