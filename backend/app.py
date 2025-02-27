from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
import os

app = Flask(__name__)
CORS(app)

# MySQL Connection
db = mysql.connector.connect(
    host=os.getenv('DB_HOST', 'localhost'),
    user=os.getenv('DB_USER', 'root'),
    password=os.getenv('DB_PASS', 'password'),  # Replace with your MySQL password
    database=os.getenv('DB_NAME', 'test')
)

# Routes
@app.route('/api/recipes', methods=['GET'])
def get_recipes():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM recipes")
    recipes = cursor.fetchall()
    return jsonify(recipes)

@app.route('/api/recipes', methods=['POST'])
def add_recipe():
    data = request.json
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO recipes (name, ingredients, instructions) VALUES (%s, %s, %s)",
        (data['name'], data['ingredients'], data['instructions'])
    )
    db.commit()
    return jsonify({"message": "Recipe added"})

@app.route('/api/recipes/<int:id>', methods=['DELETE'])
def delete_recipe(id):
    cursor = db.cursor()
    cursor.execute("DELETE FROM recipes WHERE id = %s", (id,))
    db.commit()
    return jsonify({"message": "Recipe deleted"})


port = os.getenv('PORT', 5000)
if __name__ == '__main__':
    app.run(debug=True, port= port)