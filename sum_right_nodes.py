def read_input():
    T = int(input())
    test_cases = []
    for _ in range (T):
        N = int(input())
        edges = []
        for _ in range (N):
            u, v, x = input().split()
            u, v = int(u), int(v)
            edges.append((u, v, x))
        test_cases.append(edges)
    return test_cases

def build_tree(edges):
    tree = {}
    for u, v, x in edges:
        if u not in tree:
            tree[u] = (None, None)
        if v not in tree:
            tree[v] = (None, None)
        if x == 'L':
            tree[u] = (v, tree[u][1])
        elif x == 'R':
            tree[u] = (tree[u][0], v)
    return tree
def sum_right_leaves(tree, root):
    stack = [(root, False)]
    sum = 0
    while stack:
        node, is_right = stack.pop()
        left, right = tree.get(node, (None, None))
        if is_right and left is None and right is None:
            sum += node
        if right is not None:
            stack.append((right, True))
        if left is not None:
            stack.append((left, False))
    return sum
if __name__ == '__main__':
    test_cases = read_input()
    results = []
    for edges in test_cases:
        root = edges[0][0]
        tree = build_tree(edges)
        sum = sum_right_leaves(tree, root)
        results.append(sum)
    for result in results:
        print(result)




