Clear-EventLog -LogName Application, System, Security, "Windows PowerShell"

Get-CimInstance Win32_NTEventLogFile | Select-Object LogFileName, @{Name="Groesse_MB";Expression={("{0:N2}" -f ($_.FileSize / 1MB))}}, MaximumSize