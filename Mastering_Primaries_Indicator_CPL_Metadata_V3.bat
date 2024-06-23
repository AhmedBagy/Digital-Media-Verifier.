@echo off

set FILE_PATH=%~1

echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>  IMF package CPL   ^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<
echo.
echo ## %~nx1 dropped
echo.
echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>
type "%file_path%" 2>nul | findstr /ni /i  /c:"060e2b34.0401010d.04010101.03040000" >nul
if not errorlevel 1 (
    echo ## Color Encoding Primaries matches REC2020 color space profile.
)
type "%file_path%" 2>nul | findstr /i /c:"060e2b34.0401010d.04010101.03040000" >nul
if errorlevel 1 (
    echo ## Color Encoding Primaries ERROR!!.
)
echo.
echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> MasteringDisplayPrimaries.
echo Always make sure the six values are found or else it's not a valid DisplayPrimaries.



setlocal enabledelayedexpansion


set "counter=0"




for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:X>35400</r2:X>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>14600</r2:Y>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break

echo.

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:X>8500</r2:X>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>39850</r2:Y>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break

echo.

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:X>6550</r2:X>"') do (
    echo Line no. %%A
    set /a counter+=1
    goto :break
)
:break

for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>2300</r2:Y>"') do (
    echo Line no. %%A
    set /a counter+=1
     goto :break
)
:break

echo. 




if %counter% equ 6 (
    echo MasteringDisplayPrimaries matches the  __REC2020__ color profile.
 goto :stop ) else (
    if %counter% gtr 0 (
        echo MasteringDisplayPrimaries most likely matches the __REC2020__ but there one or more missing or incorrect primary value/s.
set /a counter+=0
    )
)








)
:break

for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:X>34000</r2:X>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>16000</r2:Y>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
echo.
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:X>13250</r2:X>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>34500</r2:Y>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
echo.
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:X>7500</r2:X>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
for /f "delims=" %%A in ('type  "%FILE_PATH%" ^| findstr /ni /i "<r2:Y>3000</r2:Y>"') do (
    echo Line no. %%A
  set /a counter+=2
 goto :break

)
:break
echo. 

if %counter% equ 12 (
    echo MasteringDisplayPrimaries matches the  __P3__ color profile.
) else (
    if %counter% gtr 0 (
        echo MasteringDisplayPrimaries most likely matches the __P3__ but there one or more missing or incorrect primary value/s. 
set /a counter+=0
    )
)

if %counter% equ 0 (
    echo MasteringDisplayPrimaries are not found!!!!.
	echo probably the XML is invalid, Kindly check the XML manually.
)
:stop




endlocal





echo.


echo ^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^> MasteringDisplayLuminance. 
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<r1:MasteringDisplayMaximumLuminance>10000000</r1:MasteringDisplayMaximumLuminance>"') do (
    echo Line no. %%A

 goto :break
)
:break


for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<r1:MasteringDisplayMinimumLuminance>50</r1:MasteringDisplayMinimumLuminance>"') do (
    echo Line no. %%A

 goto :break
)
:break
for /f "delims=" %%A in ('type "%FILE_PATH%" ^| findstr /ni /i  "<r1:MasteringDisplayMinimumLuminance>1</r1:MasteringDisplayMinimumLuminance>"') do (
    echo Line no. %%A

 goto :break
)
:break


echo.
echo.


type "%file_path%" 2>nul | findstr /i /c:"<r1:MasteringDisplayMinimumLuminance>1</r1:MasteringDisplayMinimumLuminance>" >nul
if not errorlevel 1 (
  echo MasteringDisplayLuminance matches __Rec2020__ color space profile) 


type "%file_path%" 2>nul | findstr /i /c:"<r1:MasteringDisplayMinimumLuminance>50</r1:MasteringDisplayMinimumLuminance>" >nul
if not errorlevel 1 (
    echo MasteringDisplayLuminance matches __P3__ color space profile
)


echo.
echo ## %~nx1 done.
echo.
pause