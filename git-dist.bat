git add .
git commit -m "test"
git push

set VIMRC=C:\Users\05966258635\.vimrc

IF EXIST %VIMRC% del C:\Users\05966258635\.vimrc
IF EXIST C:\Users\05966258635\.apt-vim rmdir /S /Q C:\Users\05966258635\.apt-vim
IF EXIST C:\Users\05966258635\.vim rmdir /S /Q C:\Users\05966258635\.vim
IF EXIST C:\Users\05966258635\.vimpkg rmdir /S /Q C:\Users\05966258635\.vimpkg
IF EXIST C:\Users\05966258635\apt-vim rmdir /S /Q C:\Users\05966258635\apt-vim
