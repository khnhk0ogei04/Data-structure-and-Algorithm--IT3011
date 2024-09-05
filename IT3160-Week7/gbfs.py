import queue
from mymap import myMap, heuristic
from modules import show_result, showStep, showResultWithAttr

def GBFS(start, goal):
    q = queue.deque()
    q.append(start)
    previous = []
    for city in myMap.keys():
        previous.append((city, {'from': None, 'heuristic': heuristic[city]}))
    previous = dict(previous)

    counter = 0
    while True:
        counter += 1
        showStep(counter, q, previous, 'heuristic')
        curCity = q.popleft()
        if curCity == goal:
            print('Success')
            showResultWithAttr(previous, start, goal, 'heuristic')
            return True

        for city in myMap[curCity].keys():
            if city == start:
                continue
            if previous[city]['from'] is None:
                q.append(city)
                previous[city]['from'] = curCity

        if len(q) == 0:
            print('Failed')
            return False



