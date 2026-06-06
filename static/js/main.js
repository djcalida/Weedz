document.addEventListener('DOMContentLoaded', function () {
    initHeader();
    initMobileNav();
    initCartDrawer();
    initAddToCartButtons();
    updateCartUI();
    document.addEventListener('cart:updated', updateCartUI);
});

function initHeader() {
    const header = document.getElementById('siteHeader');
    if (!header) return;
    window.addEventListener('scroll', () => {
        header.classList.toggle('scrolled', window.scrollY > 20);
    });
}

function initMobileNav() {
    const nav = document.getElementById('mobileNav');
    const overlay = document.getElementById('mobileNavOverlay');
    const openBtn = document.getElementById('mobileMenuBtn');
    const closeBtn = document.getElementById('mobileNavClose');
    if (!nav || !overlay) return;

    function open() {
        nav.classList.add('open');
        overlay.classList.add('open');
        document.body.style.overflow = 'hidden';
    }

    function close() {
        nav.classList.remove('open');
        overlay.classList.remove('open');
        document.body.style.overflow = '';
    }

    openBtn?.addEventListener('click', open);
    closeBtn?.addEventListener('click', close);
    overlay.addEventListener('click', close);
}

function initCartDrawer() {
    const drawer = document.getElementById('cartDrawer');
    const overlay = document.getElementById('cartOverlay');
    const trigger = document.getElementById('cartTrigger');
    const closeBtn = document.getElementById('cartClose');
    if (!drawer || !overlay) return;

    function open() {
        drawer.classList.add('open');
        overlay.classList.add('open');
        drawer.setAttribute('aria-hidden', 'false');
        document.body.style.overflow = 'hidden';
        renderDrawerItems();
    }

    function close() {
        drawer.classList.remove('open');
        overlay.classList.remove('open');
        drawer.setAttribute('aria-hidden', 'true');
        document.body.style.overflow = '';
    }

    trigger?.addEventListener('click', open);
    closeBtn?.addEventListener('click', close);
    overlay.addEventListener('click', close);
}

function initAddToCartButtons() {
    document.addEventListener('click', function (e) {
        const btn = e.target.closest('[data-add-to-cart]');
        if (!btn || btn.id === 'addToCartBtn') return;
        e.preventDefault();
        const product = WedzzCart.add(btn.dataset.addToCart, 1);
        if (product) {
            showToast(`${product.name} added to cart`);
            const drawer = document.getElementById('cartDrawer');
            if (drawer && !drawer.classList.contains('open')) {
                document.getElementById('cartDrawer')?.classList.add('open');
                document.getElementById('cartOverlay')?.classList.add('open');
                document.body.style.overflow = 'hidden';
                renderDrawerItems();
            }
        }
    });
}

function updateCartUI() {
    const count = WedzzCart.getCount();
    const badge = document.getElementById('cartBadge');
    const countLabel = document.getElementById('cartCountLabel');
    const footer = document.getElementById('cartFooter');
    const empty = document.getElementById('cartEmpty');
    const subtotalEl = document.getElementById('cartSubtotal');

    if (badge) badge.textContent = count;
    if (countLabel) countLabel.textContent = `(${count} item${count !== 1 ? 's' : ''})`;
    if (footer) footer.hidden = count === 0;
    if (empty) empty.style.display = count === 0 ? 'flex' : 'none';
    if (subtotalEl) subtotalEl.textContent = WedzzCart.formatPrice(WedzzCart.getSubtotal());

    renderDrawerItems();
}

function renderDrawerItems() {
    const container = document.getElementById('cartItems');
    if (!container) return;

    const items = WedzzCart.getItemsWithDetails();
    container.innerHTML = items.map((item) => `
        <div class="drawer-cart-item" data-id="${item.id}">
            <div class="drawer-cart-item-img img-placeholder img-${item.image}"></div>
            <div class="drawer-cart-item-info">
                <h4>${item.name}</h4>
                <div class="item-price">${WedzzCart.formatPrice(item.price)}</div>
                <div class="drawer-qty-row">
                    <button type="button" data-qty-change="-1" data-id="${item.id}">−</button>
                    <span>${item.qty}</span>
                    <button type="button" data-qty-change="1" data-id="${item.id}">+</button>
                    <button type="button" data-remove="${item.id}" style="margin-left:auto;color:var(--color-danger);border:none;">✕</button>
                </div>
            </div>
        </div>
    `).join('');

    container.querySelectorAll('[data-qty-change]').forEach((btn) => {
        btn.addEventListener('click', () => {
            const id = btn.dataset.id;
            const change = parseInt(btn.dataset.qtyChange, 10);
            const item = WedzzCart.load().find((i) => i.id === id);
            if (item) WedzzCart.updateQty(id, item.qty + change);
        });
    });

    container.querySelectorAll('[data-remove]').forEach((btn) => {
        btn.addEventListener('click', () => WedzzCart.remove(btn.dataset.remove));
    });
}

function showToast(message, type = 'success') {
    const container = document.getElementById('toastContainer');
    if (!container) return;

    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerHTML = `<span>✓</span> ${message}`;
    container.appendChild(toast);

    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(12px)';
        toast.style.transition = 'all 0.3s ease';
        setTimeout(() => toast.remove(), 300);
    }, 3000);
}

window.showToast = showToast;
