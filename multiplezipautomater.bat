@echo off
Setlocal EnableDelayedExpansion

:: Folder containing files
set input=C:\Users\KazWa\Desktop\Catagory Thumbnails\Catagory Thumbs from PrestaShop
:: Folder for zips
set output=C:\Users\KazWa\Desktop\category
:: Temp filename to hold list of 100 
set listfile=%temp%\listfile
:: Zip counter
set z=1
:: Files per zip
set n=100

cd /d %input%

if exist %listfile% del %listfile%

set i=0

for %%f in (*.jpg) do (
echo [!i!] & set /a i+=1
echo %%f >> %listfile%

if !i!==%n% (
    7z a %output%\!z!.zip @%listfile%
    set i=0
    echo [!z!] & set /a z+=1
    del %listfile%
    )
)

:: Process remaining files, if any
if exist %listfile% (
    7z a %output%\!z!.zip @%listfile%
    del %listfile%
)