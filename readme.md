
### General
Demonstrates incrementing plain text version files using a post-commit hook and PowerShell in Windows.

During each commit, the three version files are incremented and amended into the current commit.

 - version.txt - integer versioning: 7, 8, 9, etc.
 - version-dotted.txt - dotted versioning, e.g. 1.2.3.45
 - version-dotted-carried.txt - dotted, minor, build, and revision roll over at 1.9.9.9 > 2.0.0.0

### References

Version increment hooks using info from here:

https://stackoverflow.com/questions/30195025/increment-version-in-a-text-file

Self-amending commit:

https://stackoverflow.com/questions/3284292/can-a-git-hook-automatically-add-files-to-the-commit

How to get the hooks working in Windows

https://www.visualstudiogeeks.com/DevOps/UsingPowerShellForGitHooksWithVstsGitOnWindows

How to commit the hooks in the repo by redirecting core.hooksPath

https://www.visualstudiogeeks.com/DevOps/UsingGitHooksWithVstsGitOnWindows#githooks-oh-windows (BAD)

Archive of above:
https://drive.google.com/file/d/1RxQqayZ9baHCdxsI9hpWKP9ox3mjo_6Y/view?usp=sharing

How to figure out the correct core.hooksPath path syntax:

https://github.com/git-for-windows/git/issues/1420

This was the only version that worked (Windows):

```git config --global core.hooksPath .\.githooks```
or
```git config --local core.hooksPath .\.githooks```

If using --local, you will have to re-issue the command each time you clone a new working copy.
