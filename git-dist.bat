git add .
git commit -m "test"
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
