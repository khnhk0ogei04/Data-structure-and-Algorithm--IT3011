import queue
from mymap import myMap
from modules import show_result

def BFS(start, goal):
    q = queue.deque()
    q.append(start)

    previous = []
    for city in myMap.keys():
        previous.append((city, None))
    previous = dict(previous)

    while len(q) > 0:
        currCity = q.popleft()
        for city in myMap[currCity].keys():
            if previous[city] == None:
                q.append(city)
                previous[city] = currCity
                if city == goal:
                    print('Success')
                    show_result(previous, start, goal)
                    return True

    print('Failed')
    return False
