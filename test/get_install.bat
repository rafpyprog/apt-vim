@echo '---------------------------------------------'
@echo ' Acquire Installation script from repository'
@echo '---------------------------------------------'

set install_script=https://raw.githubusercontent.com/rafpyprog/apt-vim/master/install.ps1 -OutFile install.ps1
powershell -command "Invoke-WebRequest -DisableKeepAlive %install_script%"
