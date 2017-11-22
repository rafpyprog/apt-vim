@echo -----------------------------------
@echo apt-vim installation test - Windows
@echo ------------------------------------

@echo Download installation script
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.bat -OutFile install.bat"

@echo Run installation script
install.bat
