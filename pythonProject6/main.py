from dao import add_task, delete_task, list_tasks, update_task, marked_task


def show_menu():
    while True:
        print('Task Manager Menu:')
        print('1.Add task')
        print('2.Delete task')
        print('3.List tasks')
        print('4.Update task')
        print('5.Mark task')
        print('6.Exit')

        choice = input('Enter your choice: ')
        if choice == '1':
            description =  input('Enter task description: ')
            add_task(description)
        elif choice == '2':
            id = int(input('Enter task id: '))
            delete_task(id)
        elif choice == '3':
            status = input('Enter task status: (can be blanked)')
            list_tasks(status if status else None)
        elif choice == '4':
            id = int(input('Enter task id: '))
            description = input('Enter task description: ')
            update_task(id, description)
        elif choice == '5':
            task_id = input('Enter task id: ')
            status = input('Enter task status: (can be blanked)')
            marked_task(task_id, status)
if __name__ == '__main__':
    show_menu()