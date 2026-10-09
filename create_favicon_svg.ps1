$bytes = [System.IO.File]::ReadAllBytes('d:\Company websites\October company websites\Fashion Apparel Marketplace & Booking Engine\images\logo.png')
$b64 = [System.Convert]::ToBase64String($bytes)
$svg = @"
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="50" fill="#ffffff" />
  <image href="data:image/png;base64,$b64" x="5" y="5" width="90" height="90" style="mix-blend-mode: multiply;" />
</svg>
"@
Set-Content -Path 'd:\Company websites\October company websites\Fashion Apparel Marketplace & Booking Engine\images\favicon.svg' -Value $svg
