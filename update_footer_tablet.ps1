$css = @"

@media (min-width: 769px) and (max-width: 1024px) {
  .footer-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
"@

Add-Content -Path "assets\css\style.css" -Value $css
