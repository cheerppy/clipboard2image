@echo off
setLocal

set dirPath=%UserProfile%\OneDrive\Picture
set fileName=sample-image.jpg
set filePath=%dirPath%\%fileName%

set script=(Get-Clipboard -Format Image).Save("%filePath%",[System.Drawing.Imaging.ImageFormat]::Jpeg)
set script=%script:"=\"%
powershell -Command "%script%"

if %ERRORLEVEL% neq 0 (
	echo.
	echo Press any key to exit . . .
	pause > null
	exit 1
)

explorer /select,"%filePath%"
