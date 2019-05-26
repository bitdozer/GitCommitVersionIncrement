# $commitfile is -commitfile input parameter -- must be first non-comment line
param (
	$commitfile = $(throw "Commit message file is required."),
	$branch
)
Write-Host $branch
#prepend the version number (plain int version)
$file = "./version.txt"
if (Test-Path $file -PathType Leaf)
{	
  $fileVersion = (Get-Content $file | Select -First 1) 
  if (Test-Path $commitfile -PathType Leaf)
  {	
    $commitmessage = (Get-Content $commitfile) 
    $commitmessage = "[r" + $fileVersion  +"] " + $commitmessage
    # write the updated message back to the commitfile
    $commitmessage | Set-Content $commitfile
  }
  else 
  {	
    # missing commitmessage, do nothing
  }
}
else 
{	
  # missing version number, do nothing
}



