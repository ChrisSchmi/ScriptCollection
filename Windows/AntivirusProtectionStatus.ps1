Write-Host ""
Write-Host "###########################################################################" -ForegroundColor Red
Write-Host "# Check the current state of Windows Defender        (c) 2026 Chris Schmi #" -ForegroundColor Red
Write-Host "###########################################################################" -ForegroundColor Red
Write-Host ""
Write-Host "Checking RunningMode: normal = Windows Defender is primary scanner, passive = another scanner is the Primary scanner" -ForegroundColor Cyan
Get-MpComputerStatus | Select-Object AMRunningMode | Out-Host
Write-Host ""
Write-Host "Overview of the current protection settings" -ForegroundColor Cyan
Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, AMServiceEnabled | Out-Host
