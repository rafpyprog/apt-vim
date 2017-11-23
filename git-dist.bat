:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC=CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%*:"="
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::------------------------------------------------------------------------
git add .
git commit -m "%1"
git push

set VIMRC=C:\Users\05966258635\.vimrc
set APTVIM=C:\Users\05966258635\.apt-vim
set VIM=C:\Users\05966258635\.vim
set VIMPKG=C:\Users\05966258635\.vimpkg
set APTVIM=C:\Users\05966258635\apt-vim

if exist %VIMRC% del %VIMRC%
if exist %APTVIM% rmdir /S /Q %APTVIM%
if exist %VIM% rmdir /S /Q %VIM%
if exist %VIMPKG% rmdir /S /Q %VIMPKG%
if exist %APTVIM% rmdir /S /Q %APTVIM%
