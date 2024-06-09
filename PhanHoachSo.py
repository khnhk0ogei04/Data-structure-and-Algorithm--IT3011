
from math import *
result = []
def phan_hoach(N):
    phan_hoach_main(N, [])
    return result
def phan_hoach_main(N, current):
    if N == 0:
        result.append(current)
    for i in range (1, N + 1):
        phan_hoach_main(N - i, current + [i])

if __name__ == "__main__":
    N = int(input("Enter N: "))
    phan_hoach_result = phan_hoach(N)
    for sub in phan_hoach_result:
        print(sub)
