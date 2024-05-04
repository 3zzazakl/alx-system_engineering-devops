#!/usr/bin/python3
""" Export data in the CSV format """
import csv
import requests
import sys


def cvs_writer(employeeId):
    """ Export data in the CSV format """
    name = requests.get(
        "https://jsonplaceholder.typicode.com/users/{}".format(
            employeeId)).json().get("username")
    tasks = requests.get(
        "https://jsonplaceholder.typicode.com/todos?userId={}".format(
            employeeId)).json()

    with open("{}.csv".format(employeeId), "w") as csvfile:
        fieldnames = ["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames, quoting=csv.QUOTE_ALL)

        for task in tasks:
            writer.writerow({
                "USER_ID": task.get("userId"),
                "USERNAME": name,
                "TASK_COMPLETED_STATUS": task.get("completed"),
                "TASK_TITLE": task.get("title")
            })


if __name__ == "__main__":
    if len(sys.argv) == 2 and sys.argv[1].isdigit():
        cvs_writer(sys.argv[1])
