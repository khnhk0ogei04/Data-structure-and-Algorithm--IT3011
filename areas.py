from collections import deque
paths = [[-1, 0], [0, 1], [1, 0], [0, -1]]
global n, m
def insize(i: int, j: int):
    return 0 <= i < n and 0 <= j < m
def bfs(a, b):
    queue = deque([(a, b)])
    visited[a][b] = True
    area = 1
    while queue:
        x, y = queue.popleft()
        for dx, dy in paths:
            x1 = x + dx
            y1 = y + dy
            if insize(x1, y1) and matrix[x1][y1] == '*' and not visited[x1][y1]:
                visited[x1][y1] = True
                queue.append((x1, y1))
                area += 1
    return area


if __name__ == '__main__':
    n, m = map(int, input().split())
    matrix = []
    for _ in range(n):
        row = input().strip()
        matrix.append(row)

    visited = [[False] * m for _ in range(n)]
    areas = []

    for i in range(n):
        for j in range(m):
            if matrix[i][j] == '*' and not visited[i][j]:
                areas.append(bfs(i, j))

    areas.sort()
    print(*areas)
