from collections import deque
def is_bipartite(graph):
    def bfs(graph, start):
        queue = deque([start])
        colored[start] = 0
        while queue:
            current = queue.popleft()
            for neighbour in graph[current]:
                if colored[neighbour] == -1:
                    colored[neighbour] = 1 - colored[current]
                    queue.append(neighbour)
                elif colored[neighbour] == colored[current]:
                    return False
        return True
    for i in range (1, V + 1):
        if colored[i] == -1:
            if not bfs(graph, i):
                return False
    return True
if __name__ == "__main__":
    V, E = map(int, input().split())
    graph = {i: [] for i in range (1, V + 1)}
    colored = [-1 for i in range(V + 1)]
    for i in range(E):
        x, y = map(int, input().split())
        graph[x].append(y)
        graph[y].append(x)
    if(is_bipartite(graph)):
        print("YES")
    else:
        print("NO")
