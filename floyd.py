
def floyd(n, graph):
    dist = [[float('inf') for _ in range (n + 1)] for _ in range(n + 1)]
    for i in range(n + 1):
        dist[i][i] = 0

    for u, v, c in graph:
        dist[u][v] = min(dist[u][v], c)
        dist[v][u] = min(dist[v][u], c)

    for k in range(1, n + 1):
        for i in range(1, n + 1):
            for j in range(1, n + 1):
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])

    return dist
if __name__ == '__main__':
    n, m = map(int, input().split())
    graph = []
    for _ in range(m):
        u, v, w = map(int, input().split())
        graph.append((u, v, w))
    dist = floyd(n, graph)
    x, y = map(int, input().split())
    print(dist[x][y])

