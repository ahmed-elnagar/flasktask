from flask import Flask
from flask import request
app = Flask(__name__)


@app.route('/sum' , methods=['POST'])
def sum():
    reqJson = request.get_json()
    x = reqJson['x']
    y = reqJson['y']
    result = x+y
    return {"message": f"sum of {x} and {y} is {result}"}

@app.route('/multiply' , methods=['POST'])
def multiply():
    reqJson = request.get_json()
    x = reqJson['x']
    y = reqJson['y']
    result = x*y
    return {"message": f"multiply of {x} and {y} is {result}"}


@app.route('/divide' , methods=['POST'])
def divide():
    reqJson = request.get_json()
    x = reqJson['x']
    y = reqJson['y']
    if y==0:
        return {"error":"y can't be 0"} , 400
    result = x/y
    return {"message": f"division of {x} and {y} is {result}"}
app.run(host='0.0.0.0', port=50100)