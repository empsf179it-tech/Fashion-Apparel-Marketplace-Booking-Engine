$content = Get-Content 'index.html' -Raw
$content = $content -replace '(?s)<div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 4rem;\s*flex-wrap: wrap; gap: 2rem;">', '<div class="section-header-flex" style="margin-bottom: 4rem;">'
Set-Content -Path 'index.html' -Value $content

$content2 = Get-Content 'fashion-designers.html' -Raw
$content2 = $content2 -replace '(?s)<div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 4rem;\s*flex-wrap: wrap; gap: 2rem;">', '<div class="section-header-flex" style="margin-bottom: 4rem;">'
Set-Content -Path 'fashion-designers.html' -Value $content2
