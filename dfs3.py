graph = {
    1: [2, 3],
    2: [1, 5, 6],
    3: [1, 4, 7],
    4: [3, 8],
    5: [2],
    6: [2],
    7: [3, 8],
    8: [4, 7],
}

def dfs(graph, node, visited=None, order=None):
    if visited is None:
        visited, order = set(), []
    visited.add(node)
    order.append(node)
    for nbr in graph[node]:
        if nbr not in visited:
            dfs(graph, nbr, visited, order)
    return order

print("DFS:", dfs(graph, 1))
# DFS: [1, 2, 5, 6, 3, 4, 8, 7]
