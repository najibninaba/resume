@ECHO OFF

REM Command file for generating documentation
	
set PANDOC=pandoc
set BASEDIR=%CD%
set INPUTDIR=%CD%\source
set OUTPUTDIR=%CD%\output
set STYLEDIR=%INPUTDIR%\style

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of
	echo.  pdf        to make PDF files
	echo.  clean      to remove all PDF files in the current directory
	goto end
)

if "%1" == "clean" (
	for /d %%i in (%OUTPUTDIR%\*.pdf) do rmdir /q /s %%i
	del /q /s *.pdf
	goto end
)

if "%1" == "pdf" (
	%PANDOC% -s %INPUTDIR%\cv.md -o %OUTPUTDIR%\cv.pdf ^
	--template=%STYLEDIR%\template.tex ^
	--latex-engine=xelatex
	goto end
)

:end