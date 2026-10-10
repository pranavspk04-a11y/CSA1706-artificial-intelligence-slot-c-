def dfs(graph, start):
    visited = set()
    stack = [start]
    order = []

    while stack:
        node = stack.pop()          # take from the top (LIFO)

        if node not in visited:
            visited.add(node)
            order.append(node)

            for neighbour in graph[node]:
                if neighbour not in visited:
                    stack.append(neighbour)

    return order


graph = {
    0: [1],
    1: [3],
    2: [1],
    3: [2, 4],
    4: [5],
    5: [7],
    6: [4],
    7: [6],
}

print(" -> ".join(map(str, dfs(graph, 0))))
