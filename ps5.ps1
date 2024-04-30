param (
    [string]$arg
)

if (-not (Test-Path $arg)) {
    Write-Host "$arg nėra nei failo, nei direktorijos vardas."
    exit 1
}

if (Test-Path $arg -PathType Leaf) {
    Write-Host "$arg yra failo vardas."
    exit 0
}

if (Test-Path $arg -PathType Container) {
    Write-Host "$arg yra direktorijos vardas."
    exit 0
}

Write-Host "$arg nėra nei failo, nei direktorijos vardas."