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
