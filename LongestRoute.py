global n,m
used = [False] * (100)
marked = [[False for _ in range (100)] for _ in range (100)]
ans = 0
def Try(u, cnt):
    global ans
    for x in adj[u]:
        if marked[u][x] == False and marked[x][u] == False:
            marked[u][x] = marked[x][u] = True
            Try(x, cnt + 1)
            marked[x][u] = marked[u][x] = False
    ans = max(ans, cnt)

if __name__ == "__main__":
    n, m = map(int, input().split())
    adj = {i: [] for i in range(0, n)}
    for _ in range (m):
        x, y = map(int, input().split())
        adj[x].append(y)
        adj[y].append(x)
    for i in range (n):
        marked = [[False]*(100) for _ in range (100)]
        Try(i, 0)
    print(ans)


