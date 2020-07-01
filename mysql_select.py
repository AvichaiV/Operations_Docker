import mysql.connector
import time

def main():
    """
    The main program to get conect to the Mysql and run the querry
    """
    try:
        mydb = mysql.connector.connect(
        host='docker_db_1',
        #host="127.0.0.1",
        user="root",
        password="pass",
        database="new_test_db"
        )
        mycursor = mydb.cursor()

        mycursor.execute("select c.Id as Copnay_ID, c.Name as Company_Name, a.Id as Account_ID, a.Name as Account_Name, p.Id as Project_Id, p.Name as Project_Name, \
        CASE p.Status WHEN 0 THEN 'Inactive' WHEN 1 THEN 'Active' WHEN 2 THEN 'Frozzen' END as 'Project_Status' \
            from As_project p \
            inner join As_account a on p.Account_id = a.Id \
            inner join As_company c on a.Company_id = c.Id;")

        ExportSqlAsHtml(mycursor.column_names,mycursor.fetchall())
        return True

    except:
        return False
"""
The fanction to convert the querry result to HTML File
haddewrs : a list of all the Hadders from the querry
rows : the list of all the list of rows from the querry
"""
def ExportSqlAsHtml(haddewrs,rows):
    save = "<TABLE BORDER=1><TR>"
    for Hadder in haddewrs:
        save += (f"<TH>{Hadder}</TH>")
    save += "</TR>"

    for row in rows:
        save += "<TR>"
        for cal in row:
            save += (f"<TD>{cal}</TD>")
        save += "</TR>"
    save += "</TABLE>"

    print(save)

    with open("res.html", "w") as file:
        file.write(save)

if __name__ == "__main__":
    i=0
    Lops = 20
    while i < Lops:
        if main():
            break
        else:
            print(f"The MySQL server is not responding going to sleep for 20 sec, try {i} of {Lops}")
            time.sleep(20)
            i +=1