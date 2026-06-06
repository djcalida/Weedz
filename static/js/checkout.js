document.addEventListener('DOMContentLoaded', function () {
    renderCheckout();
    document.addEventListener('cart:updated', renderCheckout);

    document.getElementById('placeOrderBtn')?.addEventListener('click', placeOrder);
});

const SHIPPING_FEE = 150;
const FREE_SHIPPING_THRESHOLD = 3000;

function renderCheckout() {
    const items = WedzzCart.getItemsWithDetails();
    const container = document.getElementById('checkoutItems');
    const content = document.getElementById('checkoutContent');

    if (items.length === 0) {
        content.innerHTML = `
            <div class="cart-empty-page">
                <h2>Your cart is empty</h2>
                <p>Add items before checking out.</p>
                <a href="/shop" class="btn btn-primary">Browse Parts</a>
            </div>
        `;
        return;
    }

    container.innerHTML = items.map((item) => `
        <div class="checkout-item">
            <div class="checkout-item-img img-placeholder img-${item.image}"></div>
            <div class="checkout-item-info">
                <h4>${item.name}</h4>
                <span>Qty: ${item.qty} × ${WedzzCart.formatPrice(item.price)}</span>
            </div>
            <strong>${WedzzCart.formatPrice(item.price * item.qty)}</strong>
        </div>
    `).join('');

    const subtotal = WedzzCart.getSubtotal();
    const shipping = subtotal >= FREE_SHIPPING_THRESHOLD ? 0 : SHIPPING_FEE;
    const total = subtotal + shipping;

    document.getElementById('checkoutSubtotal').textContent = WedzzCart.formatPrice(subtotal);
    document.getElementById('checkoutShipping').textContent = shipping === 0 ? 'FREE' : WedzzCart.formatPrice(shipping);
    document.getElementById('checkoutTotal').textContent = WedzzCart.formatPrice(total);
}

function placeOrder() {
    const form = document.getElementById('checkoutForm');
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }

    const orderNum = 'WZ' + Date.now().toString().slice(-8);
    WedzzCart.clear();

    document.getElementById('checkoutContent').hidden = true;
    document.getElementById('orderSuccess').hidden = false;
    document.getElementById('orderNumber').textContent = orderNum;

    document.querySelectorAll('.checkout-step').forEach((step, i) => {
        step.classList.toggle('active', i === 2);
    });
}
