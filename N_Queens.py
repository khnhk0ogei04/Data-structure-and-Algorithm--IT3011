from math import *
global N, matrix
def print_solution():
    for i in range (N):
        for j in range (N):
            print(matrix[i][j], end = ' ')
        print()

def is_safe(row, col):
    for i in range (row):
        if matrix[i][col]:
            return False

    for j in range (col):
        if matrix[row][j]:
            return False

    i, j = row, col
    while i >= 0 and j >= 0:
        if matrix[i][j]:
            return False
        i -= 1
        j -= 1

    i, j = row, col
    while i < N and j >= 0:
        if matrix[i][j]:
            return False
        i += 1
        j -= 1

    return True
def solve(col):
    if col >= N:
        print_solution()
        return
    for i in range(N):
        if is_safe(i, col):
            matrix[i][col] = 1
            solve(col + 1)
            matrix[i][col] = 0

if __name__ == '__main__':
    global N, matrix
    N = int(input())
    matrix = [[0 for _ in range (N)] for _ in range (N)]
    solve(0)


