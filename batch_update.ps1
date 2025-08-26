# Optimized PowerShell script for batch HTML content replacement
# This script updates all critical business and location information

param(
    [string]$Path = "c:\Users\Administrator\Desktop\georgetown-ductless-mini-splits-main\ductless mini splits georgetown ky"
)

# Key replacements for business transformation
$criticalReplacements = @(
    @{Find = 'Staten Island'; Replace = 'Georgetown'},
    @{Find = 'SI Ductless Pro'; Replace = 'Georgetown Ductless Pro'},
    @{Find = 'Staten Island Ductless Mini Splits'; Replace = 'Georgetown KY Ductless Mini Splits'},
    @{Find = '123 Victory Blvd'; Replace = '123 Main Street'},
    @{Find = ', NY '; Replace = ', KY '},
    @{Find = 'NY '; Replace = 'KY '},
    @{Find = ', NY"'; Replace = ', KY"'},
    @{Find = 'addressRegion": "NY"'; Replace = 'addressRegion": "KY"'},
    @{Find = '"10301"'; Replace = '"40324"'},
    @{Find = '"10302"'; Replace = '"40324"'},
    @{Find = '"10303"'; Replace = '"40324"'},
    @{Find = '"10304"'; Replace = '"40324"'},
    @{Find = '"10305"'; Replace = '"40324"'},
    @{Find = '"10306"'; Replace = '"40324"'},
    @{Find = '"10307"'; Replace = '"40328"'},
    @{Find = '"10308"'; Replace = '"40324"'},
    @{Find = '"10309"'; Replace = '"40328"'},
    @{Find = '"10310"'; Replace = '"40324"'},
    @{Find = '"10311"'; Replace = '"40324"'},
    @{Find = '"10312"'; Replace = '"40328"'},
    @{Find = '"10313"'; Replace = '"40324"'},
    @{Find = '"10314"'; Replace = '"40324"'},
    @{Find = 'latitude": 40.6282'; Replace = 'latitude": 38.2098'},
    @{Find = 'longitude": -74.0776'; Replace = 'longitude": -84.5588'},
    @{Find = 'statenislandductless.com'; Replace = 'georgetownkyductless.com'},
    @{Find = 'info@statenislandductless.com'; Replace = 'info@georgetownkyductless.com'}
)

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $Path -Include "*.html" -Recurse

Write-Host "Processing $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    try {
        Write-Host "Processing: $($file.Name)"
        
        # Read file content as single string
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        # Apply each replacement
        foreach ($replacement in $criticalReplacements) {
            $content = $content.Replace($replacement.Find, $replacement.Replace)
        }
        
        # Write content back
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        
    } catch {
        Write-Error "Error processing $($file.Name): $_"
    }
}

Write-Host "Batch update completed!"
