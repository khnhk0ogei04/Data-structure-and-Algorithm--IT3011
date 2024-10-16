n, m = map(int, input().split())
X = [0 for i in range(n)]
MOD = 10 ** 9 + 7
result = 0

lst = list(map(int, input().split()))
for i in range(n):
    X[i] = lst[i]
    # print(X[i])
    
def Try(k, _sum):
    global result
    if k == n:
        if _sum == m:
            result = (result + 1) % MOD
        return

    for v in range(0, int((m - _sum) / X[k]) + 1):
        Try(k + 1, _sum + v * X[k])

def main():
    Try(0, 0)
    print(result)

if __name__ == '__main__':
    main()

