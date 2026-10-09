$files = Get-ChildItem -Filter *.html

$navbarSvg = @"
<svg viewBox="0 0 100 100" width="40" height="40" xmlns="http://www.w3.org/2000/svg" style="mix-blend-mode: multiply;">
        <image href="images/logo.png" x="0" y="0" width="100" height="100" />
      </svg>
"@

$footerSvg = @"
<svg viewBox="0 0 100 100" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
              <circle cx="50" cy="50" r="50" fill="#fdfbf7" />
              <image href="images/logo.png" x="5" y="5" width="90" height="90" style="mix-blend-mode: multiply;" />
            </svg>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # We replace the specific SVGs using regex based on their unique inner paths
    $content = $content -replace '(?s)<svg viewBox="0 0 100 100" fill="none" xmlns="http://www\.w3\.org/2000/svg">\s*<path d="M50 0L93\.3013 25V75L50 100L6\.69873 75V25L50 0Z" fill="#171717"/>.*?</svg>', $navbarSvg
    
    $content = $content -replace '(?s)<svg viewBox="0 0 100 100" fill="none" xmlns="http://www\.w3\.org/2000/svg">\s*<path d="M50 0L93\.3013 25V75L50 100L6\.69873 75V25L50 0Z" fill="#C5A572"/>.*?</svg>', $footerSvg
    
    Set-Content -Path $file.FullName -Value $content
}
