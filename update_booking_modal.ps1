$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # 1. Update CTA Button Text and data-modal attribute
    $content = $content -replace 'data-modal="exploreServicesModal" class="btn btn-primary" style="padding: 0.5rem 1rem;">Search</a>', 'data-modal="quickBookModal" class="btn btn-primary" style="padding: 0.5rem 1rem;">Book Now</a>'
    
    # 2. Update Modal Content
    $startToken = '<!-- Explore Services Modal -->'
    $endIndex = $content.IndexOf('</body>')
    
    if ($content.Contains($startToken) -and $endIndex -gt 0) {
        $startIndex = $content.IndexOf($startToken)
        $beforeModal = $content.Substring(0, $startIndex)
        $afterModal = $content.Substring($endIndex)
        
        $newModal = @"
  <!-- Quick Booking Modal -->
  <div class="modal-overlay" id="quickBookModal">
    <div class="modal-content text-center">
      <button class="modal-close">&times;</button>
      <h3 class="heading-sm" style="margin-bottom: 0.5rem;">Book an Appointment</h3>
      <p class="text-sm" style="margin-bottom: 2rem;">Schedule your personalized fashion experience.</p>
      
      <form style="text-align: left;">
        <div class="form-group">
          <label class="form-label">Service Type</label>
          <select class="form-control" required>
            <option value="">Select a service</option>
            <option value="styling">Personal Styling</option>
            <option value="tailoring">Custom Tailoring</option>
            <option value="photography">Fashion Photography</option>
            <option value="consultation">Designer Consultation</option>
          </select>
        </div>
        <div class="grid-2" style="gap: 1rem;">
          <div class="form-group">
            <label class="form-label">Preferred Date</label>
            <input type="date" class="form-control" required>
          </div>
          <div class="form-group">
            <label class="form-label">Preferred Time</label>
            <select class="form-control" required>
              <option value="">Select a time</option>
              <option value="morning">Morning (9AM - 12PM)</option>
              <option value="afternoon">Afternoon (1PM - 4PM)</option>
              <option value="evening">Evening (5PM - 8PM)</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Your Name</label>
          <input type="text" class="form-control" placeholder="Jane Doe" required>
        </div>
        <div class="form-group" style="margin-bottom: 2rem;">
          <label class="form-label">Email Address</label>
          <input type="email" class="form-control" placeholder="jane@example.com" required>
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100%;">Confirm Booking</button>
        <div class="form-feedback"></div>
      </form>
    </div>
  </div>

"@
        $content = $beforeModal + $newModal + $afterModal
        Set-Content -Path $file.FullName -Value $content
    }
}
