from collections import deque

cap = (8, 5, 3)
queue = deque([((8, 0, 0), [(8, 0, 0)])])
seen = {(8, 0, 0)}

while queue:
    s, path = queue.popleft()
    if s[0] == 4 and s[1] == 4:
        print(path)
        break
    for i in range(3):
        for j in range(3):
            if i != j:
                p = min(s[i], cap[j] - s[j])
                n = list(s)
                n[i] -= p
                n[j] += p
                n = tuple(n)
                if p and n not in seen:
                    seen.add(n)
                    queue.append((n, path + [n]))
