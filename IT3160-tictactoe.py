import copy
import heapq
import json

goal_state = [[1,2,3], [4,5,6], [7,8,0]]

def print_board(board):
    for row in board:
        for col in row:
            print(col, end=" ")
        print()

def find_empty(board):
    for i in range (3):
        for j in range (3):
            if board[i][j] == 0:
                return i, j

def manhattan_distance(i1, j1, i2, j2):
    return abs(i1-i2)+abs(j1-j2)
def heuristic(board):
    total_distance = 0
    for i in range (3):
        for j in range (3):
            value = board[i][j]
            if value != 0:
                correct_x, correct_y = divmod(value - 1, 3)
                total_distance += manhattan_distance(i, j, correct_x, correct_y)

    return total_distance

def is_valid_move(x: int, y: int) -> bool:
    return 0 <= x < 3 and 0 <= y < 3

moves = [(-1, 0), (0, -1), (1, 0), (0, 1)]
def A_star_search(start_state):
    pq = []
    heapq.heappush(pq, (heuristic(start_state),0 , start_state, []))
    visited = set()
    while pq:
        f, g, current_state, path = heapq.heappop(pq)
        if current_state == goal_state:
            return path + [current_state]

        visited.add(str(current_state))

        empty_x, empty_y = find_empty(current_state)

        for move in moves:
            new_x, new_y = empty_x + move[0], empty_y + move[1]

            if is_valid_move(new_x, new_y):
                new_state = copy.deepcopy(current_state)
                new_state[empty_x][empty_y], new_state[new_x][new_y] = new_state[new_x][new_y], new_state[empty_x][empty_y]

                if (str(new_state)) not in visited:
                    new_path = path + [current_state]
                    heapq.heappush(pq, (g + 1 + heuristic(new_state), g + 1 , new_state, new_path))
                    # Total(Cost + HeuristicCost), Cost, new State, trace_path

    return None

if __name__ == '__main__':
    start_state = [[1,2,3], [4,0,6], [7,5,8]]
    solution = A_star_search(start_state)
    if solution is None:
        print("No solution")
        exit(0)
    else:
        print('Steps to solution: ')
        for state in solution:
            print_board(state)
            print()
