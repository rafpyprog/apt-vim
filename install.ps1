$start_dir = Split-Path $MyInvocation.MyCommand.Path

clear

# Create apt-vim folder
$apt_vim_dir="$HOME\apt-vim"
Write-Host $apt_vim_dir
New-Item -force -ItemType directory -Path $apt_vim_dir

# Download apt-vim files
$apt_vim_url = "https://raw.githubusercontent.com/rafpyprog/apt-vim/master/apt-vim"
$vimjson_url = "https://raw.githubusercontent.com/rafpyprog/apt-vim/master/vim_config.json"
Invoke-WebRequest $apt_vim_url -OutFile $apt_vim_dir'\apt-vim'
Invoke-WebRequest $vimjson_url -OutFile $apt_vim_dir'\vim_config.json'

# Add vimrc if there isn't one already
$vimrc = "$HOME\.vimrc"
$vimrc_not_exists = -Not (Test-Path $vimrc)
If ($vimrc_not_exists){
    New-Item -ItemType file -Path $vimrc -value "execute pathogen#infect()`ncall pathogen#helptags()`n "
}
else {
    Write-Host .vimrc file already exists [$vimrc].
    # Make sure vimrc is using pathogen
    $vimrc_content = Get-Content $vimrc
    If (-Not ($vimrc_content -contains "execute pathogen#infect()")){
            Add-Content $vimrc "execute pathogen#infect()"
    }
    If (-Not ($vimrc_content -contains "call pathogen#helptags()")){
            Add-Content $vimrc "call pathogen#helptags()"
    }
}

# Update path for executing shell
$bin_string=$home+'\.vimpkg\bin'

# Adiciona vimpkg ao PATH do sistema
$oldpath=[Environment]::GetEnvironmentVariable('Path', 'machine');
$newpath=$oldpath + ';' + $bin_string
$PathasArray=$OldPath.split(';')
If ($PathasArray -contains $bin_string -or $PathAsArray -contains $bin_string +'\'){
        Write-Output "$bin_string already in path."
}
else {
    [Environment]::SetEnvironmentVariable('Path', "$newpath",'Machine')
    Write-Host "$bin_string added to path."
}

$pyscript = @"
import imp
import os
import platform

HOST_OS = platform.system().lower()
HOME = os.path.expanduser("~")
APT_VIM_DIR = os.path.abspath(os.path.join(HOME, 'apt-vim'))
SCRIPT_ROOT_DIR = os.path.abspath(os.path.join(HOME, '.vimpkg'))
BIN_DIR = os.path.abspath(os.path.join(SCRIPT_ROOT_DIR, 'bin'))
os.environ['PATH'] += os.pathsep + BIN_DIR
os.chdir(APT_VIM_DIR)
aptvim = imp.load_source("aptvim", "./apt-vim")
av = aptvim.aptvim(ASSUME_YES=True, VIM_CONFIG='', INSTALL_TARGET='')
av.first_run()
av.handle_install(None, None, None)
"@

# Creates python script for installing apt-vim;
New-Item -force -ItemType file -Path $apt_vim_dir\install.py -value $pyscript

# Run the installation script
cd $apt_vim_dir
python install.py


cd $start_dir
