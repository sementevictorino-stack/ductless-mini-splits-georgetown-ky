# Final comprehensive cleanup script
$basePath = "c:\Users\Administrator\Desktop\georgetown-ductless-mini-splits-main\ductless mini splits georgetown ky"
$files = Get-ChildItem $basePath -Recurse -Filter "*.html"

foreach($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Comprehensive Staten Island to Georgetown replacements
    $content = $content -replace 'Staten Island', 'Georgetown'
    $content = $content -replace 'Georgetown, NY', 'Georgetown, KY'
    $content = $content -replace 'Georgetown NY', 'Georgetown KY'
    $content = $content -replace '\bNY\b', 'KY'
    
    # Fix zip codes in parentheses
    $content = $content -replace '\(10302\)', '(40324)'
    $content = $content -replace '\(10304\)', '(40324)'
    $content = $content -replace '\(10308\)', '(40324)'
    $content = $content -replace '\(10301\)', '(40324)'
    $content = $content -replace '\(10310\)', '(40324)'
    $content = $content -replace '\(10305\)', '(40324)'
    $content = $content -replace '\(10307\)', '(40328)'
    $content = $content -replace '\(10309\)', '(40328)'
    $content = $content -replace '\(10312\)', '(40328)'
    
    # Context-specific Georgetown fixes
    $content = $content -replace 'services in Georgetown\.', 'services in Georgetown, KY.'
    $content = $content -replace 'throughout Georgetown\.', 'throughout Georgetown, KY.'
    $content = $content -replace 'Georgetown property', 'Georgetown, KY property'
    $content = $content -replace 'Georgetown residents', 'Georgetown, KY residents'
    $content = $content -replace 'Georgetown homes', 'Georgetown, KY homes'
    $content = $content -replace 'Georgetown businesses', 'Georgetown, KY businesses'
    $content = $content -replace 'Georgetown communities', 'Georgetown, KY communities'
    $content = $content -replace 'Georgetown neighborhoods', 'Georgetown, KY neighborhoods'
    $content = $content -replace 'Georgetown zip codes', 'Georgetown, KY zip codes'
    
    # Fix neighborhood-specific references
    $content = $content -replace 'Bay Terrace Georgetown', 'Downtown Georgetown'
    $content = $content -replace 'Georgetown waterfront', 'Georgetown downtown'
    $content = $content -replace 'All Georgetown([^,])', 'All Georgetown, KY$1'
    
    # Fix business name references that might have been missed
    $content = $content -replace 'Georgetown Ductless Mini Splits(?!\s*-)', 'Georgetown KY Ductless Mini Splits'
    
    Set-Content $file.FullName -Value $content -Encoding UTF8
}

Write-Host "Comprehensive cleanup completed on $($files.Count) files!"
