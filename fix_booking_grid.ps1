$content = Get-Content 'assets\css\style.css' -Raw
$content = $content -replace '(?s)\.process-grid > div:nth-child\(3\) \{\s*grid-column: span 2;\s*\}', '.process-grid > div:nth-child(3) { grid-column: span 2; justify-self: center; width: calc(50% - 1rem); min-width: 250px; }'
Set-Content -Path 'assets\css\style.css' -Value $content

$html = Get-Content 'booking.html' -Raw
$html = $html -replace '<div class="grid-3" style="gap: 2rem; margin-bottom: 4rem;">', '<div class="grid-3 process-grid" style="gap: 2rem; margin-bottom: 4rem;">'
Set-Content -Path 'booking.html' -Value $html
