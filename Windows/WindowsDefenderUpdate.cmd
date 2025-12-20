@echo off
echo Update Windows Defender Definitions
echo ===================================
echo.
echo seen here: https://www.microsoft.com/en-us/wdsi/defenderupdates
cd %ProgramFiles%\Windows Defender
MpCmdRun.exe -removedefinitions -dynamicsignatures
MpCmdRun.exe -SignatureUpdate

pause
	        