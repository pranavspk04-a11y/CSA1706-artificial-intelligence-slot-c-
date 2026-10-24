import heapq

graph = {"S": {"A": 2, "B": 4}, "A": {"G": 5}, "B": {"G": 2}, "G": {}}
h = {"S": 4, "A": 3, "B": 1, "G": 0}

pq = [(h["S"], 0, "S", ["S"])]
best = {}

while pq:
    f, g, node, path = heapq.heappop(pq)
    if node == "G":
        print(path, g)
        break
    if node in best and best[node] <= g:
        continue
    best[node] = g
    for nxt, cost in graph[node].items():
        heapq.heappush(pq, (g + cost + h[nxt], g + cost, nxt, path + [nxt]))
