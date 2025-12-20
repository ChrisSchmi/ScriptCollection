@echo off
for /F "tokens=* delims= " %%G in ('wevtutil.exe el') do wevtutil.exe cl "%%G"

pause
