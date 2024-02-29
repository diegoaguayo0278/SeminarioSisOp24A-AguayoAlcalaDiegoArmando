@echo

rem Diego Armando Aguayo Alcala
echo Hola Mundo > mytext.txt

type mytext.txt

mkdir backup

move mytext.txt backup

dir backup

del backup\mytext.txt

rmdir backup

pause
