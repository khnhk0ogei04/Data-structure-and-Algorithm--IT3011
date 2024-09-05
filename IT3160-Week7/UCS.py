import queue
from mymap import myMap
from modules import showResultWithAttr, showStep
def UCS(start, goal):
    q = queue.deque()
    q.append(start)

    previous = []
    for city in myMap.keys():
        previous.append((city, {'from': None, 'total_cost': 0}))
    previous = dict(previous)

    counter = 0
    while len(q) > 0:
        counter += 1
        showStep(counter, q, previous)
        curCity = q.popleft()
        curCityTotalCost = previous[curCity]['total_cost']
        if curCity != goal:
            for city in myMap[curCity].keys():
                if city == start:
                    continue
                cityTotalCost = previous[city]['total_cost']
                totalCost = curCityTotalCost + myMap[curCity][city]['cost']
                print(curCity, city, previous[city]['from'], cityTotalCost, totalCost)
                if previous[city]['from'] is None or totalCost < cityTotalCost:
                    if q.count(city) != 0:
                        q.remove(city)
                    q.append(city)
                    previous[city]['from'] = curCity
                    previous[city]['total_cost'] = totalCost

        else:
            showResultWithAttr(previous, start, goal)
            return True

    return False
