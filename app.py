import json

from flask import Flask, jsonify, render_template, request

from data.products import CATEGORIES, PRODUCTS, get_by_category, get_featured, get_product

app = Flask(__name__)


@app.context_processor
def inject_globals():
    return {
        "categories": CATEGORIES,
        "all_products": PRODUCTS,
    }


@app.route("/")
def home():
    return render_template("customer/index.html", featured=get_featured())


@app.route("/shop")
def shop():
    category = request.args.get("category")
    query = request.args.get("q", "").strip().lower()
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


if __name__ == "__main__":
    app.run(debug=True)
