import json, os.path as os
from models import Task

file_name = 'data/task.json'

def load_json(file_name):
    with open(file_name, 'r') as f:
        data = json.load(f)
        print(data)
        return data
    return []

def save_json(tasks, file_name):
    with open(file_name, 'w') as f:
        json.dump(tasks, f, indent=4)

def add_task(description):
    tasks = load_json(file_name)
    task_id = len(tasks) + 1
    task = Task(task_id, description)
    tasks.append(task.to_dict())
    save_json(tasks, file_name)
    print(f'Task added successfully: {task_id}')

def list_tasks(status=None):
    tasks = load_json(file_name)
    filtered_tasks = []
    for task_data in tasks:
        task = Task.from_dict(task_data)
        if not status or task.status == status:
            filtered_tasks.append(task)

    for task in filtered_tasks:
        print(f'ID: {task.id} | Description: {task.description} | Status: {task.status}')

def delete_task(task_id):
    tasks = load_json(file_name)
    tasks = [x for x in tasks if x['id'] != task_id]
    save_json(tasks, file_name)
    print(f'Task deleted successfully: {task_id}')

def update_task(task_id, description):
    tasks = load_json(file_name)
    for i, task_data in enumerate(tasks):
        if task_data['id'] == task_id:
            task = Task.from_dict(task_data)
            task.description = description
            tasks[i] = task.to_dict()
            save_json(tasks, file_name)
            print(f'Task updated successfully: {task_id}')
            return

    print('Task not found')

def marked_task(task_id, status ):
    tasks = load_json(file_name)
    for i, task_data in enumerate(tasks):
        if task_data['id'] == task_id:
            task = Task.from_dict(task_data)
            task.status = status
            save_json(tasks, file_name)
            print(f'Task marked successfully: {task_id}')
            return

    print(f'Task marked successfully: {task_id}')