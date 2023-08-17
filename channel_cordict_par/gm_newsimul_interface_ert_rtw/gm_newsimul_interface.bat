
cd .

if "%1"=="" ("D:\MATLAB\R2023a\bin\win64\gmake"  -f gm_newsimul_interface.mk all) else ("D:\MATLAB\R2023a\bin\win64\gmake"  -f gm_newsimul_interface.mk %1)
@if errorlevel 1 goto error_exit

exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
exit /B 1