param (
    [string]$directory,
    [string]$word
)

if (-not ($directory -and $word)) {
    Write-Host "Usage: $MyInvocation.MyCommand -directory <directory_name> -word <word>"
    exit 1
}

if (-not (Test-Path $directory -PathType Container)) {
    Write-Host "Directory '$directory' does not exist."
    exit 1
}

try {
    Get-ChildItem -Path $directory -File | Where-Object { $_.Name -like "*$word*" } | Remove-Item -Force
    Write-Host "All files containing the word '$word' in their names within the directory '$directory' have been deleted."
} catch {
    Write-Host "An error occurred while deleting files."
    exit 1
}
