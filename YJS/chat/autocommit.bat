ECHO OFF

IF NOT EXIST ".git\" (
    git init
    git config user.name "participant"
    git config user.email "<>"
    git add .gitignore
    git commit -m "First commit"
)
:periodic_commit
git config user.name "participant"
git config user.email "<>"
:try_commit
SET timestamp=%date% %time%
ECHO "%timestamp%" > timestamp.txt
ECHO "Pushing code at %timestamp%"
git add -A
git commit -m "Automatic commit %timestamp%"
IF NOT %ERRORLEVEL% EQU 0 ( 
    ECHO "Commit failed, trying again in 1 second."
    TIMEOUT 1 > NUL
    GOTO try_commit 
) ELSE (
    ECHO "Finished pushing code"
    ECHO "Waiting 15 seconds"
    TIMEOUT 15 > NUL
    GOTO periodic_commit
)


