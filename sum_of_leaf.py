class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
    def __getitem__(self):
        return self.data

def buildTree(edges):
    nodes = {}
    for u, v, direction in edges:
        if u not in nodes:
            nodes[u] = Node(u)
        if v not in nodes:
            nodes[v] = Node(v)
        if direction == 'L':
            nodes[u].left = nodes[v]
        if direction == 'R':
            nodes[u].right = nodes[v]

    return nodes

max_sum = -float('inf')
def find_max_sum(root):
    global max_sum
    # print(max_sum)
    # if root is None:
    #     return 0
    # left_sum = find_max_sum(root.left)
    # right_sum = find_max_sum(root.right)
    # if root.left is None and root.right is None:
    #     return root.data
    # if root.left and root.right:
    #     total = root.data + left_sum + right_sum
    #     if total > max_sum:
    #         max_sum = total
    #     return max(left_sum, right_sum) + root.data
    #
    # if root.left is not None and root.right is None:
    #     return left_sum + root.data
    # if root.right is not None and root.left is None:
    #     return right_sum + root.data
    if root is None:
        return 0
    sum_left = find_max_sum(root.left)
    sum_right = find_max_sum(root.right)
    if root.left and root.right:
        total = sum_left + sum_right + root.data
        if total > max_sum:
            max_sum = total
        return max(sum_left, sum_right) + root.data
    return (sum_left + root.data if root.right is None else sum_right + root.data)

def solve():
    n = int(input())
    edges = []
    for _ in range (n):
        u, v, x = input().split()
        u = int(u)
        v = int(v)
        edges.append([u, v, x])
    tree = buildTree(edges)
    root = tree[edges[0][0]]
    # print(edges[0][0]) print(15)
    find_max_sum(root)
    print(max_sum)

if __name__ == "__main__":
    solve()
