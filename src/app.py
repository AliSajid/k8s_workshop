from flask import Flask, jsonify, abort, request
import urllib.request, json, os
from github import Github
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

app = Flask(__name__)

logger.error("Loading Environment Variables")
CLIENT_ID = os.getenv('CLIENT_ID')
CLIENT_SECRET = os.getenv('CLIENT_SECRET')
DEBUG = os.getenv('DEBUG')
HOST = os.getenv('HOST')
PORT = os.getenv('PORT')

g = Github(CLIENT_ID, CLIENT_SECRET)

def extract_repo_data(repo):
    pass

@app.route('/')
def get_repos():
    r = []

    try:
        logger.error(f"Recieved following request args: {request.args}")
        args = request.args
        n = int(args['n'])
        l = args['l']
    except (ValueError, LookupError) as e:
        logger.error("Necessary arguments not found. Aborting.")
        abort(jsonify(error="Please provide 'n' and 'l' parameters"))

    repositories = g.search_repositories(query='language:' + l)[:n]


    try:
        for repo in repositories:
            with urllib.request.urlopen(repo.url) as url:
                data = extract_repo_data(json.loads(url.read().decode()))
            r.append(data)
        return jsonify({
            'repos':r,
            'status': 'ok'
            })
    except IndexError as e:
        return jsonify({
            'repos':r,
            'status': 'ko'
            })

if __name__ == '__main__':
    app.run(debug=DEBUG, host=HOST, port=PORT)