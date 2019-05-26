# increment prepend text
# $commitfile is -commitfile input parameter
param ($commitfile = $(throw "Commit message file is required."))
if (Test-Path $commitfile -PathType Leaf)
{	$fileVersion = (Get-Content $commitfile | Select -First 1) }
else 
{	$fileVersion = 0 }
$fileVersion = "[r0000] " + $fileVersion
$fileVersion | Set-Content $commitfile

