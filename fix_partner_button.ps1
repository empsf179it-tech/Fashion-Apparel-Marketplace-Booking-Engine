$css = @"

.partner-card-content {
  padding: 4rem;
}
@media (max-width: 768px) {
  .partner-card-content {
    padding: 2rem 1rem;
  }
  .btn.partner-btn {
    white-space: nowrap;
    padding: 1rem 1.5rem;
    width: 100%;
  }
}
"@

Add-Content -Path 'assets\css\style.css' -Value $css

$html = Get-Content 'fashion-designers.html' -Raw
$html = $html -replace '<div style="padding: 4rem;">', '<div class="partner-card-content">'
$html = $html -replace '<a href="#" data-modal="partnerModal" class="btn btn-primary">Apply as a Fashion Partner</a>', '<a href="#" data-modal="partnerModal" class="btn btn-primary partner-btn">Apply as a Fashion Partner</a>'
Set-Content -Path 'fashion-designers.html' -Value $html
