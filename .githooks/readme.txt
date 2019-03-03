version increment hooks using info from here:

https://stackoverflow.com/questions/30195025/increment-version-in-a-text-file

How to get the hooks working in Windows

https://www.visualstudiogeeks.com/DevOps/UsingPowerShellForGitHooksWithVstsGitOnWindows

How to put the hooks in the repo

https://www.visualstudiogeeks.com/DevOps/UsingGitHooksWithVstsGitOnWindows#githooks-oh-windows

How to figure out the correct core.hooksPath path syntax:

https://github.com/git-for-windows/git/issues/1420

This was the only one that worked:

git config --global core.hooksPath .\.githooks