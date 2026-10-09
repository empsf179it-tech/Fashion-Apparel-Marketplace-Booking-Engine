$files = Get-ChildItem -Filter *.html
$imgTag = '<img src="images/logo.png" alt="Vogue Connect Logo" style="width: 40px; height: 40px; object-fit: contain;">'

$navbarSvg = @"
<svg viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M50 0L93.3013 25V75L50 100L6.69873 75V25L50 0Z" fill="#171717"/>
        <path d="M50 15L78.141 31.25V68.75L50 85L21.859 68.75V31.25L50 15Z" stroke="#C5A572" stroke-width="2"/>
        <path d="M50 30L65.1507 38.75V56.25L50 65L34.8493 56.25V38.75L50 30Z" fill="#C5A572"/>
      </svg>
"@

$footerSvg = @"
<svg viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M50 0L93.3013 25V75L50 100L6.69873 75V25L50 0Z" fill="#C5A572"/>
              <path d="M50 15L78.141 31.25V68.75L50 85L21.859 68.75V31.25L50 15Z" stroke="#171717" stroke-width="2"/>
            </svg>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # 1. Replace the navbar image (which is immediately preceded by <div class="nav-brand">)
    # 2. Replace the footer image (which is preceded by <div class="nav-brand" style="...">)
    
    # We can do this safely by splitting the string or using Regex
    $content = $content -replace '(?s)(<div class="nav-brand">\s*)<img src="images/logo\.png".*?>', ("`$1" + $navbarSvg)
    $content = $content -replace '(?s)(<div class="nav-brand" style="[^"]*">\s*)<img src="images/logo\.png".*?>', ("`$1" + $footerSvg)
    
    Set-Content -Path $file.FullName -Value $content
}
