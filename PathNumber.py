from collections import deque
from math import *
primes = []
check = [True] * (10001)
def Era():
    check[0] = check[1] = False
    for i in range (2, isqrt(10001) + 1):
        if check[i] == True:
            for j in range (i * i, 10001, i):
                check[j] = False
    for i in range (2, 10001):
        if check[i]:
            primes.append(i)
            
def get_neighbors(n: int):
    lst = list(str(n))
    neighbors = []
    for i in range (4):
        original_digit = lst[i]
        # print(number)
        for digit in range (0, 10):
            digit_str = str(digit)
            if original_digit != digit_str:
                lst[i] = digit_str
                str_num = ''.join(lst)
                new_num = int(str_num)
                if (new_num >= 1000 and new_num <= 9999 and new_num in primes):
                    neighbors.append(new_num)
                
        lst[i] = original_digit
    return neighbors
def count_steps(current, target):
    queue = deque([(current, 0)])
    visited = set()
    visited.add(current)
    
    while queue:
        temp = queue.popleft()
        num = temp[0]
        step = temp[1]
        if num == target:
            return step
        if (get_neighbors(num)):
            for x in get_neighbors(num):
                if x not in visited:
                    visited.add(x)
                    queue.append((x, step + 1))
    return -1       

if __name__ == "__main__":
    Era()
    T = int(input())
    for _ in range (T):
        S, T = map(int, input().split())
        print(count_steps(S, T))
