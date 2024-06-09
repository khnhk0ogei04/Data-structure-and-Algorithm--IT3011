from collections import deque
def change_to_coordinates(pos):
    col, row = pos[0], pos[1]
    return ord(col) - ord('a'), int(row) - 1
def insize(x, y):
    return 0 <= x < 8 and 0 <= y < 8
knight_moves = [[-2,-1],[-1,-2],[-2,1],[-1,2],[1,-2],[1,2],[2,-1],[2,1]]
def min_moves():
    global start,end
    start = change_to_coordinates(start)
    end = change_to_coordinates(end)
    if (start[0] == end[0] and start[1] == end[1]):
        return 0
    queue = deque([(start[0], start[1], 0)])
    visited = set()
    visited.add((start[0], start[1]))
    while queue:
        x, y, steps = queue.popleft()
        if (x, y)  == end:
            return steps
        for move in knight_moves:
            new_x, new_y = x + move[0], y + move[1]
            if insize(new_x, new_y) and (new_x, new_y) not in visited:
                visited.add((new_x, new_y))
                queue.append((new_x, new_y, steps + 1))
    return -1

if __name__ == '__main__':
    lst = list(map(str, input().split()))
    start = (lst[0], lst[1])
    end = (lst[2], lst[3])
    print(min_moves())
