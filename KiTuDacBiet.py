from collections import deque
if __name__ == "__main__":
    T = int(input())
    for _ in range (T):
        N = int(input())
        queue = deque([(N, 0)])
        ans = 0
        while(True):
            x, steps = queue.popleft()
            if x == 1:
                ans = steps
                break
            if x % 2 == 0:
                queue.append((x // 2, steps + 1))
            if x % 3 == 0:
                queue.append((x // 3, steps + 1))
            queue.append((x - 1, steps + 1))
        print(ans)


