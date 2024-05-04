#!/usr/bin/python3
""" Export data in the JSON format """

import json
import requests
import sys


def jsonWriter(employeeId):
    """ Export data in the JSON format """
    name = requests.get(
        "https://jsonplaceholder.typicode.com/users/{}".format(
            employeeId)).json().get("username")
    tasks = requests.get(
        "https://jsonplaceholder.typicode.com/todos?userId={}".format(
            employeeId)).json()

    with open("{}.json".format(employeeId), "w") as jsonfile:
        data = {
            employeeId: []
        }
        for task in tasks:
            data[employeeId].append({
                "task": task.get("title"),
                "completed": task.get("completed"),
                "username": name
            })
        json.dump(data, jsonfile)


if __name__ == "__main__":
    if len(sys.argv) == 2 and sys.argv[1].isdigit():
        jsonWriter(sys.argv[1])
