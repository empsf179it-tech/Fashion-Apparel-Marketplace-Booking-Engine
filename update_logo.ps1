$files = Get-ChildItem -Filter *.html
$newLogo = '<img src="images/logo.png" alt="Vogue Connect Logo" style="width: 40px; height: 40px; object-fit: contain;">'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    $content = [regex]::Replace($content, '(?s)<svg viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">.*?</svg>', $newLogo)
    
    Set-Content -Path $file.FullName -Value $content
}
