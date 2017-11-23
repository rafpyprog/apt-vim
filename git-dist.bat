call :isAdmin

    if %errorlevel% == 0 (
       echo 'Administrative status ok'
       rem goto :run
    ) else (
       echo Requesting administrative privileges...
       rem goto :UACPrompt
    )

set COMMIT_MSG=%1

git add .
git commit -m "%COMMIT_MSG%"
git push

@echo off
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
