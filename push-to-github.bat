@echo off
setlocal

cd /d "%~dp0"

where git >nul 2>nul
if errorlevel 1 (
    if exist "%ProgramFiles%\Git\cmd\git.exe" (
        set "PATH=%ProgramFiles%\Git\cmd;%PATH%"
    ) else (
        echo Git was not found on PATH.
        echo Install Git for Windows or add Git to PATH, then try again.
        pause
        exit /b 1
    )
)

echo Staging changes...
git add .
if errorlevel 1 (
    echo Failed to stage changes.
    pause
    exit /b 1
)

git diff --cached --quiet
if not errorlevel 1 (
    echo No changes to commit.
    git status --short --branch
    pause
    exit /b 0
)

set "commitMessage="
set /p "commitMessage=Commit message: "
if not defined commitMessage set "commitMessage=Update project"

git commit -m "%commitMessage%"
if errorlevel 1 (
    echo Commit failed.
    pause
    exit /b 1
)

git push
if errorlevel 1 (
    echo Push failed.
    pause
    exit /b 1
)

echo Changes pushed successfully.
pause
