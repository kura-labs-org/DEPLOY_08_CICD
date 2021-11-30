from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
import datetime
from flask_marshmallow import Marshmallow
from flask_cors import CORS
#https://pythonbasics.org/flask-sqlalchemy/
#https://flask-sqlalchemy.palletsprojects.com/en/2.x/config/
app = Flask(__name__)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://DBusername:DBpassword@DBEndpoint:3306/DatabaseName'
app.config['SQLALCHEMY_DATABASE_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
ma = Marshmallow(app)

class Articles(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100))
    body = db.Column(db.Text())
    date = db.Column(db.DateTime, default = datetime.datetime.now)

    def __init__(self, title, body):
        self.title = title
        self.body = body

class ArticleSchema(ma.Schema):
    class Meta:
        fields = ('id', 'title', 'body', 'date')
article_schema = ArticleSchema()
articles_schema = ArticleSchema(many=True)
#use the below command to create the table and then comment it out once created
#db.create_all()
@app.route('/get', methods = ['GET'])
def get_articles():
    all_articles = Articles.query.all()
    results = articles_schema.dump(all_articles)
    return jsonify(results)

@app.route('/get/<id>/', methods = ['GET'])
def post_articles(id):
    article = Articles.query.get(id)
    return article_schema.jsonify(article)

@app.route('/add', methods = ['POST'])
def add_article():
    title = request.json['title']
    body = request.json['body']

    articles = Articles(title, body)
    db.session.add(articles)
    db.session.commit()
    return article_schema.jsonify(articles)

@app.route('/update/<id>/', methods = ['PUT'])
def update_article(id):
    article = Articles.query.get(id)

    title = request.json['title']
    body = request.json['body']

    article.title = title
    article.body = body

    db.session.commit()
    return article_schema.jsonify(article)

@app.route('/delete/<id>/', methods = ['DELETE'])
def delete_article(id):
    article = Articles.query.get(id)
    db.session.delete(article)
    db.session.commit()
    return article_schema.jsonify(article)

if __name__ == "__main__":
    app.run()

