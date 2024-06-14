class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def build_tree(edges):
    nodes = {}
    for edge in edges:
        u, v, direction = edge
        if u not in nodes:
            nodes[u] = Node(u)
        if v not in nodes:
            nodes[v] = Node(v)
        if direction == 'L':
            nodes[u].left = nodes[v]
        elif direction == 'R':
            nodes[u].right = nodes[v]
    root_key = edges[0][0]
    return nodes[root_key],nodes
def count_leaves(node):
    if node is None:
        return 0
    if node.left is None and node.right is None:
        return 1
    return count_leaves(node.left) + count_leaves(node.right)

if __name__ == '__main__':
    N = int(input())
    edges = []
    lst = list(map(str, input().split()))
    index = 0
    while index < (N - 1) * 3:
        u = lst[index]
        v = lst[index + 1]
        direction = lst[index + 2]
        edges.append((u, v, direction))
        index += 3

    root, nodes = build_tree(edges)
    leaves = count_leaves(root)
    print(leaves)





