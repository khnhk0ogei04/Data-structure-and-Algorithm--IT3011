from collections import deque
paths = [[-1,-1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
global n, m, matrix
def insize(x, y):
    return 0 <= x < n and 0 <= y < m
def bfs(i, j):
    queue = deque([(i, j)])
    visited[i][j] = True
    while queue:
        i, j = queue.popleft()
        for path in paths:
            i1 = i + path[0]
            j1 = j + path[1]
            if insize(i1, j1) and visited[i1][j1] == False and matrix[i1][j1] == ".":
                queue.append((i1, j1))
                visited[i1][j1] = True

if __name__ == '__main__':
    count = 0
    n, m = map(int, input().split())
    visited = [[False for _ in range(m)] for _ in range(n)]
    matrix = []
    for _ in range(n):
        lst = input().strip()
        matrix.append(lst)

    for i in range(n):
        for j in range(m):
            if matrix[i][j] == "." and not visited[i][j]:
                bfs(i, j)
                count += 1

    print(count)
