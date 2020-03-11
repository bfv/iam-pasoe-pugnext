@echo off

call setdlc
call %~dp0\bin\tcman.bat stop

del %~dp0\logs\*.* /s /q

call %~dp0\bin\tcman.bat start
