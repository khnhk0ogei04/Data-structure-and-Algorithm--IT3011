
import queue
n, m, r, c = map(int, input().split())
matrix = []
def insize_matrix(i, j):
    return 0 <= i < n and 0 <= j < m

moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]
def inp():
    for i in range (n):
        lst = list(map(int, input().split()))
        matrix.append(lst)
def __eq__(a: tuple, b: tuple) -> bool:
    return a[0] == b[0] and a[1] == b[1] and a[2] == b[2]

def main():
    q = [(r, c, 0)]
    visited = set()
    while len(q) > 0:
        state = q.pop(0)
        row, col, distance = state
        if row == 0 or row == n - 1 or col == 0 or col == m - 1:
            return distance + 1
        for move in moves:
            new_row, new_col = row + move[0], col + move[1]
            if insize_matrix(new_row, new_col) and matrix[new_row][new_col] == 0 and (new_row, new_col) not in visited:
                q.append((new_row, new_col, distance + 1))
                visited.add((new_row, new_col))

    return -1

if __name__ == '__main__':
    inp()
    r = r - 1
    c = c - 1
    print(main())
