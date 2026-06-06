const WedzzCart = (function () {
    const STORAGE_KEY = 'wedzz_cart';

    function getProducts() {
        return window.WEDZZ_PRODUCTS || [];
    }

    function findProduct(id) {
        return getProducts().find((p) => p.id === id);
    }

    function load() {
        try {
            return JSON.parse(localStorage.getItem(STORAGE_KEY)) || [];
        } catch {
            return [];
        }
    }

    function save(items) {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(items));
        document.dispatchEvent(new CustomEvent('cart:updated', { detail: items }));
    }

    function formatPrice(amount) {
        return '₱' + amount.toLocaleString('en-PH');
    }

    function getCount() {
        return load().reduce((sum, item) => sum + item.qty, 0);
    }

    function getSubtotal() {
        return load().reduce((sum, item) => {
            const product = findProduct(item.id);
            return sum + (product ? product.price * item.qty : 0);
        }, 0);
    }

    function add(productId, qty = 1) {
        const product = findProduct(productId);
        if (!product) return;

        const items = load();
        const existing = items.find((i) => i.id === productId);
        if (existing) {
            existing.qty = Math.min(existing.qty + qty, product.stock);
        } else {
            items.push({ id: productId, qty: Math.min(qty, product.stock) });
        }
        save(items);
        return product;
    }

    function updateQty(productId, qty) {
        const items = load();
        const item = items.find((i) => i.id === productId);
        if (!item) return;

        const product = findProduct(productId);
        if (qty <= 0) {
            remove(productId);
            return;
        }
        item.qty = Math.min(qty, product ? product.stock : qty);
        save(items);
    }

    function remove(productId) {
        save(load().filter((i) => i.id !== productId));
    }

    function clear() {
        save([]);
    }

    function getItemsWithDetails() {
        return load().map((item) => {
            const product = findProduct(item.id);
            return product ? { ...product, qty: item.qty } : null;
        }).filter(Boolean);
    }

    return {
        add,
        updateQty,
        remove,
        clear,
        load,
        getCount,
        getSubtotal,
        getItemsWithDetails,
        formatPrice,
        findProduct,
    };
})();
