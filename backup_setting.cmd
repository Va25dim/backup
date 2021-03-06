Set AllDateTime=%date:~6,4%.%date:~3,2%.%date:~0,2%-%time:~0,2%.%time:~3,2%
Set DateTime=%date:~6,4%.%date:~3,2%.%date:~0,2%
set HOURtime=%time:~0,2%
Set DayTime=%date:~0,2%
Set MONTHTime=%date:~3,2%
Set HMTime=%time:~0,2%-%time:~3,2%
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


cd %work_dir%
IF NOT EXIST "%BackUp_DIR%\_HOUR\%hourTime%" (
rmdir /Q /S %BackUp_DIR%\_HOUR\
IF NOT EXIST "%BackUp_DIR%\_DAY\%DayTime%" (
set current_dir="%cd%"
cd %BackUp_DIR%\_DAY\
"C:\Program Files\7-Zip\7z.exe" a -t7z  -ssw -mx9 -pPassword -r0 %BackUp_DIR%\_DAY\%AllDateTime%.7z *.*
"C:\Program Files\7-Zip\7z.exe" a -t7z  -ssw -mx9 -pPassword -r0 %BackUp_DIR%\_DAY\%AllDateTime%.7z *.*
cd %current_dir%
rmdir /Q /S %BackUp_DIR%\_DAY\ 
IF NOT EXIST "%BackUp_DIR%\_MONTH\%MONTHTime%" (
rmdir /Q /S %BackUp_DIR%\_MONTH\ 
mkdir %BackUp_DIR%\_YEAR\%AllDateTime%
xcopy  "*.dat" "%BackUp_DIR%\_YEAR\%AllDateTime%"
xcopy  "*.old" "%BackUp_DIR%\_YEAR\%AllDateTime%"
xcopy  "*.bad" "%BackUp_DIR%\_YEAR\%AllDateTime%"
)
mkdir %BackUp_DIR%\_MONTH\%MONTHTime%
mkdir %BackUp_DIR%\_MONTH\%AllDateTime%
xcopy  "*.dat" "%BackUp_DIR%\_MONTH\%AllDateTime%"
xcopy  "*.old" "%BackUp_DIR%\_MONTH\%AllDateTime%"
xcopy  "*.bad" "%BackUp_DIR%\_MONTH\%AllDateTime%"


)
mkdir %BackUp_DIR%\_DAY\%DayTime%
mkdir %BackUp_DIR%\_DAY\%AllDateTime%
rem xcopy  "*.dat" "%BackUp_DIR%\_DAY\%AllDateTime%"
rem xcopy  "*.old" "%BackUp_DIR%\_DAY\%AllDateTime%"
rem xcopy  "*.bad" "%BackUp_DIR%\_DAY\%AllDateTime%"

)
mkdir %BackUp_DIR%\_HOUR\%hourTime%
mkdir %BackUp_DIR%\_HOUR\%AllDateTime%
xcopy  "*.dat" "%BackUp_DIR%\_HOUR\%AllDateTime%"
xcopy  "*.old" "%BackUp_DIR%\_HOUR\%AllDateTime%"
xcopy  "*.bad" "%BackUp_DIR%\_HOUR\%AllDateTime%"


