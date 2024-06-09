from collections import deque
from math import *
visited = [False for _ in range (1001)]
parent = [None for _ in range (1001)]
def bfs(graph, start, end):
    visited[start] = True
    queue = deque([start])
    while queue:
        current = queue.popleft()
        for neighbor in graph[current]:
            if visited[neighbor] == False:
                visited[neighbor] = True
                queue.append(neighbor)
                parent[neighbor] = current
    if not visited[end]:
        return -1
    path = []
    current = end
    while current is not None:
        path.append(current)
        current = parent[current]
    path.reverse()
    return path
if __name__ == "__main__":
    V, E, start, end  = map(int, input().split())
    graph = {i: [] for i in range(1, V + 1)}
    for i in range(E):
        x, y = map(int, input().split())
        graph[x].append(y)
    result = bfs(graph, start, end)
    if result == -1:
        print("-1")
    else:
        print(result)



