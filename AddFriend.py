from collections import deque
def bfs(graph, start):
    queue = deque([start])
    visited.add(start)
    count = 1
    while queue:
        current = queue.popleft()
        for neighbour in graph[current]:
            if neighbour not in visited:
                visited.add(neighbour)
                queue.append(neighbour)
                count += 1
    return count

if __name__ == '__main__':
    n, m = map(int, input().split())
    graph = {i : [] for i in range(1, n + 1)}
    max_count = 0
    visited = set()
    for _ in range (m):
        a, b = map(int, input().split())
        graph[a].append(b)
        graph[b].append(a)
    for i in range (1, n + 1):
        if i not in visited:
            count = bfs(graph, i)
            if(count > max_count):
                max_count = count
    print(max_count)
