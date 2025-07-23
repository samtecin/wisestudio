# PowerShell script to properly update all credits sections
$pagesPath = "h:\PROJECT_CODE\WiseProducts\WiseStudio\basic\studio-main\wstudio\pages"
$files = @(
    "advocates.html",
    "alternative-health.html", 
    "beauty-spa.html",
    "colleges.html",
    "creative-arts.html",
    "events.html",
    "fitness-trainers.html",
    "schools.html",
    "therapy-coaching.html",
    "tuitions.html",
    "wellness-coaches.html"
)

foreach ($file in $files) {
    $filePath = Join-Path $pagesPath $file
    if (Test-Path $filePath) {
        Write-Host "Processing $file..."
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Replace heart icon with handshake and update text
        $content = $content -replace '<i class="fas fa-heart" style="color: #e74c3c;"></i> Special thanks to our partners:', '<i class="fas fa-handshake" style="color: #3498db;"></i> Brought to you in partnership with:'
        
        # Write back to file
        Set-Content $filePath $content -NoNewline
        
        Write-Host "Updated credits text in $file"
    } else {
        Write-Host "File not found: $file"
    }
}

Write-Host "All remaining files processed!"
