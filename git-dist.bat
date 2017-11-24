@echo off
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
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::------------------------------------------------------------------------
@echo on
@echo -------------------------------
@echo Updating GitHub repository.
@echo -------------------------------
@echo.
@echo off
git add .
git commit -m "%1"
git push

:: Windows 7 dont use HOME variable
@echo on
@echo.
@echo -------------------------------
@echo Setting %%HOME%% variable.
@echo -------------------------------
@echo.
@echo off

if "%HOME%"=="" (
  set HOME=%USERPROFILE%
)
@echo on
@echo HOME="%HOME%"
@echo off

@echo on
@echo. & @echo -------------------------------
@echo Cleaning previous installation
@echo ------------------------------- & @echo.
@echo off

set VIMRC=%HOME%\.vimrc
set APTVIM=%HOME%\.apt-vim
set VIM=%HOME%\.vim
set VIMPKG=%HOME%\.vimpkg
set APTVIM=%HOME%\apt-vim

@echo on
if exist %VIMRC% del %VIMRC%
if exist %APTVIM% rmdir /S /Q %APTVIM%
if exist %VIM% rmdir /S /Q %VIM%
if exist %VIMPKG% rmdir /S /Q %VIMPKG%
if exist %APTVIM% rmdir /S /Q %APTVIM%
@echo off

@echo on
@echo. & @echo -------------------------------
@echo Downloading install script
@echo ------------------------------- & @echo.
@echo off

if exist D:\mono-repo\apt-vim-fork\test\install.ps1 set outfile=D:\mono-repo\apt-vim-fork\test\install.ps1
if exist C:\Users\rafael\Projetos\Python\apt-vim\test\install.ps1 set outfile=C:\Users\rafael\Projetos\Python\apt-vim\test\install.ps1
@echo %outfile%
::set outfile=D:\mono-repo\apt-vim-fork\test\install.ps1
::set outfile=C:\Users\rafael\Projetos\Python\apt-vim\test\install.ps1
set install_script=https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.ps1 -OutFile %outfile%

echo on
powershell -command "Invoke-WebRequest -DisableKeepAlive %install_script%"

echo off
PAUSE
