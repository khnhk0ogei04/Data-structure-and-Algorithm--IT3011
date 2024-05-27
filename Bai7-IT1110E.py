def divide_equally(arr):
    total = sum(arr)
    if total % 2 != 0:
        return 'NO'
    target_sum = total // 2
    n = len(arr)
    dp = [False] * (target_sum + 1)
    dp[0] = True
    for i in range (n):
        for j in range (target_sum, arr[i] - 1, -1):
            dp[j] = dp[j] or dp[j-arr[i]]
            
    if dp[target_sum] == True:
        return 'YES'
    else:
        return 'NO'
    
if __name__ == "__main__":
    T = int(input())
    for _ in range (T):
        n = int(input())
        arr = list(map(int,input().split()))
        print(divide_equally(arr))
