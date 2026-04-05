Import-Module "$PSScriptRoot\modules\Cleaner.psm1" -Force
Import-Module "$PSScriptRoot\modules\Optimizer.psm1" -Force
Import-Module "$PSScriptRoot\modules\Utils.psm1" -Force

$ClearHost = { Clear-Host }

function Show-Header {
    &$ClearHost
    Write-Host @"
    
  _   _       _ _ _____           _ _    _ _   
 | \ | |     | | |  __ \         | | |  (_) |  
 |  \| |_   _| | | |__) |__   ___| | | ___| |_ 
 | . ` | | | | | |  ___/ _ \ / _ \ | |/ / | __|
 | |\  | |_| | | | |  | (_) |  __/ |   <| | |_ 
 |_| \_|\__,_|_|_|_|   \___/ \___|_|_|\_\_|\__|
                                               
           [ By @nullptrflow ]

"@ -ForegroundColor Cyan
}

function Main-Menu {
    while ($true) {
        Show-Header
        Write-Host " [1] System Cleaner (Traces/Logs)" -ForegroundColor White
        Write-Host " [2] Gaming Optimizer (Power/Perf)" -ForegroundColor White
        Write-Host " [3] Driver Environment Check (AV/SB)" -ForegroundColor White
        Write-Host " [4] HWID Manifest (Check IDs)" -ForegroundColor White
        Write-Host " [0] Exit Toolkit" -ForegroundColor Red
        Write-Host ""
        $choice = Read-Host "[?] Selection"

        switch ($choice) {
            "1" { Show-Header; Clear-Traces; Pause }
            "2" { Show-Header; Set-PowerPlan; Disable-GameBar; Clean-StandbyList; Pause }
            "3" { Show-Header; Check-SecureBoot; Pause }
            "4" { Show-Header; Get-HardwareFingerprint; Pause }
            "0" { break }
        }
    }
}

if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "[!] Admin privileges required! Relaunching..." -ForegroundColor Red
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Main-Menu
