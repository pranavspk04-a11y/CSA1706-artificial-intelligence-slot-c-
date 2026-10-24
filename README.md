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
(BFS(graph, start):
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

    return order)

(main:
    visited = empty set
    order = empty list
    DFS(graph, start, visited, order)
    
water jug problem Pseudocode:start at (8, 0, 0)
repeat:
    try pouring any jug into any other jug
    (pour until the source is empty or the target is full)
    skip any state you've already seen
until first two jugs both hold 4)



{A star search} 

open = {S}, g(S) = 0
repeat:
    pick the node in open with the lowest f = g + h
    if it is G: stop, return the path
    for each neighbour:
        newG = g(node) + edge cost
        if newG is better than the neighbour's old g:
            update g, remember the parent, add to open
minimax(node):
    if node is a leaf:
        return its value
[mini max }
 >>>   (if node is MAX:
        best = -infinity
        for each child:
            best = max(best, minimax(child))
        return best

>>>    if node is MIN:
        best = +infinity
        for each child:
            best = min(best, minimax(child))
        return best)

Pseudocode (backtracking):  { Mini mapping}



assign(region):
    if all regions are coloured: return success

    for each colour:
        if no neighbour already has this colour:
            give the region this colour
            if assign(next region) succeeds: return success
            undo the colour (backtrack)

    return failure


