import heapq
import collections
import time
from abc import ABC, abstractmethod
import numpy as np

def make_game_state(input):
    # So dong cua o input
    rows = len(input)
    # Thay the cac ki tu xuong dong thanh ki tu rong
    input = [x.replace('\n', '') for x in input]
    # Them dau phay ngan cach cac ki tu o trong tung chuoi
    input = [','.join(input[i]) for i in range(len(input))]
    # Chuyen cac chuoi tuong ung thanh cac mang ki tu
    input = [x.split(',') for x in input]
    maxCols = max([len(x) for x in input])

    saveWalls = []
    for i in range(rows):
        for j in range (len(input[i])):
            if input[i][j] == ' ':
                # O trong
                input[i][j] = 0
            elif input[i][j] == '#':
                # Tuong
                input[i][j] = 1
                saveWalls += [(i, j)]
            elif input[i][j] == 'A':
                # Actor
                input[i][j] = 2
            elif input[i][j] == 'X':
                # Box
                input[i][j] = 3
            elif input[i][j] == '_':
                # Goal
                input[i][j] = 4
            elif input[i][j] == 'O':
                # Box o goal
                input[i][j] = 5
            elif input[i][j] == 'E':
                # Actor o goal
                input[i][j] = 6

        colsNum = len(input[i])
        if colsNum < maxCols:
            input[i].extend([1 for _ in range (maxCols - colsNum)])

    for i in range(len(input)):
        for j in range(0, len(input[i])):
            print(input[i][j], end= ' ')
        print()

    array = np.array(input)
    posWalls = tuple(tuple(x) for x in np.argwhere(array == 1))
    posGoals = tuple(tuple(x) for x in np.argwhere((array == 4) | (array == 5) | (array == 6)))
    initialBoxes = tuple(tuple(x) for x in np.argwhere((array == 3) | (array == 5))) # tọa độ của các box
    initialActor = tuple(np.argwhere((array == 2) | (array == 6))[0])

    return (posWalls, posGoals, initialBoxes, initialActor, saveWalls)

def is_win_game(posBoxes) -> bool:
    return sorted(posBoxes) == sorted(posGoals)

def isValidMove(move, posActor, posBoxes):
    xActor, yActor = posActor
    if move[-1]:
        xNext, yNext = xActor + 2*move[0], yActor + 2*move[1]
    else:
        xNext, yNext = xActor + move[0], yActor + move[1]
    return (xNext, yNext) not in posBoxes + posWalls

moves = [[-1, 0], [0, -1], [0, 1], [1, 0]]
def nextMoves(posActor, posBoxes):
    xActor, yActor = posActor
    allNextMoves = []
    for move in moves:
        xNext, yNext = xActor + move[0], yActor + move[1]
        if (xNext, yNext) in posBoxes:
            move.append(True)
        else:
            move.append(False)
        if isValidMove(move, posActor, posBoxes):
            allNextMoves.append(move)
    return tuple(tuple(x) for x in allNextMoves)

def updateState(posActor, posBoxes, move):
    xActor, yActor = posActor
    newPosActor = [xActor + move[0], yActor + move[1]]
    posBoxes = list(list(x) for x in posBoxes)
    if move[-1]:
        posBoxes.remove(newPosActor)
        posBoxes.append([xActor + 2 * move[0], yActor + 2 * move[1]])

    newPosBoxes = tuple(tuple(x) for x in posBoxes)
    newPosActor = tuple(newPosActor)
    return newPosActor, newPosBoxes

def isFailed(posBoxes, posGoals, posWalls):
    for box in posBoxes:
        if box in posGoals:
            continue
        if (box[0] + 1, box[1]) in posWalls:
            if ((box[0], box[1] + 1) in posWalls) or ((box[0], box[1] - 1) in posWalls):
                return True
            if ((box[0], box[1] + 1) in posBoxes) and ((box[0] + 1, box[1] + 1) in posWalls):
                return True
            if ((box[0], box[1] - 1) in posBoxes) and ((box[0] + 1, box[1] - 1) in posWalls):
                return True

        if (box[0] - 1, box[1]) in posWalls:
            if ((box[0], box[1] - 1) in posWalls) or ((box[0], box[1] + 1) in posWalls):
                return True
            if ((box[0], box[1] + 1) in posBoxes) and ((box[0] - 1, box[1] + 1) in posWalls):
                return True
            if ((box[0], box[1] - 1) in posBoxes) and ((box[0] + 1, box[1] - 1) in posWalls):
                return True

        if (box[0], box[1] + 1) in posWalls:
            if (box[0] + 1, box[1]) in posBoxes and (box[0] + 1, box[1] + 1) in posWalls:
                return True
            if (box[0] - 1, box[1]) in posBoxes and (box[0] - 1, box[1] + 1) in posWalls:
                return True

        if (box[0], box[1] - 1) in posWalls:
            if (box[0] + 1, box[1]) in posBoxes and (box[0] + 1, box[1] - 1) in posWalls:
                return True
            if (box[0] - 1, box[1]) in posBoxes and (box[0] - 1, box[1] + 1) in posWalls:
                return True

    return False

