param (
    [string]$file,
    [int]$startLine,
    [int]$endLine
)

# Patikriname, ar pradžios ir pabaigos eilučių numeriai yra teisingi
if ($startLine -gt $endLine) {
    Write-Host "Klaida: Pradžios eilutės numeris negali būti didesnis už pabaigos numerį."
    exit 1
}

# Patikriname, ar failas egzistuoja
if (-not (Test-Path $file -PathType Leaf)) {
    Write-Host "Klaida: Failas '$file' nerastas arba nėra failas."
    exit 1
}

# Skaitome failą ir ieškome turinio tarp nurodytų eilučių numerių
try {
    $content = Get-Content $file -TotalCount $endLine | Select-Object -Skip ($startLine - 1)
    Write-Host $content
} catch {
    Write-Host "Klaida: Nepavyko perskaityti failo turinio arba rasti nurodytų eilučių."
    exit 1
}
