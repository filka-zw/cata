const targetDate = new Date("April 5, 2026 00:00:00").getTime();
let countdownText = "";

// Update the countdown logic every second
const updateTimer = () => {
    const now = new Date().getTime();
    const distance = targetDate - now;

    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    countdownText = `${days}D ${hours}H ${minutes}M ${seconds}S`;

    // Drop handling
    if (distance < 0) {
        document.querySelectorAll('.hover-countdown').forEach(el => el.classList.add('hidden'));
        document.getElementById('shop-link').classList.remove('hidden');
    }
};

setInterval(updateTimer, 1000);

// Hover Logic
const hoverElements = document.querySelectorAll('.hover-countdown');

hoverElements.forEach(el => {
    const originalText = el.innerText;

    el.addEventListener('mouseenter', () => {
        el.innerText = countdownText;
        el.style.fontWeight = "700";
    });

    el.addEventListener('mouseleave', () => {
        el.innerText = originalText;
        el.style.fontWeight = "400";
    });
});

// Email handling
document.getElementById('email-form').addEventListener('submit', function(e) {
    e.preventDefault();
    document.getElementById('form-msg').innerText = "YOU WILL BE NOTIFIED OF THE RISING.";
    this.reset();
});