document.addEventListener('DOMContentLoaded', () => {
  // 1. Navbar Scroll & Mobile Menu
  const navbar = document.querySelector('.navbar');
  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-links');

  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  if (hamburger) {
    hamburger.addEventListener('click', () => {
      hamburger.classList.toggle('active');
      navLinks.classList.toggle('active');
    });
  }

  // Close mobile menu on link click
  document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', () => {
      hamburger.classList.remove('active');
      navLinks.classList.remove('active');
    });
  });

  // 2. Scroll Animations
  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.02
  };

  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  document.querySelectorAll('.fade-in').forEach(element => {
    observer.observe(element);
  });

  // 3. Modals
  const modalTriggers = document.querySelectorAll('[data-modal]');
  const modals = document.querySelectorAll('.modal-overlay');
  const modalCloses = document.querySelectorAll('.modal-close');

  function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }
  }

  function closeModal() {
    modals.forEach(m => m.classList.remove('active'));
    document.body.style.overflow = '';
  }

  modalTriggers.forEach(trigger => {
    trigger.addEventListener('click', (e) => {
      e.preventDefault();
      const modalId = trigger.getAttribute('data-modal');
      openModal(modalId);
    });
  });

  modalCloses.forEach(closeBtn => {
    closeBtn.addEventListener('click', closeModal);
  });

  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal-overlay')) {
      closeModal();
    }
  });

  window.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      closeModal();
    }
  });

  // 4. Form Validation Simulation
  const forms = document.querySelectorAll('form');
  forms.forEach(form => {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      
      // Basic client-side validation check
      let isValid = true;
      form.querySelectorAll('[required]').forEach(input => {
        if (!input.value.trim()) isValid = false;
      });

      const feedback = form.querySelector('.form-feedback');
      if (feedback) {
        if (isValid) {
          feedback.textContent = 'Request submitted successfully. This is a demonstration environment.';
          feedback.className = 'form-feedback success';
          form.reset();
        } else {
          feedback.textContent = 'Please fill out all required fields.';
          feedback.className = 'form-feedback error';
        }
      }
    });
  });

  // 5. Booking Calendar Logic (if on booking page)
  const dateInput = document.getElementById('booking-date');
  const timeSelect = document.getElementById('booking-time');
  if (dateInput && timeSelect) {
    const today = new Date().toISOString().split('T')[0];
    dateInput.setAttribute('min', today);

    dateInput.addEventListener('change', () => {
      // Simulate fetching available time slots
      timeSelect.innerHTML = '<option value="">Select a time</option>';
      const times = ['09:00 AM', '11:00 AM', '02:00 PM', '04:00 PM'];
      times.forEach(t => {
        const opt = document.createElement('option');
        opt.value = t;
        opt.textContent = t;
        timeSelect.appendChild(opt);
      });
      timeSelect.disabled = false;
    });
  }

  // 6. Pricing Calculator (if on booking/pricing page)
  const serviceSelect = document.getElementById('calc-service');
  const addonSelect = document.getElementById('calc-addon');
  const calcTotal = document.getElementById('calc-total');
  const calcDeposit = document.getElementById('calc-deposit');

  function updateCalculator() {
    if (!serviceSelect || !calcTotal) return;
    
    let basePrice = parseInt(serviceSelect.options[serviceSelect.selectedIndex]?.dataset.price || 0);
    let addonPrice = addonSelect ? parseInt(addonSelect.options[addonSelect.selectedIndex]?.dataset.price || 0) : 0;
    
    let total = basePrice + addonPrice;
    let deposit = total * 0.3; // 30% deposit

    if (total > 0) {
      calcTotal.textContent = '$' + total;
      calcDeposit.textContent = '$' + deposit.toFixed(2);
    } else {
      calcTotal.textContent = '$0';
      calcDeposit.textContent = '$0';
    }
  }

  if (serviceSelect) {
    serviceSelect.addEventListener('change', updateCalculator);
    if (addonSelect) addonSelect.addEventListener('change', updateCalculator);
  }

  // 7. FAQ Accordion (if on contact page)
  const faqItems = document.querySelectorAll('.faq-item');
  faqItems.forEach(item => {
    const question = item.querySelector('.faq-question');
    question.addEventListener('click', () => {
      const isActive = item.classList.contains('active');
      faqItems.forEach(i => i.classList.remove('active'));
      if (!isActive) item.classList.add('active');
    });
  });
});
