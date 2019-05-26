# increment prepend text
# $file is -file input parameter
if (Test-Path $file -PathType Leaf)
{	$fileVersion = (Get-Content $file | Select -First 1) }
else 
{	$fileVersion = 0 }
$fileVersion = "[r0000] " + $fileVersion
$fileVersion | Set-Content $file

