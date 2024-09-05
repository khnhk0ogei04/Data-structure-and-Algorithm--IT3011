from mymap import myMap
import modules

def DFS(start, goal):
    previous = []
    for city in myMap.keys():
        previous.append((city, None))
    previous = dict(previous)

    def _DFS(_start):
        for city in myMap[_start].keys():
            if previous[city] == None:
                previous[city] = _start
                if city == goal:
                    return True
                elif _DFS(city):
                    return True
        return False

    if (_DFS(start)):
        print('Success!')
        modules.show_result(previous, start, goal)
        return True
    else:
        print('Fail!')
        return False

