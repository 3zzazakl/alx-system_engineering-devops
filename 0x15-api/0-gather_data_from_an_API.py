#!/usr/bin/python3
"""Gather data from an API"""
import requests
import sys


def do(userId):
    """Gather data from an API"""
    name = requests.get(
        "https://jsonplaceholder.typicode.com/users/{}".format(
            userId)).json().get("name")
    tasks = requests.get(
        "https://jsonplaceholder.typicode.com/todos?userId={}".format(
            userId)).json()

    tasks_done = ['\t ' + task.get('title') for task in tasks
                  if task.get('completed')]

    if name and tasks_done:
        print("Employee {} is done with tasks({}/{}):".format(
            name, len(tasks_done), len(tasks)))
        print("\n".join(tasks_done))


if __name__ == "__main__":
    if len(sys.argv) == 2 and sys.argv[1].isdigit():
        do(sys.argv[1])
