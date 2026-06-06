document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('[data-modal-target]');
    const closeButtons = document.querySelectorAll('[data-close-modal]');

    buttons.forEach((button) => {
        button.addEventListener('click', function () {
            const targetId = button.getAttribute('data-modal-target');
            const modal = document.getElementById(targetId);
            if (modal) {
                modal.classList.add('active');
                modal.setAttribute('aria-hidden', 'false');
            }
        });
    });

    closeButtons.forEach((button) => {
        button.addEventListener('click', function () {
            const modal = button.closest('.modal-overlay');
            if (modal) {
                modal.classList.remove('active');
                modal.setAttribute('aria-hidden', 'true');
            }
        });
    });

    document.querySelectorAll('.modal-overlay').forEach((overlay) => {
        overlay.addEventListener('click', function (event) {
            if (event.target === overlay) {
                overlay.classList.remove('active');
                overlay.setAttribute('aria-hidden', 'true');
            }
        });
    });

    const slider = document.getElementById('homeSlider');
    const sliderTrack = document.querySelector('.slider-track');
    const cards = document.querySelectorAll('.slider-card');
    const dots = document.getElementById('sliderDots');
    let activeIndex = 0;
    let slideInterval;

    function setSlide(index) {
        activeIndex = index;
        const offset = index * -100;
        if (sliderTrack) {
            sliderTrack.style.transform = `translateX(${offset}%)`;
        }
        document.querySelectorAll('.slider-dot').forEach((dot, dotIndex) => {
            dot.classList.toggle('active', dotIndex === index);
        });
    }

    function createDots() {
        if (!dots) return;
        cards.forEach((_, index) => {
            const dot = document.createElement('button');
            dot.type = 'button';
            dot.className = 'slider-dot';
            dot.addEventListener('click', () => {
                setSlide(index);
                resetInterval();
            });
            dots.appendChild(dot);
        });
    }

    function nextSlide() {
        setSlide((activeIndex + 1) % cards.length);
    }

    function resetInterval() {
        clearInterval(slideInterval);
        slideInterval = setInterval(nextSlide, 6000);
    }

    if (slider && cards.length > 0 && dots) {
        createDots();
        setSlide(0);
        resetInterval();
    }
});
