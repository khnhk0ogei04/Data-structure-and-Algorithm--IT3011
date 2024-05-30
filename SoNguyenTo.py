from math import *
check = [True]*(201)
check[0] = check[1] = False
primes = []
def Era():
    for i in range (2, isqrt(200) + 1):
        if check[i] == True:
            for j in range(i*i, 201, i):
                check[j] = False
        
    for i in range (2, 201):
        if check[i]:
            primes.append(i)
def init(P, S):
    lst = []
    for i in range(P + 1, S + 1, 1):
        if check[i] == True:
            lst.append(i)
        
    return lst
            
               
def ql(curr_sum, pos, cnt):
    global ans
    # print(tmp, cnt, curr_sum)
    if cnt > N:
        return
    if curr_sum == S and cnt == N:
        ans += 1
        keys.append(tmp[:])
        return
    for j in range (pos, length):
        if used[primes_subset[j]] == False and curr_sum + primes_subset[j] <= S:
            used[primes_subset[j]] = True
            tmp.append(primes_subset[j])
            ql(curr_sum + primes_subset[j], j + 1 , cnt + 1)
            used[primes_subset[j]] = False
            tmp.pop()   
        
if __name__ == "__main__":
    Era()
    T = int(input())
    for _ in range (T):
        used = [False]*(201)
        N, P, S = list(map(int, input().split()))
        primes_subset = init(P,S)
        length = len(primes_subset)
        print(primes_subset)
        ans = 0
        tmp = []
        keys = []
        ql(0, 0 ,0)
        print(ans)
        keys.sort()
        for key in keys:
            print(key)
            
        
        
