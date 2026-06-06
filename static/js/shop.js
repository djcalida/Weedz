document.addEventListener('DOMContentLoaded', function () {
    const grid = document.getElementById('shopGrid');
    const sortSelect = document.getElementById('shopSort');
    const resultsEl = document.getElementById('shopResults');
    if (!grid) return;

    const cards = Array.from(grid.querySelectorAll('.product-card'));

    sortSelect?.addEventListener('change', () => sortProducts(sortSelect.value));

    document.querySelectorAll('[data-price-filter]').forEach((checkbox) => {
        checkbox.addEventListener('change', filterByPrice);
    });

    function getProductData(card) {
        const id = card.dataset.productId;
        return window.WEDZZ_PRODUCTS.find((p) => p.id === id);
    }

    function sortProducts(sortBy) {
        const sorted = cards.slice().sort((a, b) => {
            const pa = getProductData(a);
            const pb = getProductData(b);
            if (!pa || !pb) return 0;

            switch (sortBy) {
                case 'price-asc': return pa.price - pb.price;
                case 'price-desc': return pb.price - pa.price;
                case 'rating': return pb.rating - pa.rating;
                case 'name': return pa.name.localeCompare(pb.name);
                default: return (pb.featured ? 1 : 0) - (pa.featured ? 1 : 0);
            }
        });

        sorted.forEach((card) => grid.appendChild(card));
    }

    function filterByPrice() {
        const active = Array.from(document.querySelectorAll('[data-price-filter]:checked'))
            .map((cb) => cb.dataset.priceFilter);

        let visible = 0;
        cards.forEach((card) => {
            const product = getProductData(card);
            if (!product) return;

            let show = active.length === 0;
            if (!show) {
                show = active.some((range) => {
                    if (range === '0-2500') return product.price < 2500;
                    if (range === '2500-5000') return product.price >= 2500 && product.price < 5000;
                    if (range === '5000-10000') return product.price >= 5000 && product.price < 10000;
                    if (range === '10000+') return product.price >= 10000;
                    return false;
                });
            }

            card.style.display = show ? '' : 'none';
            if (show) visible++;
        });

        if (resultsEl) resultsEl.textContent = `${visible} products found`;
    }
});
