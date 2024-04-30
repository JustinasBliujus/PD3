param (
    [string[]]$filenames
)

if ($filenames.Count -eq 0) {
    Write-Host "Nenurodyti jokie failų vardai."
    exit 1
}

foreach ($filename in $filenames) {
    if (Test-Path $filename) {
        $new_filename = $filename.ToUpper()
        if ($new_filename -eq $filename) {
            Write-Host "Failas $filename jau yra didžiosiomis raidėmis. Praleidžiame."
        }
        elseif (Test-Path $new_filename) {
            Write-Host "Failas $new_filename jau egzistuoja. Praleidžiame."
        }
        else {
            Rename-Item -Path $filename -NewName $new_filename
            Write-Host "Failas $filename pervadintas į $new_filename."
        }
    }
    else {
        Write-Host "Failas $filename neegzistuoja."
    }
}
