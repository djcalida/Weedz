const AdminUI = (function () {
    function openModal(id) {
        const el = document.getElementById(id);
        if (el) {
            el.classList.add('open');
            document.body.style.overflow = 'hidden';
        }
    }

    function closeModal(id) {
        const el = document.getElementById(id);
        if (el) {
            el.classList.remove('open');
            document.body.style.overflow = '';
        }
    }

    function toast(message, type = 'success') {
        let container = document.getElementById('adminToastContainer');
        if (!container) {
            container = document.createElement('div');
            container.id = 'adminToastContainer';
            Object.assign(container.style, {
                position: 'fixed', bottom: '1.5rem', right: '1.5rem',
                zIndex: '9999', display: 'flex', flexDirection: 'column', gap: '0.6rem',
            });
            document.body.appendChild(container);
        }

        const icons = { success: '✓', warning: '⚠️', error: '✕', info: 'ℹ️' };
        const colors = {
            success: 'var(--ad-green)', warning: 'var(--ad-yellow)',
            error: 'var(--ad-red)', info: 'var(--ad-blue)',
        };

        const t = document.createElement('div');
        t.style.cssText = `
            display:flex;align-items:center;gap:.65rem;
            background:#fff;color:var(--ad-text);
            padding:.85rem 1.1rem;border-radius:10px;
            box-shadow:0 8px 30px rgba(0,0,0,.12);
            font-size:.875rem;font-weight:500;
            border-left:4px solid ${colors[type] || colors.info};
            animation:slideIn .25s ease;
            min-width:260px;max-width:360px;
        `;

        if (!document.getElementById('adminToastStyle')) {
            const style = document.createElement('style');
            style.id = 'adminToastStyle';
            style.textContent = '@keyframes slideIn{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}';
            document.head.appendChild(style);
        }

        t.innerHTML = `<span style="font-size:1rem;">${icons[type] || '✓'}</span><span>${message}</span>`;
        container.appendChild(t);

        setTimeout(() => {
            t.style.opacity = '0';
            t.style.transform = 'translateY(8px)';
            t.style.transition = 'all .25s ease';
            setTimeout(() => t.remove(), 260);
        }, 3000);
    }

    return { openModal, closeModal, toast };
})();

document.addEventListener('DOMContentLoaded', function () {
    initSidebar();
    initModalCloseButtons();
    initModernSelects();
});

function initSidebar() {
    const sidebar  = document.getElementById('adminSidebar');
    const overlay  = document.getElementById('sidebarOverlay');
    const toggle   = document.getElementById('topbarToggle');
    if (!sidebar || !toggle) return;

    toggle.addEventListener('click', () => {
        sidebar.classList.toggle('open');
        overlay.classList.toggle('open');
        document.body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : '';
    });

    overlay?.addEventListener('click', () => {
        sidebar.classList.remove('open');
        overlay.classList.remove('open');
        document.body.style.overflow = '';
    });
}

function initModalCloseButtons() {
    document.addEventListener('click', function (e) {
        const btn = e.target.closest('[data-close-modal]');
        if (btn) {
            AdminUI.closeModal(btn.dataset.closeModal);
            return;
        }
        if (e.target.classList.contains('admin-modal-overlay')) {
            e.target.classList.remove('open');
            document.body.style.overflow = '';
        }
    });

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            document.querySelectorAll('.admin-modal-overlay.open').forEach(m => {
                m.classList.remove('open');
            });
            document.body.style.overflow = '';
        }
    });
}

function initModernSelects() {
    // Highlight active nav link based on path
    const path = window.location.pathname;
    document.querySelectorAll('.sidebar-link').forEach(link => {
        if (link.getAttribute('href') === path) {
            link.classList.add('active');
        }
    });
}
