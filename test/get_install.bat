@echo '---------------------------------------------'
@echo ' Clean installation'
@echo '---------------------------------------------'
del C:\Users\05966258635\.vimrc
rmdir /S /Q C:\Users\05966258635\.apt-vim
rmdir /S /Q C:\Users\05966258635\.vim
rmdir /S /Q C:\Users\05966258635\.vimpkg

@echo '---------------------------------------------'
@echo ' Acquire Installation script from repository'
@echo '---------------------------------------------'
powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.bat -OutFile install.bat"
