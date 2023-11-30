from flask import Flask
app = Flask(__name__)


@app.route('/sum' , methods=['POST'])
def sum():
    reqJson = request.get_json()
    x = reqJson['x']
    y = reqJson['y']
    sumVal = x+y
    return {"message": f"sum of {x} and {y} is {sumVal}"}

app.run(host='0.0.0.0', port=50100)