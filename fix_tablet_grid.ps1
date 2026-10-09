$content = Get-Content 'assets\css\style.css' -Raw
$content = $content -replace '(?s)@media \(max-width: 768px\) \{\s*\.grid-2, \.grid-3, \.grid-4 \{ grid-template-columns: 1fr; \}\s*\}', '@media (max-width: 576px) { .grid-2, .grid-3, .grid-4 { grid-template-columns: 1fr; } }'
Set-Content -Path 'assets\css\style.css' -Value $content
