from flask import Flask, jsonify
import redis

app = Flask(__name__)
r = redis.Redis(host='redis', port=6379, decode_responses=True)

@app.route('/')
def home():
    r.incr('visits')
    return jsonify(message="Welcome!", visits=r.get('visits'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
