from flask import Flask, render_template, request, Response
import handler
import json

application = Flask(__name__)

@application.route('/')
def home():
    inven_data = handler.get_inventory()
    headings = ['Comtek ID', 'Status', 'Borrowed By']
    return render_template('home.html', inven_data=inven_data, headings=headings)
    

@application.route('/scan', methods=['GET'])
def scan_equipment(): #aadd key as parameter
    #needs to pull Comtek_ID or Headphone_ID, status, name_of_borrower if there is one, and secondary_loan if there is one.
        # SHOULD I RRENDER RESPONSE_DATA OR RESPONSE
    # response_data = handler.get_info(key)
    # response = Response(json.dumps(response_data), mimetype = 'application/json')

    # return render_template('scan.html', response)
    names_data = handler.get_names()

    return render_template('scan.html', names_data=names_data)


@application.route('/save')
def update_inventory():
    request_data = request.args
    # if request.method == "PUT":
    #     data = str(request.form.get("Name"))
    response_data = handler.update_inventory(request_data)
    
    return render_template('save.html', data=response_data)


@application.route('/inventory')
def display_inventory():
    inven_data = handler.get_inventory()
    headings = ['Comtek ID', 'Status', 'Borrowed By']

    return render_template('inventory.html', inven_data=inven_data, headings=headings)


if __name__ == '__main__':
    application.run(debug=True)










# Retired routes. They might not have solved the problem I wanted, or their functions were cannibalized by other routes
# 
# @application.route('/update', methods=['PUT'])
# def update_inventory():
# #needs to take request and write to db
#     request_data = request.get_json()
#     response_data = handler.update_inventory(request_data)
    
#     return response_data