$files = Get-ChildItem -Filter *.html

$newNavbarSvg = @"
<svg viewBox="0 0 100 100" width="40" height="40" xmlns="http://www.w3.org/2000/svg" style="border-radius: 50%; box-shadow: 0 2px 8px rgba(0,0,0,0.1); background-color: #ffffff;">
        <circle cx="50" cy="50" r="50" fill="#ffffff" />
        <image href="images/logo.png" x="5" y="5" width="90" height="90" style="mix-blend-mode: multiply;" />
      </svg>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    $content = $content -replace '(?s)<svg viewBox="0 0 100 100" width="40" height="40" xmlns="http://www\.w3\.org/2000/svg" style="mix-blend-mode: multiply;">\s*<image href="images/logo\.png" x="0" y="0" width="100" height="100"\s*/>\s*</svg>', $newNavbarSvg
    
    Set-Content -Path $file.FullName -Value $content
}
