# increment prepend text
# $commitfile is -commitfile input parameter
Write-Host "Commit-Msg.ps1 invoked as: " -NoNewline
Write-Host $MyInvocation.Line
Write-Host $MyInvocation.UnboundArguments

Write-Host "arg 1 from ps: " -NoNewline
Write-Host $commitfile


#param ($commitfile = $(throw "Commit message file is required."))

#prepend the upcoing version number (plain int version)
$file = "./version.txt"
if (Test-Path $file -PathType Leaf)
{	
  Write-Host "Found version file"
  $fileVersion = (Get-Content $file | Select -First 1) 
  Write-Host "Read version"
  if (Test-Path $commitfile -PathType Leaf)
  {	
    Write-Host "Found commit message file"
    $commitmessage = (Get-Content $commitfile) 
    Write-Host "loaded commit message"
    $commitmessage = "[r" + $fileVersion  +"] " + $commitmessage
    # write the ammedned message back to the commitfile
    $commitmessage | Set-Content $commitfile
  }
  else 
  {	
    Write-Host "Missing commit message file"
    $commitmessage = ""
    Write-Host "no commit file"
  }
}
else 
{	
  # missing version number, do nothing
  #$fileVersion = 0 
}



