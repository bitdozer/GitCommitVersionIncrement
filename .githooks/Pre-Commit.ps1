# increment plain integer
param (
	$branch
)
# non-master* branches don't increment version
if (!$branch.StartsWith("master")) { Exit }

$file = "./version.txt"
if (Test-Path $file -PathType Leaf)
{	$fileVersion = (Get-Content $file | Select -First 1) }
else 
{	$fileVersion = 0 }
$fileVersion = [int]$fileVersion + 1
$fileVersion | Set-Content $file

# increment dotted
$file = "./version-dotted.txt"
if (Test-Path $file -PathType Leaf)
{	$fileVersion = [version](Get-Content $file | Select -First 1) }
else 
{	$fileVersion = [version]"0.0.0.0" }
$newVersion = "{0}.{1}.{2}.{3}" -f [int]$fileVersion.Major, [int]$fileVersion.Minor, [int]$fileVersion.Build, ([int]$fileVersion.Revision + 1)
$newVersion | Set-Content $file

# increment dotted with carry at >.9
$file = "./version-dotted-carried.txt"
if (Test-Path $file -PathType Leaf)
{	$fileVersion = [version](Get-Content $file | Select -First 1) }
else 
{	$fileVersion = [version]"0.0.0.0" }
$majorVersion = [int]$fileVersion.Major
$minorVersion = [int]$fileVersion.Minor
$buildVersion = [int]$fileVersion.Build
$revisionVersion = [int]$fileVersion.Revision + 1
if ($revisionVersion -gt 9) { 
	$revisionVersion = 0
	$buildVersion = $buildVersion + 1
}
if ($buildVersion -gt 9) { 
	$buildVersion = 0
	$minorVersion = $minorVersion + 1
}
if ($minorVersion -gt 9) { 
	$minorVersion = 0
	$majorVersion = $majorVersion + 1
}

$newVersion = "{0}.{1}.{2}.{3}" -f $majorVersion, $minorVersion, $buildVersion, $revisionVersion
$newVersion | Set-Content $file
