from dotenv import load_dotenv
from flask import Flask, request, jsonify
from os import getenv
import requests
import json
load_dotenv()


app = Flask(__name__)

def get_data():
    with open("test_data.json", "r") as f:
        return json.load(f)

@app.route('/api/login',methods = ['POST'])
def login():
    if request.method == 'POST':
        token = request.headers.get('Authorization')
        if token == getenv("API_TOKEN"):
            data = request.get_json()
            for i in get_data():
                if data["username"] in i and data["password"] == i[data["username"]]:
                    return requests.get("https://catfact.ninja/fact").json()["fact"]
                else:
                    return jsonify({"message": "Unauthorized"}), 401
        else:
            return jsonify({"message": "wrong token"}), 401


if __name__ == "__main__":
    app.run(debug=True)
