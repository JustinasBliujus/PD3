if ($args.Count -ne 1) {
    Write-Host "Usage: $MyInvocation.MyCommand <file_name>"
    exit 1
}

$file_name = $args[0]

# Check if the file exists
if (-not (Test-Path $file_name -PathType Leaf)) {
    Write-Host "File '$file_name' does not exist."
    exit 1
}

$temp_file = New-TemporaryFile
(Get-Content $file_name) | ForEach-Object {
    if (-not $odd) {
        $evenLine = $_
        $odd = $true
    } else {
        $joinedLine = $evenLine + " " + $_
        Add-Content $temp_file.FullName $joinedLine
        $odd = $false
    }
}

foreach ($line in Get-Content $temp_file.FullName) {
    $line_length = $line.Length
    Write-Host "Line: $line, Length: $line_length"
}
Remove-Item $temp_file.FullName
