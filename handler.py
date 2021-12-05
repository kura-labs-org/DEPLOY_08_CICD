import sqlite3

db_path = './inventory.db'

def get_info(key):
    try:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Equipment_Tracking WHERE Comtek_ID = '%s'" % key)
        result = cursor.fetchall()
        return result

    except Exception as e:
        print("Error: ", e)
        return None


def update_inventory(request_data):
    # Set the values of the HTML form to variables to pass into the database
    borrower = request_data['borrower']
    if request_data['status'] == "Loaning":
        status = "OUT"
    else:
        status = "IN"
    comtek_id = int(request_data['comtek_id'])

    # Connect to the database and set new values based on the comtek_id value. Return message based on result!""
    try:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.execute("UPDATE Equipment_Tracking SET Borrower = ?, Status = ? WHERE Comtek_ID = ?", (borrower, status, comtek_id))
        connection.commit()
        return "Updated Successfully!"
    except Exception as e:
        print('Error: ', e)
        return "Failed Submission. Please try again!"


def get_names():
    try:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Names ORDER BY Name")
        result = cursor.fetchall()
        return result

    except Exception as e:
        print("Error: ", e)
        return None


def get_inventory():
    try:
        connection = sqlite3.connect(db_path)
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Equipment_Tracking ORDER BY Comtek_ID")
        result = cursor.fetchall()
        return result

    except Exception as e:
        print("Error: ", e)
        return None




# print(update_inventory({'borrower': 'gj', 'status': 'Loaning', 'comtek_id': 123}))
