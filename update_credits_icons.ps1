# PowerShell script to update credits section with both handshake and heart icons
$pagesPath = "h:\PROJECT_CODE\WiseProducts\WiseStudio\basic\studio-main\wstudio\pages"
$files = @(
    "advocates.html",
    "alternative-health.html", 
    "beauty-spa.html",
    "colleges.html",
    "creative-arts.html",
    "doctors.html",
    "events.html",
    "fitness-trainers.html",
    "schools.html",
    "therapy-coaching.html",
    "tuitions.html",
    "wellness-coaches.html"
)

# Process pages folder files
foreach ($file in $files) {
    $filePath = Join-Path $pagesPath $file
    if (Test-Path $filePath) {
        Write-Host "Processing $file..."
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Update the credits section to include both icons
        $oldPattern = '<i class="fas fa-handshake" style="color: #3498db;"></i> Brought to you in partnership with:'
        $newPattern = '<i class="fas fa-handshake" style="color: #3498db;"></i> <i class="fas fa-heart" style="color: #e74c3c;"></i> Brought to you in partnership with:'
        
        if ($content -match [regex]::Escape($oldPattern)) {
            $content = $content -replace [regex]::Escape($oldPattern), $newPattern
            
            # Write back to file
            Set-Content $filePath $content -NoNewline
            
            Write-Host "Updated credits icons in $file"
        } else {
            Write-Host "Credits section pattern not found in $file"
        }
    } else {
        Write-Host "File not found: $file"
    }
}

Write-Host "All files processed!"
