from collections import deque

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


def bfs(graph, start):
    """Breadth-first search: visit level by level using a queue."""
    visited = {start}
    queue = deque([start])
    order = []

    while queue:
        node = queue.popleft()
        order.append(node)
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    return order


if __name__ == "__main__":
    print("BFS:", " -> ".join(map(str, bfs(graph, 1))))
