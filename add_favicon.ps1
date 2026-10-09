$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    if ($content -notmatch '<link rel="icon"') {
        $content = $content -replace '</head>', "  <link rel=`"icon`" type=`"image/png`" href=`"images/logo.png`">`n</head>"
        Set-Content -Path $file.FullName -Value $content
    }
}
