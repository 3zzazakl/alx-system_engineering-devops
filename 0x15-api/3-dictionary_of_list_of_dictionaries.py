#!/usr/bin/python3
"""
    Dictionary of list of dictionaries
"""
import json
from requests import get
import sys


def json_writer():
    """ Export data in the JSON format """
    data = get(
        "https://jsonplaceholder.typicode.com/users").json()
    ids = [(dic.get("id"), dic.get("username")) for dic in data]
    dumped = {}

    for person in ids:
        data = get(
            'https://jsonplaceholder.typicode.com/todos?userId={}'.format(
                person[0])).json()
        ordered = [{"task": line.get("title"), "completed":
                   line.get("completed"), "username":
                   person[1]} for line in data]
        dumped[person[0]] = ordered

    with open('todo_all_employees.json', "w") as jsonfile:
        json.dump(dumped, jsonfile)


if __name__ == "__main__":
    json_writer()
