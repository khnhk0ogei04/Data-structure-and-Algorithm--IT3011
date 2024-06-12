from math import *
from collections import deque
paths = [[-1, 0], [1, 0], [0, -1], [0, 1]]
def insize(x, y):
    return 0 <= x < n and 0 <= y < m
def bfs(x: int, y: int):
    queue = deque([(x, y)])
    visited[x][y] = True
    perimeter = 0
    while queue:
        x, y = queue.popleft()
        count_neighbors = 0
        for path in paths:
            x1, y1 = x + path[0], y + path[1]
            if insize(x1, y1) and matrix[x1][y1] == 1:
                count_neighbors += 1
                if not visited[x1][y1]:
                    visited[x1][y1] = True
                    queue.append((x1, y1))
        perimeter += 4 - count_neighbors
    return perimeter
if __name__ == '__main__':
    n, m = map(int, input().split())
    matrix = []
    for i in range (n):
        lst = list(map(int, input().split()))
        matrix.append(lst)
    visited = [[False for _ in range(m)] for _ in range(n)]
    perimeters = []
    for i in range(n):
        for j in range(m):
            if matrix[i][j] == 1:
                perimeters.append(bfs(i, j))
    print(max(perimeters))
