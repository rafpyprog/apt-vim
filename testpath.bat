@echo off
:: Add vimpkg to path
SET bin_string=%HOME%.vimpkg/bin
echo ;%PATH%; | find /C /I ";%bin_string%;"
echo ;%PATH%; | find /C /I ";caralho;"
IF %ERRORLEVEL% NEQ 0 (
    echo "Adding %bin_string% to PATH."
    setx PATH "%PATH%;%bin_string"
) ELSE (
    echo "%bin_string already in PATH."
)
