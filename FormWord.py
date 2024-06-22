from collections import defaultdict
global n, m, matrix, Word
paths = [[-1, 0], [1, 0], [0, 1], [0, -1]]
def insize(i: int, j: int):
    return 0 <= i < n and 0 <= j < m
check = 0
visited = set()
def backtrack(i: int, j: int, word):
    global check
    # print(word)
    if check == 1:
        return
    if word == Word:
        check = 1
        return
    visited.add((i,j))
    for path in paths:
        i1 = i + path[0]
        j1 = j + path[1]
        if insize(i1, j1) and (i1, j1) not in visited:
            backtrack(i1, j1, word + matrix[i1][j1])

    visited.remove((i,j))
if __name__ == '__main__':
    n, m = map(int, input().split())
    matrix = []
    for i in range(n):
        lst = list(input().strip())
        matrix.append(lst)
    Word = input()
    for i in range(n):
        for j in range(m):
            backtrack(i, j, matrix[i][j])
    if check == 1:
        print('YES')
    else:
        print('NO')
