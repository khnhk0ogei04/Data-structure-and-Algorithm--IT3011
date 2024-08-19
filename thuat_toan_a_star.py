from heapq import heappush, heappop
def heuristic(a: tuple, b: tuple):
    return abs(a[0] - b[0]) + abs(a[1] - b[1])
def a_star_search(start: tuple, goal: tuple, grid):
    rows = len(grid)
    cols = len(grid[0])
    open_list = []
    closed_list = set()
    heappush(open_list, (heuristic(start, goal) + 0, 0,  start, []))
    while open_list:
        f,g,current,path = heappop(open_list)
        if current in closed_list:
            continue
        path = path + [current]
        if current == goal:
            return path
        closed_list.add(current)
        for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
            neighbor = current[0] + dx, current[1] + dy
            if 0 <= neighbor[0] < rows and 0 <= neighbor[1] < cols and grid[neighbor[0]][neighbor[1]] == 0:
                if neighbor not in closed_list:
                    new_g = g + 1
                    heappush(open_list, (heuristic(neighbor, goal) +  new_g, new_g, neighbor, path))

    return None


# Lưới ô vuông (0: đường đi, 1: chướng ngại vật)
grid = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 0, 1, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    [0, 1, 1, 1, 1, 1, 1, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 1, 0, 1, 0],
    [0, 1, 1, 1, 1, 0, 1, 0, 1, 0],
    [0, 0, 0, 0, 1, 0, 1, 0, 0, 0],
    [1, 1, 1, 0, 1, 1, 1, 0, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 1, 1, 1, 1, 1, 1, 0]
]

# Điểm bắt đầu và đích
start = (0, 0)
goal = (9, 9)

# Tìm đường đi
path = a_star_search(start, goal, grid)
print("Path:", path)

