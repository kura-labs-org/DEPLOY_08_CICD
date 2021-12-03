from flask import Flask, request, Response
from flask import render_template
import sqlite3
import random

application = app = Flask(__name__)

@application.route("/", methods=["POST", "Get"])
def home():
    return render_template("front.html")

@application.route("/result", methods=["POST", "GET"])
def sub_budget():
    Choice = random.randint(0, 2)
    Options = ['Michael Jordan', 'LeBron James', 'Kevin Durant']
    Computer = "Computer chose: " + Options[Choice]
    global CompChoice
    global WinLoseTie
    global Player
    CompChoice = Options[Choice]
    if request.form.get('action') == '1':
        Player = "LeBron James" 
        if CompChoice == "Michael Jordan":
            WinLoseTie = "You Lose!"
        elif CompChoice == "Kevin Durant":
            WinLoseTie = "You Win!"
        else:
            WinLoseTie = "You tied!"
    elif request.form.get('action') == '2':
        Player = "Michael Jordan" 
        if CompChoice == "Kevin Durant":
            WinLoseTie = "You Lose!"
        elif CompChoice == "LeBron James":
            WinLoseTie = "You Win!"
        else:
            WinLoseTie = "You tied!"
    else:
        Player = "Kevin Durant" 
        if CompChoice == "Michael Jordan":
            WinLoseTie = "You Win!"
        elif CompChoice == "Kevin Durant":
            WinLoseTie = "You Tied!"
        else:
            WinLoseTie = "You Lose!"

    return render_template("front.html", choice = Computer, WinLoseTie = WinLoseTie)


