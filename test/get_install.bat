@echo '---------------------------------------------'
@echo ' Acquire Installation script from repository'
@echo '---------------------------------------------'
powershell -command "Invoke-WebRequest https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.bat -OutFile install.bat"
