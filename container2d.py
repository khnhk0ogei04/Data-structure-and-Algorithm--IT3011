from math import *
MAXN = 31
global H,W,n
h = [0]* MAXN
w = [0]* MAXN
res = 0
busy =[[False for _ in range (MAXN)] for _ in range (MAXN)]
def check(i, j, k) -> bool:
    for u in range (i, i + k):
        for v in range(j, j + k):
            if (busy[u][v]):
                return False
    return True
def marked(i,j,k,s):
    for u in range (i, i + w[k]):
        for v in range (j, j + h[k]):
            busy[u][v] = s

def Try(k):
    global res
    if res == 1:
        return
    for i in range (0, W - w[k] + 1):
        for j in range (0, H - h[k] + 1):
            if (check(i,j,k)):
                marked(i,j,k,1)
                if (k == n):
                    res = 1
                else:
                    Try(k + 1)
                marked(i,j,k,0)

if __name__ == "__main__":
    H, W = map(int, input().split())
    n = int(input())
    for i in range (n):
        h[i], w[i] = map(int, input().split())
    Try(1)
    if res:
        print('1')
    else:
        print('0')



