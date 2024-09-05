import queue
from mymap import myMap, heuristic
from modules import show_result, showStep

def AStar(start, goal):
    q = queue.deque()
    q.append(start)

    previous = []
    for city in myMap.keys():
        previous.append((city, {'from': None, 'total_cost': heuristic[city]}))
    previous = dict(previous)

    counter = 0
    while q:
        counter += 1
        showStep(counter, q, previous)
        curCity = q.popleft()

        if curCity == goal:
            print('Success!')
            return True
        curCityTotalCost = previous[curCity]['total_cost'] - heuristic[curCity]
        # g = f - h

        if curCity != goal:
            for city in myMap[curCity].keys():
                cityTotalCost = previous[city]['total_cost']
                totalCost = myMap[curCity][city]['cost'] + curCityTotalCost + heuristic[curCity]
                if city == start:
                    continue
                if previous[city]['from'] == None or totalCost < cityTotalCost:
                    if q.count(city) > 0:
                        q.remove(city)
                    q.append(city)
                    previous[city]['from'] = curCity
                    previous[city]['total_cost'] = totalCost

        if len(q) == 0:
            print('No path found!')
            return False

