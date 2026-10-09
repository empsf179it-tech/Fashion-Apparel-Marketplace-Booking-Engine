$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # 1. Update CTA Button Text
    $content = $content -replace 'data-modal="exploreServicesModal" class="btn btn-primary" style="padding: 0.5rem 1rem;">Explore Services</a>', 'data-modal="exploreServicesModal" class="btn btn-primary" style="padding: 0.5rem 1rem;">Search</a>'
    
    # 2. Update Modal Content
    $startToken = '<!-- Explore Services Modal -->'
    $endIndex = $content.IndexOf('</body>')
    
    if ($content.Contains($startToken) -and $endIndex -gt 0) {
        $startIndex = $content.IndexOf($startToken)
        $beforeModal = $content.Substring(0, $startIndex)
        $afterModal = $content.Substring($endIndex)
        
        $newModal = @"
  <!-- Explore Services Modal -->
  <div class="modal-overlay" id="exploreServicesModal">
    <div class="modal-content text-center">
      <button class="modal-close">&times;</button>
      <h3 class="heading-sm" style="margin-bottom: 0.5rem;">Search Services</h3>
      <p class="text-sm" style="margin-bottom: 2rem;">Find the perfect fashion professional for your needs.</p>
      
      <form style="text-align: left;">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search for stylists, tailors, photographers..." required style="margin-bottom: 1rem;">
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100%;">Search Now</button>
        <div class="form-feedback"></div>
      </form>
    </div>
  </div>

"@
        $content = $beforeModal + $newModal + $afterModal
        Set-Content -Path $file.FullName -Value $content
    }
}
