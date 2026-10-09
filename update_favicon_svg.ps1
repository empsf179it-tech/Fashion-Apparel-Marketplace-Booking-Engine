$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    $content = $content -replace '<link rel="icon" type="image/png" href="images/logo\.png">', '<link rel="icon" type="image/svg+xml" href="images/favicon.svg">'
    
    Set-Content -Path $file.FullName -Value $content
}
