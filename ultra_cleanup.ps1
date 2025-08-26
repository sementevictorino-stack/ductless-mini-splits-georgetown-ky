# Ultra-comprehensive cleanup script to eliminate ALL remaining Staten Island references
$basePath = "c:\Users\Administrator\Desktop\georgetown-ductless-mini-splits-main\ductless mini splits georgetown ky"
$files = Get-ChildItem $basePath -Recurse -Filter "*.html"

Write-Host "Starting ultra-comprehensive cleanup..."

foreach($file in $files) {
    Write-Host "Processing: $($file.Name)"
    
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    # Replace ALL variations of Staten Island
    $content = $content -replace 'Staten Island', 'Georgetown, KY'
    
    # Clean up double Georgetown, KY references
    $content = $content -replace 'Georgetown, KY, KY', 'Georgetown, KY'
    $content = $content -replace 'Georgetown, KY KY', 'Georgetown, KY'
    
    # Fix specific title and content patterns
    $content = $content -replace 'Services in Georgetown, KY', 'Services in Georgetown, KY'
    $content = $content -replace 'throughout Georgetown, KY', 'throughout Georgetown, KY'
    $content = $content -replace 'Georgetown, KY property', 'Georgetown, KY property'
    
    # Fix business name consistency
    $content = $content -replace 'Georgetown, KY Ductless Mini Splits', 'Georgetown KY Ductless Mini Splits'
    
    # Fix state references
    $content = $content -replace ', NY', ', KY'
    $content = $content -replace '\bNY\b', 'KY'
    
    # Fix specific service titles
    $content = $content -replace 'Services Georgetown, KY', 'Services Georgetown KY'
    $content = $content -replace 'Installation Georgetown, KY', 'Installation Georgetown KY'
    $content = $content -replace 'Repair Georgetown, KY', 'Repair Georgetown KY'
    $content = $content -replace 'Quality Georgetown, KY', 'Quality Georgetown KY'
    
    # Fix alt text and image descriptions
    $content = $content -replace 'in Georgetown, KY"', 'in Georgetown KY"'
    
    # Fix zip codes in text
    $content = $content -replace '10301', '40324'
    $content = $content -replace '10302', '40324'
    $content = $content -replace '10303', '40324'
    $content = $content -replace '10304', '40324'
    $content = $content -replace '10305', '40324'
    $content = $content -replace '10306', '40324'
    $content = $content -replace '10307', '40328'
    $content = $content -replace '10308', '40324'
    $content = $content -replace '10309', '40328'
    $content = $content -replace '10310', '40324'
    $content = $content -replace '10311', '40324'
    $content = $content -replace '10312', '40328'
    $content = $content -replace '10313', '40324'
    $content = $content -replace '10314', '40324'
    
    # Fix neighborhood references that might still exist
    $content = $content -replace 'St\. George', 'Downtown Georgetown'
    $content = $content -replace 'Stapleton', 'West Georgetown'
    $content = $content -replace 'Port Richmond', 'East Georgetown'
    $content = $content -replace 'Tottenville', 'North Georgetown'
    $content = $content -replace 'Great Kills', 'College Area'
    $content = $content -replace 'New Brighton', 'South Georgetown'
    $content = $content -replace 'West Brighton', 'Horse Farms Area'
    $content = $content -replace 'South Beach', 'I-75 Corridor'
    $content = $content -replace 'Bay Terrace', 'Downtown Georgetown'
    
    # Fix any remaining business references
    $content = $content -replace 'Georgetown, KY Ductless Mini Splits', 'Georgetown KY Ductless Mini Splits'
    $content = $content -replace 'statenislandductless', 'georgetownkyductless'
    
    # Fix serving area references
    $content = $content -replace 'Serving: [^,]+, Georgetown, KY, KY', 'Serving: Georgetown, KY'
    $content = $content -replace 'Georgetown, KY, Georgetown, KY', 'Georgetown, KY'
    
    [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
}

Write-Host "Ultra-comprehensive cleanup completed on $($files.Count) files!"
