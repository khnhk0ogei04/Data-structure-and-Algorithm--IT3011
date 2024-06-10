from collections import deque
def check_cycle_bfs(n, edges):
    graph = {i : [] for i in range(1, N + 1)}
    for _ in range (edges):
        x, y = map(int, input().split())
        graph[x].append(y)
        graph[y].append(x)
    visited = [False] * (N + 1)
    parent = [-1 for _ in range(N + 1)]
    for start in range (1, N + 1):
        if not visited[start]:
            visited[start] = True
            queue = deque([start])
            while queue:
                u = queue.popleft()
                for v in graph[u]:
                    if not visited[v]:
                        visited[v] = True
                        parent[v] = u
                        queue.append(v)
                    elif parent[u] != v:
                        return 1

    return 0

if __name__ == '__main__':
    N, edges = map(int, input().split())
    print(check_cycle_bfs(N, edges))
