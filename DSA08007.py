
def count_numbers(n : int):
    queue = [1]
    count = 0
    while queue:
        top = queue.pop(0)
        if top < n:
            count += 1
            queue.append(top * 10)
            queue.append(top * 10 + 1)
    return count

if __name__ == '__main__':
    T = int(input())
    for i in range(T):
        n = int(input())
        print(count_numbers(n))
