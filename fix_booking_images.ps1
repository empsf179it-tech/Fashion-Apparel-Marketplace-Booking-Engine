$content = Get-Content 'booking.html' -Raw
$content = $content -replace 'height: 400px;', 'height: 600px; object-position: center top;'
Set-Content -Path 'booking.html' -Value $content
