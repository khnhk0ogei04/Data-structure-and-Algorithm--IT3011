def ql(cntSub, acc):
    global sum, ok, n, K, arr, used
    if cntSub == K:
        ok = True
        return
    if ok:
        return
    for i in range(n):
        if not used[i]:
            used[i] = True
            if acc + arr[i] == sum:
                ql(cntSub + 1, 0)
            elif acc + arr[i] < sum:
                ql(cntSub, acc + arr[i])
            used[i] = False
            if acc == 0:
                break

def inp():
    global sum, ok, n, K, arr, used
    n, K = map(int, input().split())
    arr = list(map(int, input().split()))
    sum_arr = sum(arr)
    if sum_arr % K != 0:
        print('0')
        return
    sum = sum_arr // K
    used = [False] * n
    ok = False
    ql(0, 0)
    print('1' if ok else '0')

def main():
    t = int(input())
    for _ in range(t):
        inp()
            
if __name__ == "__main__":
    main()
