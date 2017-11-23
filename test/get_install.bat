@echo '---------------------------------------------'
@echo ' Acquire Installation script from repository'
@echo '---------------------------------------------'

set install_script=https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.bat -OutFile install.bat
powershell -command "Invoke-WebRequest -DisableKeepAlive %install_script%"