def heuristic(posBoxes):
    distance = 0
    completed = set(posGoals) & set(posBoxes)
    sortedPosBoxes = list(set(posBoxes).difference(completed))
    sortedPosGoals = list(set(posBoxes).difference(completed))
    for i in range (len(sortedPosBoxes)):
        distance += abs(sortedPosGoals[i][0] - sortedPosBoxes[i][0]) + abs(sortedPosGoals[i][1] - sortedPosBoxes[i][1])
    return distance

# Ham costFunction:
# Luu tru cac trang thai cua game tu trang thai dau den trang thai hien tai
# Tra ve do dai cua mang trang thai
def costFunction(node):
    return len(node)

def AStarAlgorithm():
    priorityQueue = []
    initialState = [(initialActor, initialBoxes)]
    heapq.heappush(priorityQueue, (0 , initialState))
    explored = set()
    while priorityQueue:
        _, node = heapq.heappop(priorityQueue)
        if is_win_game(node[-1][-1]):
            return node
        if node[-1] in explored:
            continue
        explored.add(node[-1])
        cost = costFunction(node)
        allNextMoves = nextMoves(node[-1][0], node[-1][1]) # posActor and posBoxes
        for move in allNextMoves:
            newPosActor, newPosBox = updateState(node[-1][0], node[-1][1], move)
            if not isFailed(newPosBox, posGoals, posWalls):
                saveNode = node + [(newPosActor, newPosBox)]
                fCost = heuristic(newPosBox) + cost
                heapq.heappush(priorityQueue, (fCost, saveNode))

    return []

def dfs_algorithm():
    queue = collections.deque([[(initialActor, initialBoxes)]])
    explored = set()
    while queue:
        print(queue)
        node = queue.pop()
        if is_win_game(node[-1][-1]):
            return node
        if node[-1] not in explored:
            explored.add(node[-1])
            for action in nextMoves(node[-1][0], node[-1][1]):
                newPosActor, newPosBox = updateState(node[-1][0], node[-1][1], action)
                if not isFailed(newPosBox, posGoals, posWalls):
                    queue.append(node + [(newPosActor, newPosBox)])
    return []

def print_result():
    maxHeight = len(initial)
    maxWidth = max([len(i) for i in initial])
    file_name = 'outputs/' + fileName + 'redo'
    with open(file_name, 'w') as f:
        for rs in result:
            for i in range (maxHeight):
                for j in range (maxWidth - 1):
                    ch = ' '
                    position = (i, j)
                    if position in posGoals:
                        if position in rs[1]:
                            ch = 'O'
                        elif position == rs[0]:
                            ch = 'E'
                        else:
                            ch = '_'
                    elif position in saveWalls:
                        ch = '#'
                    elif position in rs[1]:
                        ch = 'X'
                    elif position == rs[0]:
                        ch = 'A'
                    f.write(ch)
                f.write('\n')
            f.write('\n')

def show_menu():
    print('------GAME SOKOBAN------')
    print('---Terminal Version---')

if __name__ == "__main__":

    while True:
        show_menu()
        type = input('Select input type: (1 - Mini Comos, 2 - Micro Comos): ')
        if type in ['1', '2']:
            break
        else:
            print('Invalid input')

    while True:
        level = input('select level from (1 - 30) to play: ')
        if (int(level) > 1 or int(level) < 30):
            break

    while True:
        alg = input('SELECT search algorithm: ')
        if alg in ['1', '2']:
            break

    fileName = '{0}/{1}.txt'.format('mini' if type == '1' else 'micro', level)
    with open('inputs/' + fileName, 'r') as f:
        initial = f.readlines()

    (posWalls, posGoals, initialBoxes, initialActor, saveWalls) = make_game_state(initial)
    # print(saveWalls)
    startGame = time.time()
    if alg == '1':
        print('Using DFS algorithm to solve...')
        result = dfs_algorithm()
    elif alg == '2':
        print('Using AStar algorithm to solve...')
        result = AStarAlgorithm()
    endTime = time.time()

    print('Total time: {0} seconds'.format(endTime - startGame))

    if result:
        print('Total step: ', len(result))
        print_result()
    else:
        print('No solution')

