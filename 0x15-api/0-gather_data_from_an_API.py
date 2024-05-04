#!/usr/bin/python3
import requests
import sys


employee_id = sys.argv[1]
response_user = requests.get(
    f"https://jsonplaceholder.typicode.com/users/{employee_id}")
reponse_todos = requests.get(
    f"https://jsonplaceholder.typicode.com/todos?userId={employee_id}")


if __name__ == "__main__":
    if response_user.status_code != 200 or reponse_todos.status_code != 200:
        print("Error: Not a valid user id")
        sys.exit(1)

    ud = response_user.json()
    todo = reponse_todos.json()

    dtsk = [task for task in todo if task.get("completed")]

    print(f"Employee {ud.get('name')} is done with tasks({len(dtsk)}{len(todo)}):")
    for task in dtsk:
        print(f"\t {task.get('title')}")
