param (
    [string]$username
)

if (-not $username) {
    Write-Host "Naudojimas: $MyInvocation.MyCommand <naudotojo_vardas>"
    exit 1
}

Write-Host "Searching for login records for user: $username"

$login_records = Get-WinEvent -FilterHashtable @{Logname='Security';ID=4624} | Where-Object { $_.Message -like "*$username*" }

if ($login_records -ne $null) {
    Write-Host "Login records found for user: $username"

    $last_login = $login_records[-1].TimeCreated
    $current_time = Get-Date
    $duration = New-TimeSpan -Start $last_login -End $current_time

    Write-Host "Naudotojas $username dirba $($duration.Hours) val., $($duration.Minutes) min., ir $($duration.Seconds) sek."
} else {
    Write-Host "Naudotojas $username neprisijungęs prie sistemos."
}
