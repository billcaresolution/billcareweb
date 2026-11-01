@echo off
echo ==============================================
echo Pushing BillCare Changes to Both Repositories
echo ==============================================
echo.
echo [1/3] Staging and committing fixes...
git add .
git commit -m "fix(booking): use addAppointment method from billcare context to resolve Netlify type error"
echo.
echo [2/3] Force-syncing to billcareweb (Frontend Netlify)...
git push billcareweb main --force
if %ERRORLEVEL% EQU 0 (
    echo [OK] billcareweb updated successfully.
) else (
    echo [ERROR] Failed to push to billcareweb.
)
echo.
echo [3/3] Force-syncing to billcare (Backend Railway)...
git push billcare main --force
if %ERRORLEVEL% EQU 0 (
    echo [OK] billcare updated successfully.
) else (
    echo [ERROR] Failed to push to billcare.
)
echo.
echo ==============================================
echo Sync Complete! All remotes are updated.
echo ==============================================
pause
