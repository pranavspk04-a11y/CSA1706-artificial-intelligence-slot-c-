BFS(graph, start):
    create an empty queue Q
    create an empty set visited
    create an empty list order

    add start to visited
    enqueue start into Q

    while Q is not empty:
        node = dequeue from Q
        add node to order

        for each neighbor of node:
            if neighbor is not in visited:
                add neighbor to visited
                enqueue neighbor into Q

    return order
BFS(graph, start):
    create an empty queue Q
    create an empty set visited
    create an empty list order

    add start to visited
    enqueue start into Q

    while Q is not empty:
        node = dequeue from Q
        add node to order

        for each neighbor of node:
            if neighbor is not in visited:
                add neighbor to visited
                enqueue neighbor into Q

    return orderBFS(graph, start):
    create empty set visited
    create empty queue Q
    create empty list order

    add start to visited
    enqueue start into Q

    while Q is not empty:
        node = dequeue from Q
        append node to order

        for each neighbour of node in graph[node]:
            if neighbour not in visited:
                add neighbour to visited
                enqueue neighbour into Q

    return orderDFS(graph, node, visited, order):
    add node to visited
    append node to order

    for each neighbour of node in graph[node]:
        if neighbour not in visited:
            DFS(graph, neighbour, visited, order)

    return order

main:
    visited = empty set
    order = empty list
    DFS(graph, start, visited, order)
    
water jug problem Pseudocode:start at (8, 0, 0)
repeat:
    try pouring any jug into any other jug
    (pour until the source is empty or the target is full)
    skip any state you've already seen
until first two jugs both hold 4
