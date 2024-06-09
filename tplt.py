visited = set()
def dfs(graph, start):
    visited.add(start)
    for neighbor in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor)

if __name__ == "__main__":
    V, E = list(map(int, input().split()))
    graph = {i: [] for i in range(1, V + 1)}
    for i in range(E):
        x, y = map(int, input().split())
        graph[x].append(y)
        graph[y].append(x)
    count = 0
    for i in range(1, V + 1):
        if i not in visited:
            dfs(graph, i)
            count += 1
    print(count)
