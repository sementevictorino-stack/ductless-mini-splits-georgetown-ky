# PowerShell script to update all HTML content from Staten Island to Georgetown, KY
# Category: Ductless Mini Split, City: Georgetown, State: KY

$basePath = "c:\Users\Administrator\Desktop\georgetown-ductless-mini-splits-main\ductless mini splits georgetown ky"

# Define all the text replacements
$replacements = @{
    # Basic location replacements
    "Staten Island" = "Georgetown"
    "Staten Island," = "Georgetown,"
    "Staten Island's" = "Georgetown's" 
    "Staten Island NY" = "Georgetown KY"
    "Staten Island, NY" = "Georgetown, KY"
    "Staten Island, New York" = "Georgetown, Kentucky"
    "SI Ductless Pro" = "Georgetown Ductless Pro"
    
    # Business name replacements
    "Staten Island Ductless Mini Splits" = "Georgetown KY Ductless Mini Splits"
    "statenislandductless.com" = "georgetownkyductless.com"
    "info@statenislandductless.com" = "info@georgetownkyductless.com"
    "facebook.com/statenislandductless" = "facebook.com/georgetownkyductless"
    "instagram.com/statenislandductless" = "instagram.com/georgetownkyductless"
    
    # Address replacements
    "123 Victory Blvd" = "123 Main Street"
    "addressRegion`": `"NY`"" = "addressRegion`": `"KY`""
    "postalCode`": `"10301`"" = "postalCode`": `"40324`""
    "postalCode`": `"10302`"" = "postalCode`": `"40324`""
    "postalCode`": `"10303`"" = "postalCode`": `"40324`""
    "postalCode`": `"10304`"" = "postalCode`": `"40324`""
    "postalCode`": `"10305`"" = "postalCode`": `"40324`""
    "postalCode`": `"10306`"" = "postalCode`": `"40324`""
    "postalCode`": `"10307`"" = "postalCode`": `"40328`""
    "postalCode`": `"10308`"" = "postalCode`": `"40324`""
    "postalCode`": `"10309`"" = "postalCode`": `"40328`""
    "postalCode`": `"10310`"" = "postalCode`": `"40324`""
    "postalCode`": `"10311`"" = "postalCode`": `"40324`""
    "postalCode`": `"10312`"" = "postalCode`": `"40328`""
    "postalCode`": `"10313`"" = "postalCode`": `"40324`""
    "postalCode`": `"10314`"" = "postalCode`": `"40324`""
    
    # Coordinate replacements (Staten Island to Georgetown, KY)
    "latitude`": 40.6282" = "latitude`": 38.2098"
    "longitude`": -74.0776" = "longitude`": -84.5588"
    
    # Zip code references in content
    "10301" = "40324"
    "10302" = "40324" 
    "10303" = "40324"
    "10304" = "40324"
    "10305" = "40324"
    "10306" = "40324"
    "10307" = "40328"
    "10308" = "40324"
    "10309" = "40328"
    "10310" = "40324"
    "10311" = "40324"
    "10312" = "40328"
    "10313" = "40324"
    "10314" = "40324"
    
    # Climate and geographic references
    "island's" = "city's"
    "the island" = "the city"
    "waterfront" = "downtown"
    "coastal" = "Kentucky"
    "salt air" = "seasonal weather"
    "marine-grade" = "weather-resistant"
    "coastal climate" = "Kentucky climate"
    "winter storm" = "Kentucky winter storm"
    "heat wave" = "summer heat wave"
    
    # Neighborhood replacements
    "St. George" = "Downtown Georgetown"
    "Stapleton" = "West Georgetown"
    "Port Richmond" = "East Georgetown"
    "Tottenville" = "North Georgetown"
    "Great Kills" = "College Area"
    "New Brighton" = "South Georgetown"
    "West Brighton" = "Horse Farms Area"
    "South Beach" = "I-75 Corridor"
    "Bay Terrace" = "Downtown Georgetown"
    "Castleton Corners" = "West Georgetown"
    "Eltingville" = "East Georgetown"
    "New Dorp" = "North Georgetown"
    "Oakwood" = "College Area"
    "Pleasant Plains" = "South Georgetown"
    "Richmond Valley" = "Horse Farms Area"
    "Willowbrook" = "I-75 Corridor"
    "Mariners Harbor" = "Downtown Georgetown"
    "Grant City" = "West Georgetown"
    "Dongan Hills" = "East Georgetown"
    "Charleston" = "North Georgetown"
    "Clifton" = "College Area"
    
    # State abbreviation in various contexts
    ", NY" = ", KY"
    " NY " = " KY "
    "New York" = "Kentucky"
    
    # Service area descriptions
    "North Shore:" = "Downtown Area:"
    "Mid-Island:" = "West Georgetown:"
    "South Shore:" = "East Georgetown:" 
    "East Shore:" = "North Georgetown:"
    
    # Reviews and testimonials location updates
    "St. George" = "Georgetown"
    "Tottenville" = "Georgetown"
    "Great Kills" = "Georgetown"
    
    # Emergency banner updates
    "Available in Bay Terrace" = "Available in Georgetown"
    "Available in St. George" = "Available in Georgetown"
    "Available in Stapleton" = "Available in Georgetown"
    "Available in Port Richmond" = "Available in Georgetown"
    "Available in Tottenville" = "Available in Georgetown"
    "Available in Great Kills" = "Available in Georgetown"
    "Available in New Brighton" = "Available in Georgetown"
    "Available in West Brighton" = "Available in Georgetown"
    "Available in South Beach" = "Available in Georgetown"
    "Available in Castleton Corners" = "Available in Georgetown"
    "Available in Eltingville" = "Available in Georgetown"
    "Available in New Dorp" = "Available in Georgetown"
    "Available in Oakwood" = "Available in Georgetown"
    "Available in Pleasant Plains" = "Available in Georgetown"
    "Available in Richmond Valley" = "Available in Georgetown"
    "Available in Willowbrook" = "Available in Georgetown"
    "Available in Mariners Harbor" = "Available in Georgetown"
    "Available in Grant City" = "Available in Georgetown"
    "Available in Dongan Hills" = "Available in Georgetown"
    "Available in Charleston" = "Available in Georgetown"
    "Available in Clifton" = "Available in Georgetown"
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

Write-Host "Found $($htmlFiles.Count) HTML files to update..."

foreach ($file in $htmlFiles) {
    Write-Host "Updating: $($file.Name)"
    
    # Read file content
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Apply all replacements
    foreach ($find in $replacements.Keys) {
        $replace = $replacements[$find]
        $content = $content -replace [regex]::Escape($find), $replace
    }
    
    # Write updated content back to file
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "All files updated successfully!"
Write-Host "Updated $($htmlFiles.Count) HTML files with Georgetown, KY content."
