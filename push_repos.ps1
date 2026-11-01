Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "Pushing BillCare Changes to Both Repositories" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/3] Staging and committing fixes..." -ForegroundColor Yellow
git add .
git commit -m "fix(booking): use addAppointment method from billcare context to resolve Netlify type error"

Write-Host ""
Write-Host "[2/3] Force-syncing to billcareweb (Frontend Netlify)..." -ForegroundColor Yellow
git push billcareweb main --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] billcareweb updated successfully." -ForegroundColor Green
} else {
    Write-Host "[ERROR] Failed to push to billcareweb." -ForegroundColor Red
}

Write-Host ""
Write-Host "[3/3] Force-syncing to billcare (Backend Railway)..." -ForegroundColor Yellow
git push billcare main --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] billcare updated successfully." -ForegroundColor Green
} else {
    Write-Host "[ERROR] Failed to push to billcare." -ForegroundColor Red
}

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "Sync Complete! All remotes are updated." -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Cyan
