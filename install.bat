cls
SET start_dir=%CD%


:: Download the apt-vim files
SET APT_VIM_DIR=%HOME%apt-vim
mkdir %APT_VIM_DIR%
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/rafpyprog/apt-vim/master/apt-vim -OutFile %APT_VIM_DIR%\apt-vim"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/rafpyprog/apt-vim/master/vim_config.json -OutFile %APT_VIM_DIR%\vim_config.json"

:: Add vimrc if there isn't one already
IF NOT EXIST "%HOME%.vimrc" ( copy NUL "%HOME%.vimrc" )

:: Make sure vimrc is using pathogen
FINDSTR -R /C:"execute pathogen#infect()" %HOME%.vimrc
IF %ERRORLEVEL% NEQ 0 (
    @echo execute pathogen#infect^(^) >> %HOME%.vimrc
    )

FINDSTR -R /C:"call pathogen#helptags()" %HOME%.vimrc
IF %ERRORLEVEL% NEQ 0 (
    @echo call pathogen#helptags^(^) >> %HOME%.vimrc
    )

:: Update path for executing shell
SET bin_string=%HOME%.vimpkg/bin

:: Execute apt-vim init
cd /D %HOME%apt-vim

:: Creates the python script to call apt-vim installation
@echo off
@echo import imp >> install.py
@echo import os >> install.py
@echo import platform >> install.py
@echo HOST_OS = platform.system().lower() >> install.py
@echo HOME = os.path.expanduser("~") >> install.py
@echo APT_VIM_DIR = os.path.abspath(os.path.join(HOME, 'apt-vim')) >> install.py
@echo SCRIPT_ROOT_DIR = os.path.abspath(os.path.join(HOME, '.vimpkg')) >> install.py
@echo BIN_DIR = os.path.abspath(os.path.join(SCRIPT_ROOT_DIR, 'bin')) >> install.py
@echo os.environ['PATH'] += os.pathsep + BIN_DIR >> install.py
@echo os.chdir(APT_VIM_DIR) >> install.py
@echo aptvim = imp.load_source("aptvim", "./apt-vim") >> install.py
@echo av = aptvim.aptvim(ASSUME_YES=True, VIM_CONFIG='', INSTALL_TARGET='') >> install.py
@echo av.first_run() >> install.py
@echo av.handle_install(None, None, None) >> install.py
@echo on

:: Run the installation script
python install.py

:: Add vimpkg to path
set Path | find "C:\Users\05966258635\.vimpkg\bin"
IF %ERRORLEVEL% NEQ 0 (
    @echo "Adding %bin_string% to PATH."
    setx %PATH% %bin_string%
    )
ELSE (
    @echo "%bin_string already in PATH."
    )
