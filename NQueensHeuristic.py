import heapq


class Node:
    def __init__(self, state, parent=None, action=None, path_cost=0):
        self.state = state
        self.parent = parent
        self.action = action
        self.path_cost = path_cost
        self.depth = 0
        if parent is not None:
            self.depth = parent.depth + 1
        self.heuristic = 0

    def child_node(self, problem, action):
        next_state = problem.result(self.state, action)
        return Node(next_state, parent=self, action=action, path_cost=self.path_cost + 1)

    def expand(self, problem):
        self.children = []
        for action in problem.actions(self.state):
            self.children.append(self.child_node(problem, action))
        return self.children

    def __lt__(self, other):
        return (self.path_cost + self.heuristic) < (other.path_cost + other.heuristic)


class NQueensProblem:
    def __init__(self, N):
        self.initial = tuple([-1] * N)
        self.N = N

    def actions(self, state):
        if state[-1] != -1:
            return []
        col = state.index(-1)
        return [row for row in range(self.N) if not self.conflicted(state, row, col)]

    def result(self, state, row):
        col = state.index(-1)
        new = list(state[:])
        new[col] = row
        return tuple(new)

    def conflicted(self, state, row, col):
        for c in range(col):
            if self.conflict(row, col, state[c], c):
                return True
        return False

    def conflict(self, row1, col1, row2, col2):
        if row1 == row2 or col1 == col2:
            return True
        if row1 - col1 == row2 - col2 or row1 + col1 == row2 + col2:
            return True
        return False

    def heuristic(self, state):
        h = 0
        for i in range(len(state)):
            for j in range(i + 1, len(state)):
                if not self.conflict(state[i], i, state[j], j):
                    h += 1
        return h

    def is_goal(self, state):
        return -1 not in state


def AStarSearch(problem):
    node = Node(problem.initial)
    node.heuristic = problem.heuristic(node.state)  # Set heuristic value
    frontier = []
    heapq.heappush(frontier, (node.path_cost + node.heuristic, node))
    explored = set()

    while frontier:
        _, node = heapq.heappop(frontier)

        if problem.is_goal(node.state):
            return node

        explored.add(node.state)

        for child in node.expand(problem):
            if child.state not in explored:
                child.heuristic = problem.heuristic(child.state)
                heapq.heappush(frontier, (child.path_cost + child.heuristic, child))
                explored.add(child.state)

    return None


if __name__ == '__main__':
    N = 12  # Number of queens
    problem = NQueensProblem(N)
    solution_node = AStarSearch(problem)

    if solution_node:
        solution = solution_node.state
        for i in range(N):
            print(" ".join("Q" if col == solution[i] else "." for col in range(N)))
    else:
        print("No solution found")
