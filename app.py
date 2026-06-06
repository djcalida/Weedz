from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("customer/index.html")

@app.route("/login")
def login():
    return render_template("customer/login.html")

@app.route("/registration")
def registration():
    return render_template("customer/registration.html")

@app.route("/register")
def register():
    return render_template("customer/registration.html")

if __name__ == "__main__":
    app.run(debug=True)