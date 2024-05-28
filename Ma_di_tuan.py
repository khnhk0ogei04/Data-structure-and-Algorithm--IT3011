paths = [[1, 2], [1, -2], [2, 1], [2, -1], [-1, 2], [-1, -2], [-2, -1], [-2, 1]]

def print_sol():
    for i in range(1, n * n + 1):
        print(f"({X[i]}, {Y[i]})", end=' ')
    print()

def insize(x, y):
    return 1 <= x <= n and 1 <= y <= n

def Try(k: int):
    for path in paths:
        xx = X[k - 1] + path[0]
        yy = Y[k - 1] + path[1]
        if insize(xx, yy) and not mark[xx][yy]:
            X[k] = xx
            Y[k] = yy
            mark[xx][yy] = True
            if k == n * n:
                print_sol()
                return True
            else:
                if Try(k + 1):
                    return True
            mark[xx][yy] = False
    return False
                
if __name__ == "__main__":
    n = int(input("Nhập kích thước bàn cờ: "))
    X = [0 for _ in range(n * n + 1)]
    Y = [0 for _ in range(n * n + 1)]
    mark = [[False for _ in range(n + 1)] for _ in range(n + 1)]
    X[1] = Y[1] = 1
    mark[1][1] = True
    if not Try(2):
        print("Không tìm thấy giải pháp")
