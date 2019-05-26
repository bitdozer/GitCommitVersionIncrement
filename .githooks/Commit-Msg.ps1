# increment prepend text

#prepend the upcoing version number (plain int version)
$file = "./version.txt"
if (Test-Path $file -PathType Leaf)
{	
  $fileVersion = (Get-Content $file | Select -First 1) 
  # $commitfile is -commitfile input parameter
  param ($commitfile = $(throw "Commit message file is required."))
  if (Test-Path $commitfile -PathType Leaf)
  {	
    $commitmessage = (Get-Content $commitfile) 
  }
  else 
  {	
    $commitmessage = ""
  }
  $commitmessage = "[r" + $fileVersion  +"] " + $commitmessage
  # write the ammedned message back to the commitfile
  $commitmessage | Set-Content $commitfile
}
else 
{	
  # missing version number, do nothing
  #$fileVersion = 0 
}



