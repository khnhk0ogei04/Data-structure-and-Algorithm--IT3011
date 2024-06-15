from collections import deque
def can_color(v, c, color, graph):
    for neighbor in graph[v]:
        if color[neighbor] == c:
            return False
    return True
def graph_coloring(v, n, M, color, graph):
    if v == n + 1:
        return True
    for c in range (1, M + 1):
        if can_color(v, c, color, graph):
            color[v] = c
            if graph_coloring(v + 1, n, M, color, graph):
                return True
            color[v] = 0
    return False

if __name__ == '__main__':
    V, E, M = map(int, input().split())
    graph = {i: [] for i in range(1, V + 1)}
    for i in range(E):
        x, y = map(int, input().split())
        graph[x].append(y)
        graph[y].append(x)
    color = [0] * (V + 1)
    if graph_coloring(1, V, M, color, graph):
        print("YES")
    else:
        print("NO")


