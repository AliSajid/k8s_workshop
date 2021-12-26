"""
Test project for kubernetes workshop
"""


from flask import Flask, jsonify, abort, request
import urllib.request, json, os

from github import Github

GITHUB_CLIENT_ID = os.getenv("GITHUB_CLIENT_ID")
GITHUB_CLIENT_SECRET = os.getenv("GITHUB_CLIENT_SECRET")
DEBUG = os.getenv("DEBUG")

g = Github(GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET)

app = Flask(__name__)


@app.route("/")
def index():
    r = []

    try:
        args = request.args
        n = int(args["n"])
        language = args.get("language", "python")
    except (ValueError, LookupError) as e:
        abort(jsonify(error="No integer provided for argument 'n' in the URL"))

    repositories = g.search_repositories(query=f"language:{language}")[:n]

    for repo in repositories:
        data = {
            "name": repo.name,
            "url": repo.url,
            "stars": repo.watchers_count,
            "watchers": repo.watchers_count
        }
        r.append(data)

    return jsonify({"repos": r})


if __name__ == "__main__":
    app.run(debug=DEBUG)
