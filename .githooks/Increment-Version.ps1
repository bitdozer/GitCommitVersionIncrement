$file = "./version.txt"
$fileVersion = (Get-Content $file | Select -First 1)
$fileVersion = [int]$fileVersion + 1
$fileVersion | Set-Content $file