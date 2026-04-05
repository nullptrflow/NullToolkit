function Get-HardwareFingerprint {
    Write-Host "[*] Gathering hardware IDs..." -ForegroundColor Magenta
    $DiskSerial = Get-WmiObject Win32_DiskDrive | Select-Object -First 1 | Select-Object -ExpandProperty SerialNumber
    $Motherboard = Get-WmiObject Win32_BaseBoard | Select-Object -ExpandProperty SerialNumber
    $CPU = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty ProcessorId
    
    Write-Host "--- HWID Manifest ---" -ForegroundColor Blue
    Write-Host "Disk ID: $DiskSerial" -ForegroundColor Yellow
    Write-Host "BIOS ID: $Motherboard" -ForegroundColor Yellow
    Write-Host "CPU ID:  $CPU" -ForegroundColor Yellow
    Write-Host "----------------------" -ForegroundColor Blue
}

function Check-SecureBoot {
    $sb = Confirm-SecureBootUEFI
    if ($sb -eq $true) {
        Write-Host "[!] Secure Boot is ENABLED." -ForegroundColor Red
    } else {
        Write-Host "[+] Secure Boot is DISABLED (Safe for many drivers)." -ForegroundColor Green
    }
}

Export-ModuleMember -Function Get-HardwareFingerprint, Check-SecureBoot
