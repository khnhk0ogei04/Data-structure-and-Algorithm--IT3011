visited = [False for _ in range(1001)]
parent = [None for _ in range(1001)]
found_path = []
def dfs(graph, current, target):
    if current == target:
        visited[current] = True
        while parent[target] != -1:
            found_path.append(target)
            target = parent[target]
        found_path.append(target)
        found_path.reverse()
        return
    
    visited[current] = True
    for neighbor in graph[current]:
        if not visited[neighbor]:
            parent[neighbor] = current
            dfs(graph, neighbor, target)
            if found_path: 
                return

if __name__ == '__main__':
    T = int(input())
    results = []

    for _ in range(T):
        V, E, start, end = map(int, input().split())
        graph = {i: [] for i in range(1, V + 1)}

        for _ in range(E):
            u, v = map(int, input().split())
            graph[u].append(v)
        visited = [False for _ in range(1001)]
        parent = [None for _ in range(1001)]
        found_path = []
        parent[start] = -1
        dfs(graph, start, end)
        if found_path:
            results.append(" ".join(map(str, found_path)))
        else:
            results.append("-1")
    for result in results:
        print(result)
