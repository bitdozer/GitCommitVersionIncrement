
### General
Demonstrates incrementing plain text version files using a post-commit hook and PowerShell in Windows.

### References

Version increment hooks using info from here:

https://stackoverflow.com/questions/30195025/increment-version-in-a-text-file

Self-amending commit:

https://stackoverflow.com/questions/3284292/can-a-git-hook-automatically-add-files-to-the-commit

How to get the hooks working in Windows

https://www.visualstudiogeeks.com/DevOps/UsingPowerShellForGitHooksWithVstsGitOnWindows

How to commit the hooks in the repo by redirecting core.hooksPath

https://www.visualstudiogeeks.com/DevOps/UsingGitHooksWithVstsGitOnWindows#githooks-oh-windows

How to figure out the correct core.hooksPath path syntax:

https://github.com/git-for-windows/git/issues/1420

This was the only version that worked (Windows):

```git config --global core.hooksPath .\.githooks```