rem Set DateTime=%date:~8,2%.%date:~3,2%.%date:~0,2%-%time:~0,2%.%time:~3,2%
Set DateTime=%date:~6,4%.%date:~3,2%.%date:~0,2%
set BackUp_DIR=backup
set 7z_parm=a -t7z -m=LZMA -ssw -mx9 -pPassword -r0
ser work_dir="c:\Users\Вадим\AppData\Roaming\uTorrent\"

cd %work_dir%
IF NOT EXIST "%BackUp_DIR%\%DateTime%" (
mkdir %BackUp_DIR%\%DateTime%
xcopy  "*.dat" "%BackUp_DIR%\%DateTime%"
xcopy  "*.old" "%BackUp_DIR%\%DateTime%"
xcopy  "*.bad" "%BackUp_DIR%\%DateTime%"

set current_dir="%cd%"
cd %BackUp_DIR%
"C:\Program Files\7-Zip\7z.exe" a -t7z  -ssw -mx9 -pPassword -r0 backup.7z %DateTime%
"C:\Program Files\7-Zip\7z.exe" a -t7z  -ssw -mx9 -pPassword -r0 Arhive.7z %DateTime%
cd %current_dir%
)
