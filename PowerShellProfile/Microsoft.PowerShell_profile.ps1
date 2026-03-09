# Terminal-Icons (lazy)
if (Get-Command git -ErrorAction SilentlyContinue) {
	# https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
	Import-Module -Name Terminal-Icons
}

# PSReadLine(lazy)
if (Get-Command git -ErrorAction SilentlyContinue) {
	# https://www.hanselman.com/blog/adding-predictive-intellisense-to-my-windows-terminal-powershell-prompt-with-psreadline
	Import-Module PSReadLine
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# posh-git nur wenn Git verfügbar (lazy)
if (Get-Command git -ErrorAction SilentlyContinue) {
    Import-Module posh-git
}



