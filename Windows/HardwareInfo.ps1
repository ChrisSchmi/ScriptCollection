# Hardware-Info als Textdatei (korrigiert)
$OutputPath = "$env:USERPROFILE\Desktop\HardwareInfo.txt"
$Output = @()

$Output += "=== HARDWARE-ÜBERSICHT ==="
$Output += "Generiert: $(Get-Date)"

$CPU = Get-CimInstance Win32_Processor | Select-Object -First 1
$Output += "`nCPU: $($CPU.Name)"
$Output += "  Kerne: $($CPU.NumberOfCores) | Threads: $($CPU.NumberOfLogicalProcessors) | Takt: $($CPU.MaxClockSpeed) MHz"

$RAM_Total = [math]::Round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB, 2)
$RAM_Details = Get-CimInstance Win32_PhysicalMemory | ForEach-Object { 
    "$([math]::Round($_.Capacity / 1GB, 0))GB @ $($_.Speed)MHz" 
}
$Output += "`nRAM: $RAM_Total GB gesamt"
$Output += "  Module: $($RAM_Details -join ', ')"

$GPU = Get-CimInstance Win32_VideoController | Select-Object -First 2
$Output += "`nGPU(s):"
foreach ($g in $GPU) { 
    $VRAM = if ($g.AdapterRAM) { [math]::Round($g.AdapterRAM / 1GB, 0) } else { "N/A" }
    $Output += "  - $($g.Name) ($VRAM GB VRAM)"
}

$Disks = Get-CimInstance Win32_DiskDrive
$Output += "`nFestplatten:"
foreach ($disk in $Disks) { 
    $SizeGB = [math]::Round($disk.Size / 1GB, 0)
    $Output += "  - $($disk.Model) ($SizeGB GB)"
}

$Board = Get-CimInstance Win32_BaseBoard | Select-Object -First 1
$Output += "`nChipset/Mainboard: $($Board.Product) von $($Board.Manufacturer)"

$Output | Out-File -FilePath $OutputPath -Encoding UTF8
Write-Host "Hardware-Info gespeichert: $OutputPath" -ForegroundColor Green
