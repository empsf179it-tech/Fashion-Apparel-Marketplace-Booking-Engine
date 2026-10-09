$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace CTA button in navbar
    $content = $content -replace '<a href="services.html" class="btn btn-primary" style="padding: 0.5rem 1rem;">Explore Services</a>', '<a href="#" data-modal="exploreServicesModal" class="btn btn-primary" style="padding: 0.5rem 1rem;">Explore Services</a>'
    
    # Check if exploreServicesModal already exists
    if ($content -notmatch 'id="exploreServicesModal"') {
        # Insert exploreServicesModal right before </body>
        $modalHtml = @"
  <!-- Explore Services Modal -->
  <div class="modal-overlay" id="exploreServicesModal">
    <div class="modal-content text-center">
      <button class="modal-close">&times;</button>
      <h3 class="heading-sm" style="margin-bottom: 0.5rem;">Explore Our Services</h3>
      <p class="text-sm" style="margin-bottom: 2rem;">Select a category to discover tailored fashion experiences.</p>
      <div class="grid-2" style="gap: 1rem; text-align: left;">
        <a href="services.html" class="service-card" style="padding: 1.5rem; border: 1px solid var(--muted-taupe); box-shadow: none;">
          <h4 class="heading-sm" style="font-size: 1.25rem; margin-bottom: 0.5rem;">Personal Styling</h4>
          <p class="text-sm" style="color: var(--muted-taupe); margin-bottom: 0;">Wardrobe curation & event styling.</p>
        </a>
        <a href="services.html" class="service-card" style="padding: 1.5rem; border: 1px solid var(--muted-taupe); box-shadow: none;">
          <h4 class="heading-sm" style="font-size: 1.25rem; margin-bottom: 0.5rem;">Photography</h4>
          <p class="text-sm" style="color: var(--muted-taupe); margin-bottom: 0;">Editorial and personal photoshoots.</p>
        </a>
        <a href="fashion-designers.html" class="service-card" style="padding: 1.5rem; border: 1px solid var(--muted-taupe); box-shadow: none;">
          <h4 class="heading-sm" style="font-size: 1.25rem; margin-bottom: 0.5rem;">Designers</h4>
          <p class="text-sm" style="color: var(--muted-taupe); margin-bottom: 0;">Bespoke outfits & consultations.</p>
        </a>
        <a href="booking.html" class="service-card" style="padding: 1.5rem; border: 1px solid var(--muted-taupe); box-shadow: none;">
          <h4 class="heading-sm" style="font-size: 1.25rem; margin-bottom: 0.5rem;">Custom Tailoring</h4>
          <p class="text-sm" style="color: var(--muted-taupe); margin-bottom: 0;">Perfect fit for your garments.</p>
        </a>
      </div>
      <a href="services.html" class="btn btn-primary" style="margin-top: 2rem; width: 100%;">View All Services</a>
    </div>
  </div>

</body>
"@
        $content = $content -replace '</body>', $modalHtml
    }
    
    Set-Content -Path $file.FullName -Value $content
}
