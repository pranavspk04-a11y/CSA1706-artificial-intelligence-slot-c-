# Tree from the drawing (adjacency list, children listed left to right)
graph = {
    1: [2, 7],
    2: [3, 6],
    3: [4, 5],
    4: [],
    5: [],
    6: [],
    7: [8, 10],
    8: [9],
    9: [],
    10: [],
}


def dfs(graph, start, visited=None, order=None):
    """Depth-first search (recursive): go as deep as possible before backtracking."""
    if visited is None:
        visited = set()
    if order is None:
        order = []

    visited.add(start)
    order.append(start)
    for neighbor in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited, order)
    return order


def dfs_iterative(graph, start):
    """Depth-first search using an explicit stack."""
    visited = set()
    stack = [start]
    order = []

    while stack:
        node = stack.pop()
        if node in visited:
            continue
        visited.add(node)
        order.append(node)
        # push children in reverse so the leftmost child is processed first
        for neighbor in reversed(graph[node]):
            if neighbor not in visited:
                stack.append(neighbor)
    return order


if __name__ == "__main__":
    print("DFS:", " -> ".join(map(str, dfs(graph, 1))))
    print("DFS (iterative):", " -> ".join(map(str, dfs_iterative(graph, 1))))
