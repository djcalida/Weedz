document.addEventListener('DOMContentLoaded', function () {
    renderCartPage();
    document.addEventListener('cart:updated', renderCartPage);

    document.getElementById('applyPromo')?.addEventListener('click', applyPromo);
});

function renderCartPage() {
    const items = WedzzCart.getItemsWithDetails();
    const emptyPage = document.getElementById('cartEmptyPage');
    const layout = document.getElementById('cartLayout');
    const rows = document.getElementById('cartRows');

    if (!emptyPage || !layout) return;

    if (items.length === 0) {
        emptyPage.hidden = false;
        layout.hidden = true;
        return;
    }

    emptyPage.hidden = true;
    layout.hidden = false;

    rows.innerHTML = items.map((item) => `
        <div class="cart-row" data-id="${item.id}">
            <div class="cart-product">
                <div class="cart-product-img img-placeholder img-${item.image}"></div>
                <div class="cart-product-info">
                    <h4>${item.name}</h4>
                    <span>${item.brand}</span>
                </div>
            </div>
            <span>${WedzzCart.formatPrice(item.price)}</span>
            <div class="qty-selector">
                <button class="qty-btn" data-qty-change="-1" data-id="${item.id}">−</button>
                <input type="number" value="${item.qty}" min="1" max="${item.stock}" data-qty-input="${item.id}" readonly>
                <button class="qty-btn" data-qty-change="1" data-id="${item.id}">+</button>
            </div>
            <strong>${WedzzCart.formatPrice(item.price * item.qty)}</strong>
            <button class="cart-remove" data-remove="${item.id}" aria-label="Remove">✕</button>
        </div>
    `).join('');

    rows.querySelectorAll('[data-qty-change]').forEach((btn) => {
        btn.addEventListener('click', () => {
            const id = btn.dataset.id;
            const change = parseInt(btn.dataset.qtyChange, 10);
            const cartItem = WedzzCart.load().find((i) => i.id === id);
            if (cartItem) WedzzCart.updateQty(id, cartItem.qty + change);
        });
    });

    rows.querySelectorAll('[data-remove]').forEach((btn) => {
        btn.addEventListener('click', () => WedzzCart.remove(btn.dataset.remove));
    });

    updateSummary();
}

let discount = 0;

function updateSummary() {
    const subtotal = WedzzCart.getSubtotal();
    const total = Math.max(0, subtotal - discount);

    document.getElementById('summarySubtotal').textContent = WedzzCart.formatPrice(subtotal);
    document.getElementById('summaryTotal').textContent = WedzzCart.formatPrice(total);

    const discountRow = document.getElementById('discountRow');
    if (discount > 0) {
        discountRow.hidden = false;
        document.getElementById('summaryDiscount').textContent = '-' + WedzzCart.formatPrice(discount);
    } else {
        discountRow.hidden = true;
    }
}

function applyPromo() {
    const code = document.getElementById('promoCode')?.value.trim().toUpperCase();
    if (code === 'WEDZZ15') {
        discount = Math.round(WedzzCart.getSubtotal() * 0.15);
        updateSummary();
        showToast('Promo code applied — 15% off!');
    } else {
        discount = 0;
        updateSummary();
        showToast('Invalid promo code', 'error');
    }
}
