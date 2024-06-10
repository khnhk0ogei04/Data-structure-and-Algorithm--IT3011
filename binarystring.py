from math import *
binary_string_list = []
def backtrack(n, string: str):
    if n == 0:
        binary_string_list.append(string)
        return
    backtrack(n - 1, string + "0")
    backtrack(n - 1, string + "1")

if __name__ == '__main__':
    N = int(input())
    backtrack(N, "")
    for binary_string in binary_string_list:
        print(binary_string)
        
