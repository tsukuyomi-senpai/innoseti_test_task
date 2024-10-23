from dotenv import load_dotenv
from flask import Flask, request, jsonify
from os import getenv
import requests
load_dotenv()


app = Flask(__name__)


@app.route('/api/login',methods = ['POST'])
def login():
    json = [{"user":"secret"},
            {"user1":"password1"},
            {"user2":"password2"}]
    if request.method == 'POST':
        token = request.headers.get('Authorization')
        if token == getenv("API_TOKEN"):
            data = request.get_json()
            for i in json:
                if data["username"] in i and data["password"] == i[data["username"]]:
                    return requests.get("https://catfact.ninja/fact").json()["fact"]
                else:
                    return jsonify({"message": "Unauthorized"}), 401
        else:
            return jsonify({"message": "wrong token"}), 401


if __name__ == "__main__":
    app.run(debug=True)
