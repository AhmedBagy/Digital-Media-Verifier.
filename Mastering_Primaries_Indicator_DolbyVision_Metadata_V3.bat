@echo off
set FILE_PATH=%~1
echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> DolbyVision Metadata XML ^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<
echo.
echo ## %~nx1 dropped.
echo.
echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> ColorEncoding Primaries 

setlocal enabledelayedexpansion


set "counter=0"

for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<Red>0.708,0.292</Red>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break
)
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<Green>0.17,0.797</Green>"') do (
    echo Line no. %%A
	set /a counter+=1
    goto :break
)
:break
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<Blue>0.131,0.046</Blue>"') do (
    echo Line no. %%A
set /a counter+=1
    goto :break
)
:break
echo.

if %counter% equ 3 (
    echo Color Encoding Primaries matches the  __REC2020__ color profile.
 goto :stop ) else (
    if %counter% gtr 0 (
        echo Color Encoding Primaries most likely matches the __REC2020__ but there one or more missing or incorrect primary value/s.
set /a counter+=0
    )
)

if %counter% equ 0 (
    echo Color Encoding Primaries are not matching the REC2020 color profile standards!!!!, Kindly check the XML manually.
    echo Here the values found at MasteringDisplayPrimaries:
)


echo.

for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "red"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break
)
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "green"') do (
    echo Line no. %%A
	set /a counter+=1
    goto :break
)
:break
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "blue"') do (
    echo Line no. %%A
set /a counter+=1
    goto :break
)
:break
echo.



:stop
endlocal
echo.
echo.
echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> MasteringDisplay field





setlocal enabledelayedexpansion

set counter=0

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<Name>1000-nit, BT.2020, D65, ST.2084, Full</Name>"') do (
   set /A counter+=1
    if !counter! equ 1 (
        echo Line no. %%A
goto :gooo
    )
)


endlocal




setlocal enabledelayedexpansion

set counter=0

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<Name>1000-nit, P3, D65, ST.2084, Full</Name>"') do (
   set /A counter+=1
    if !counter! equ 1 (
        echo Line no. %%A
goto :break
    )
)
:break

endlocal

:gooo




setlocal enabledelayedexpansion

set counter=0

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "red"') do (
    set /A counter+=1
    if !counter! equ 2 (
        echo Line no. %%A
        goto :break
    )
)

:break

endlocal
setlocal enabledelayedexpansion

set counter=0

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "green"') do (
    set /A counter+=1
    if !counter! equ 2 (
        echo Line no. %%A
        goto :break
    )
)

:break

endlocal
setlocal enabledelayedexpansion

set counter=0

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "blue"') do (
    set /A counter+=1
    if !counter! equ 2 (
        echo Line no. %%A
        goto :break
    )
)

:break

endlocal




for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<MinimumBrightness>0.0001</MinimumBrightness>"') do (
    echo Line no. %%A

 goto :break
)
:break
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<PeakBrightness>1000</PeakBrightness>"') do (
    echo Line no. %%A

goto :break
)
:break




echo.
type "%file_path%" 2>nul | findstr /i /c:"<Name>1000-nit, BT.2020, D65, ST.2084, Full</Name>" >nul
if not errorlevel 1 (
  echo Mastering Display Primaries matches __REC2020__ color space profile) 
type "%file_path%" 2>nul | findstr /i /c:"<Name>1000-nit, P3, D65, ST.2084, Full</Name>" >nul
if not errorlevel 1 (
  echo ## Mastering Display Primaries matches ___P3___ color space profile) 
echo.
echo.

echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> MaxFALL/CLL

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<MaxFALL>0</MaxFALL>"') do (
    echo Line no. %%A
)

type "%file_path%" 2>nul | findstr /i /c:"<MaxFALL>0</MaxFALL>" >nul
if errorlevel 1 (
    echo "MaxFALL" is either not equal zero or not found at all, please check the XML manually.
echo.
echo Maybe try line no.:
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<MaxFALL>"') do (
    echo Line no. %%A
)
)

echo.
echo.



for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<MaxCLL>0</MaxCLL>"') do (
    echo Line no. %%A
)

type "%file_path%" 2>nul | findstr /i /c:"<MaxCLL>0</MaxCLL>" >nul
if errorlevel 1 (
    echo "MaxCLL" is either not equal zero or not found at all, please check the XML manually.
echo.
echo Maybe try line no.:
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<MaxCLL>"') do (
    echo Line no. %%A
)
)


echo.

echo ## %~nx1 done.
echo.

pause