#########################################
#Sets User Greeting Based on Time of Day#
#########################################
$Hour = (Get-Date).Hour
If ($Hour -lt 12) {"Good Morning Casey"}
ElseIf ($Hour -gt 17) {"Good Eventing Casey"}
Else {"Good Afternoon Casey"}

~\.local\bin\winfetch.ps1

################################### 
# Style default PowerShell Console#
##################################
$shell = $Host.UI.RawUI
$shell.WindowTitle= "PowerShell 7.4.2"
$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"
# Load custom theme for Windows Terminal

###########
#Set Prompt#
############
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/xtoys.omp.json' | Invoke-Expression
 
###########################
#Import Chocolatey Profile#
###########################
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#################################
# Enhanced PowerShell Experience#
#################################
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String =  'DarkCyan'
}
 
 ##########################
 # Quality of Life Aliases#
 ##########################
# Navigation Shortcuts
function Docs { Set-Location -Path $HOME\Documents }
function Desktop { Set-Location -Path $HOME\Desktop }
function Downloads { Set-Location -Path $HOME\Downloads}
Set-Alias -Name drive -Value 'C:\Program Files\Google\Drive File Stream\launch.bat'
Set-Alias -Name np+ -Value 'C:\Program Files\Notepad++/Notepad++.exe'
 
# Quick Access to System Information
function sysinfo { Get-ComputerInfo }
 
#View History
Function Get-History-Full {Get-Content (Get-PSReadlineOption).HistorySavePath}
Set-Alias -name hist -value get-history-full -Option AllScope
 
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
 
########################### 
# Set PSReadline Functions#
###########################
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
