@echo off
echo Update Windows Defender Definitions
echo ===================================
echo The command netsh int ip reset resets the TCP/IP stack in Windows.
echo It deletes custom IPv4 settings and restores the registry keys for TCP/IP
echo and DHCP to their default values.
echo.
netsh int ip reset

pause