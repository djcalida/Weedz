from flask import Flask, jsonify, render_template, request

from data.admin_data import (
    AUDIT_LOGS,
    CUSTOMERS,
    DASHBOARD_STATS,
    EMPLOYEES,
    ORDERS,
    PROMOS,
    REFUNDS,
    SALES_MONTHLY,
)
from data.products import CATEGORIES, PRODUCTS, get_by_category, get_featured, get_product

app = Flask(__name__)


# ── Jinja2 extras ──────────────────────────────────────────────────────────────
@app.template_filter("enumerate")
def jinja_enumerate(iterable):
    return enumerate(iterable)


# ── Global context ──────────────────────────────────────────────────────────────
@app.context_processor
def inject_globals():
    pending_count   = sum(1 for o in ORDERS if o["status"] == "Processing")
    low_stock_count = sum(1 for p in PRODUCTS if p["stock"] < 15)
    refund_count    = sum(1 for r in REFUNDS if r["status"] == "Pending")
    return {
        "categories":      CATEGORIES,
        "all_products":    PRODUCTS,
        "pending_count":   pending_count,
        "low_stock_count": low_stock_count,
        "refund_count":    refund_count,
    }


# ══════════════════════════════════════════════════════════════════════════════
# Customer routes
# ══════════════════════════════════════════════════════════════════════════════

@app.route("/")
def home():
    return render_template("customer/index.html", featured=get_featured())


@app.route("/shop")
def shop():
    category = request.args.get("category")
    query    = request.args.get("q", "").strip().lower()
    products = get_by_category(category) if category else list(PRODUCTS)

    if query:
        products = [
            p for p in products
            if query in p["name"].lower()
            or query in p["brand"].lower()
            or query in p["category"].lower()
        ]

    category_name = next((c["name"] for c in CATEGORIES if c["id"] == category), None)
    return render_template(
        "customer/shop.html",
        products=products,
        active_category=category,
        active_category_name=category_name,
        search_query=request.args.get("q", ""),
    )


@app.route("/product/<product_id>")
def product_detail(product_id):
    product = get_product(product_id)
    if not product:
        return render_template("customer/404.html"), 404
    related = [p for p in PRODUCTS if p["category"] == product["category"] and p["id"] != product_id][:4]
    return render_template("customer/product.html", product=product, related=related)


@app.route("/cart")
def cart():
    return render_template("customer/cart.html")


@app.route("/checkout")
def checkout():
    return render_template("customer/checkout.html")


@app.route("/login")
def login():
    return render_template("customer/login.html")


@app.route("/registration")
@app.route("/register")
def register():
    return render_template("customer/registration.html")


@app.route("/api/products")
def api_products():
    return jsonify(PRODUCTS)


# ══════════════════════════════════════════════════════════════════════════════
# Admin routes
# ══════════════════════════════════════════════════════════════════════════════

@app.route("/admin/login")
def admin_login():
    return render_template("admin/login.html")


@app.route("/admin")
def admin_dashboard():
    return render_template(
        "admin/dashboard.html",
        active_page="dashboard",
        stats=DASHBOARD_STATS,
        recent_orders=ORDERS[:8],
        top_products=sorted(PRODUCTS, key=lambda p: p["reviews"], reverse=True)[:6],
        sales_monthly=SALES_MONTHLY,
    )


@app.route("/admin/orders")
def admin_orders():
    return render_template("admin/orders.html", active_page="orders", orders=ORDERS)


@app.route("/admin/products")
def admin_products():
    return render_template("admin/products.html", active_page="products", products=PRODUCTS)


@app.route("/admin/inventory")
def admin_inventory():
    return render_template("admin/inventory.html", active_page="inventory", products=PRODUCTS)


@app.route("/admin/customers")
def admin_customers():
    return render_template("admin/customers.html", active_page="customers", customers=CUSTOMERS)


@app.route("/admin/sales")
def admin_sales():
    return render_template("admin/sales.html", active_page="sales", sales_monthly=SALES_MONTHLY)


@app.route("/admin/categories")
def admin_categories():
    return render_template("admin/categories.html", active_page="categories")


@app.route("/admin/promos")
def admin_promos():
    return render_template("admin/promos.html", active_page="promos", promos=PROMOS)


@app.route("/admin/refunds")
def admin_refunds():
    return render_template("admin/refunds.html", active_page="refunds", refunds=REFUNDS)


@app.route("/admin/employees")
def admin_employees():
    return render_template("admin/employees.html", active_page="employees", employees=EMPLOYEES)


@app.route("/admin/audit")
def admin_audit():
    return render_template("admin/audit.html", active_page="audit", logs=AUDIT_LOGS)


if __name__ == "__main__":
    app.run(debug=True)
