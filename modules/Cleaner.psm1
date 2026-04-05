function Clear-Traces {
    Write-Host "[!] Cleaning temporary files..." -ForegroundColor Yellow
    Get-ChildItem -Path "$env:TEMP\*" -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    Get-ChildItem -Path "C:\Windows\Temp\*" -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "[!] Clearing Prefetch..." -ForegroundColor Yellow
    Get-ChildItem -Path "C:\Windows\Prefetch\*" -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    
    Write-Host "[!] Clearing Events Logs..." -ForegroundColor Yellow
    Get-WinEvent -ListLog * -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($_.LogName)
        } catch {}
    }

    Write-Host "[+] All traces cleared!" -ForegroundColor Green
}

Export-ModuleMember -Function Clear-Traces
