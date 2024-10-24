import json
from os import getenv

import requests
from flask import Flask, request
from flask.typing import ResponseReturnValue

app = Flask(__name__)


def get_users() -> list[dict[str, str]]:
    with open("users.json") as f:
        return json.load(f)


def write_log(message: str) -> None:
    with open("log.txt", "a") as f:
        f.write(f"{message}\n")


def get_cat_fact() -> str:
    return requests.get("https://catfact.ninja/fact").json()["fact"]


@app.post("/api/login")
def login() -> ResponseReturnValue:
    if request.authorization != getenv("API_TOKEN"):
        return {"message": "wrong token"}, 401

    data = request.get_json()
    if {data["username"]: data["password"]} in get_users():
        write_log("successful")
        return get_cat_fact()

    write_log("Wrong")
    return {"message": "Unauthorized"}, 401


if __name__ == "__main__":
    app.run()
