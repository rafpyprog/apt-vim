import os
from subprocess import call, check_output, Popen, PIPE
import json
 #C:\\Users\\05966258635\\apt-vim\\apt-vim C:\\Users\\05966258635\\.vimpkg\\bin\\apt-vim
call(['copy'], shell=True)

check_output('copy C:\\Users\\05966258635\\apt-vim\\apt-vim C:\\Users\\05966258635\\.vimpkg\\bin\\meuteste', shell=True)

os.getcwd()

call(, shell=True)

cmd = '''powershell.exe -Command "Invoke-WebRequest https://tpo.pe/pathogen.vim -OutFile myvim"'''
proc = Popen(cmd, stdout=PIPE, stdin=PIPE, shell=True)
proc.communicate()
