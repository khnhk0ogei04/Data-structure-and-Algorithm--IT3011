from collections import deque
def bfs(graph, start):
    queue = deque([start])
    distances = {start: 0}
    while queue:
        current = queue.popleft()
        for neighbour in graph[current]:
            if neighbour not in distances:
                queue.append(neighbour)
                distances[neighbour] = distances[current] + 1

    return distances
if __name__ == '__main__':
    n = int(input())
    graph = {i: [] for i in range (1, n + 1)}
    for _ in range (n - 1):
        a, b = map(int, input().split())
        graph[a].append(b)
        graph[b].append(a)
    distances = bfs(graph, 1)
    farthest = 0
    for distance in distances:
        if distances[distance] > farthest:
            farthest = distances[distance]

    print(farthest)



