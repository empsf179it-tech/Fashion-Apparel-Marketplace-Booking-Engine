$content = Get-Content 'assets\css\style.css' -Raw
$content = $content -replace '(?s)@media \(max-width: 768px\) \{\s*\.lookbook-item \{ grid-column: span 12 !important; grid-row: span 1 !important; \}\s*\}', '@media (max-width: 576px) { .lookbook-item { grid-column: span 12 !important; grid-row: span 1 !important; } }'
Set-Content -Path 'assets\css\style.css' -Value $content
