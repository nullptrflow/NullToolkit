function Set-PowerPlan( [string]$PlanName ) {
    Write-Host "[!] Setting power plan..." -ForegroundColor Cyan
    $Plans = powercfg /l
    if ($Plans -match "High performance") {
        powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
        Write-Host "[+] Switched to High Performance!" -ForegroundColor Green
    } else {
        Write-Host "[-] High Performance plan not found. Setting standard High Performance..." -ForegroundColor Yellow
        powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    }
}

function Disable-GameBar {
    Write-Host "[!] Disabling GameBar for maximum stability..." -ForegroundColor Cyan
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -ErrorAction SilentlyContinue
    Write-Host "[+] GameBar disabled!" -ForegroundColor Green
}

function Clean-StandbyList {
    [GC]::Collect()
    Write-Host "[+] Memory optimized (Garbage Collected)." -ForegroundColor Green
}

Export-ModuleMember -Function Set-PowerPlan, Disable-GameBar, Clean-StandbyList
