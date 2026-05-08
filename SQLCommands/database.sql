import pyodbc
import customtkinter

customtkinter.set_appearance_mode("system")
customtkinter.set_default_color_theme("blue")

app = customtkinter.CTk()
app.geometry("300x500")
app.title("Create-Connect MS Database")

entry_database = customtkinter.CTkEntry(app, placeholder_text="Database Name")
entry_database.place(relx=0.1, rely=0.1)

# Додано зі скріншота image_1d0e50 (Delete Data)
entry_table_name = customtkinter.CTkEntry(app, placeholder_text="Table name")
entry_table_name.place(relx=0.2, rely=0.1) # Розташування згідно зі скріном

entry_id = customtkinter.CTkEntry(app, placeholder_text="ID")
entry_id.place(relx=0.2, rely=0.2)


def create_db(): # image_1d15d1
    try:
        # Open connection to SQL Server
        connection = pyodbc.connect('DRIVER={SQL Server};'
                                    'server=RITHUL-DESKTOP\\EDUREKA;'
                                    'database=master;'
                                    'Trusted_Connection=yes')
        connection.autocommit = True
        
        # Get the database name from the entry and format the query correctly
        database_name = entry_database.get().strip()
        
        # Ensure that the database name is not empty
        if database_name:
            connection.execute(f"CREATE DATABASE [{database_name}]")
            info_label.configure(text="Database Created")
        else:
            info_label.configure(text="Database Name cannot be empty")
            
    except pyodbc.Error as ex:
        print('Connection failed', ex)
        info_label.configure(text="Database Creation failed")

def connect_db(): # image_1d1554
    try:
        # Open connection to the database with user-provided name
        connection = pyodbc.connect('DRIVER={SQL Server};'
                                    'server=RITHUL-DESKTOP\\EDUREKA;'
                                    f'database={entry_database.get().strip()};'
                                    'Trusted_Connection=yes')
        
        info_label.configure(text="Connection successful")
    except pyodbc.Error as ex:
        print('Connection failed', ex)
        info_label.configure(text="Connection failed")

def select(): # image_1d0e50 / image_1cac94
    try:
        # Establish database connection
        connection = pyodbc.connect('DRIVER={SQL Server};' +
                                    'server=RITHUL-DESKTOP\\EDUREKA;' +
                                    'database=master;' +
                                    'Trusted_Connection=yes')
        
        cursor = connection.cursor()
        a = 0
        # Correct SQL query with proper spaces
        query = f"SELECT * FROM {entry_table_name.get()} WHERE id = {entry_id.get()}"
        cursor.execute(query)
        
        for data in cursor:
            a = 1
            info_label.configure(text=f"{data[0]} {data[1]}")
        if a == 0:
            info_label.configure(text="No Data")
            
    except pyodbc.Error as ex:
        print("Failed!", ex)
        info_label.configure(text="No Table")

def delete(): # image_1d0e0b / image_1cac90
    try:
        # Establish database connection
        connection = pyodbc.connect('DRIVER={SQL Server};' +
                                    'server=RITHUL-DESKTOP\\EDUREKA;' +
                                    'database=master;' +
                                    'Trusted_Connection=yes')
        
        cursor = connection.cursor()
        
        # Delete the record based on table name and ID
        query = f"DELETE FROM {entry_table_name.get()} WHERE id = {entry_id.get()}"
        cursor.execute(query)
        connection.commit()
        
        info_label.configure(text="Data Deleted")
    except pyodbc.Error as ex:
        print("Failed!", ex)
        info_label.configure(text="Delete Failed")


# image_1d15d1
create_button = customtkinter.CTkButton(app, text="Create", 
                                        command=create_db, fg_color="green")
create_button.place(relx=0.1, rely=0.2)

# image_1d1554
connect_button = customtkinter.CTkButton(app, text="Connect", 
                                         command=connect_db, fg_color="blue")
connect_button.place(relx=0.1, rely=0.3)

# image_1d0e50
select_button = customtkinter.CTkButton(app, text="Select", 
                                        command=select, fg_color="green")
select_button.place(relx=0.2, rely=0.3)

# image_1d0e0b
delete_button = customtkinter.CTkButton(app, text="Delete", 
                                        command=delete, fg_color="red")
delete_button.place(relx=0.2, rely=0.4)

# Status Label
info_label = customtkinter.CTkLabel(app, text="Company") # Текст зі скріна 1d0e0b
info_label.place(relx=0.2, rely=0.5)

app.mainloop()
