# PowerShell script to update credits section to all HTML pages
$pagesPath = "h:\PROJECT_CODE\WiseProducts\WiseStudio\basic\studio-main\wstudio\pages"
$indexPath = "h:\PROJECT_CODE\WiseProducts\WiseStudio\basic\studio-main\wstudio\index.html"
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

# Updated credits section HTML
$creditsSection = @"
                        <div class="credits-section mt-3 mb-2">
                            <p class="mb-1 text-muted" style="font-size: 0.9rem;">
                                <i class="fas fa-handshake" style="color: #3498db;"></i> Brought to you in partnership with:
                            </p>
                            <div class="d-flex justify-content-center gap-3 flex-wrap">
                                <a href="https://yogicfuture.com/" target="_blank" rel="noopener noreferrer" 
                                   class="text-decoration-none" style="color: #87CEEB; font-size: 0.85rem;">
                                    <i class="fas fa-external-link-alt me-1"></i>YogicFuture.com
                                </a>
                                <span class="text-muted" style="font-size: 0.85rem;">•</span>
                                <a href="https://www.businesstechlabs.com/" target="_blank" rel="noopener noreferrer" 
                                   class="text-decoration-none" style="color: #87CEEB; font-size: 0.85rem;">
                                    <i class="fas fa-external-link-alt me-1"></i>BusinessTechLabs.com
                                </a>
                            </div>
                        </div>
"@

# Process pages folder files
foreach ($file in $files) {
    $filePath = Join-Path $pagesPath $file
    if (Test-Path $filePath) {
        Write-Host "Processing $file..."
        
        # Read the file content
        $content = Get-Content $filePath -Raw
        
        # Check if old credits section exists and replace it
        if ($content -like "*Special thanks to our partners*") {
            # Replace the entire old credits section with new one
            $pattern = '<div class="credits-section mt-3 mb-2">.*?</div>\s*</div>'
            $content = $content -replace $pattern, "$creditsSection"
            
            # Write back to file
            Set-Content $filePath $content -NoNewline
            
            Write-Host "Updated credits section in $file"
        } elseif ($content -notlike "*Brought to you in partnership with*") {
            # Add the new credits section before the footer-links div
            $content = $content -replace '(\s*<div class="footer-links mt-3">)', "$creditsSection`$1"
            
            # Write back to file
            Set-Content $filePath $content -NoNewline
            
            Write-Host "Added new credits section to $file"
        } else {
            Write-Host "Credits section already updated in $file"
        }
    } else {
        Write-Host "File not found: $file"
    }
}

# Process index.html
if (Test-Path $indexPath) {
    Write-Host "Processing index.html..."
    
    # Read the file content
    $content = Get-Content $indexPath -Raw
    
    # Check if credits section already exists
    if ($content -notlike "*Brought to you in partnership with*") {
        # Add the credits section before the footer-links div
        $content = $content -replace '(\s*<div class="footer-links mt-3">)', "$creditsSection`$1"
        
        # Write back to file
        Set-Content $indexPath $content -NoNewline
        
        Write-Host "Added credits section to index.html"
    } else {
        Write-Host "Credits section already exists in index.html"
    }
} else {
    Write-Host "index.html not found"
}

Write-Host "All files processed!"
