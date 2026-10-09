$css = @"

@media (min-width: 577px) and (max-width: 1024px) {
  .process-grid > div:nth-child(3) {
    grid-column: span 2;
  }
}
"@

Add-Content -Path 'assets\css\style.css' -Value $css
