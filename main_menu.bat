@echo off
@chcp 65001
cls
:menu
echo Witaj w menu głównym 
echo.
echo Proszę wybierz interesującą cię opcje:
echo.
echo 1. Uruchomienie głownego programu 
echo 2. Informacje 
echo 3. Utworzenie Backup'u
echo 4. Exit
echo.

set /p choice=Enter your choice:

if %choice% GEQ 1 if %choice% LEQ 4 goto processChoice

echo Invalid choice, please enter a number between 1 and 4.
pause
cls
goto menu

:processChoice
if %choice%==1 goto option1
if %choice%==2 goto option2
if %choice%==3 goto option3
if %choice%==4 goto option4

:option1
echo You selected Option 1
python szyfrowanie.py
rem python " raport .py"
echo Skrypt zostal pomyslnie wykonany.
start report.html
pause
cls
goto menu

:option2
cls
echo Wybrales informacje:
ECHO.
echo ----------------------------------------------------------------------------
echo OGÓLNE
echo. 
echo Program do szyfrowania tekstu zamieniający litery na liczby atomowe pierwiastków chemicznych zgodnie z ich symbolami. 
echo Znak interpunkcyjny pomiędzy literami to gwiazdka (*),
echo  a pomiędzy wyrazami - dwie gwiazdki (**). 
echo.
echo Wielkość liter nie jest uwzględniana.
echo.
echo Program pobiera dane z plikow wejsciowych postaci input\*.txt,
echo oraz zapisuje wyniki w plikach output\*.txt
echo ----------------------------------------------------------------------------
echo PRZYKŁAD
echo.
echo Przykład : tekst SobOta rANo zaszyfrowany mógłby być ciągiem znaków 
echo 16*8*5*8*73**88*7*8 (siarka, tlen, bor, tlen tal; rad, azot, tlen)
echo ----------------------------------------------------------------------------
echo UWAGA
echo.
echo Nie każdy tekst może być zaszyfrowany, np Anna.
echo Anna - nie istnieje żaden pierwiastek jak A lub An.
echo ----------------------------------------------------------------------------
echo.
echo. AUTOR PROGRAMU: Alicja idzikowska
echo.
echo ----------------------------------------------------------------------------
pause
cls
goto menu

:option3
echo You selected Option 3
cls
echo.
IF NOT EXIST backups mkdir backups
set name=%date%--%TIME:~0,7%
set name=%name::=-%
IF EXIST report.html mkdir backups\%name%
robocopy input backups\%name%\input
robocopy output backups\%name%\output
copy report.html backups\%name%\report.html
echo.
pause
cls
goto menu

:option4
echo koniec programu
pause
