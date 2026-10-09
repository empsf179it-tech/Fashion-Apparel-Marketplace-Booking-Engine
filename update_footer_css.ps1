$css = @"

@media (max-width: 768px) {
  .footer-grid {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 3rem;
  }
  .footer-col {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .footer-col ul {
    align-items: center;
  }
  .social-links {
    justify-content: center;
  }
}
"@

Add-Content -Path "assets\css\style.css" -Value $css
