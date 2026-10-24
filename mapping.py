regions = ["A", "B", "C"]
colours = ["Red", "Green", "Blue"]

# every region is a neighbour of the other two
neighbours = {
    "A": ["B", "C"],
    "B": ["A", "C"],
    "C": ["A", "B"],
}

assigned = {}

def is_safe(region, colour):
    # safe if no neighbour already uses this colour
    for n in neighbours[region]:
        if assigned.get(n) == colour:
            return False
    return True

def colour_map(i):
    if i == len(regions):
        return True                      # all regions coloured

    region = regions[i]
    for colour in colours:
        if is_safe(region, colour):
            assigned[region] = colour    # try this colour
            if colour_map(i + 1):
                return True
            del assigned[region]         # backtrack
    return False

if colour_map(0):
    for region, colour in assigned.items():
        print(region, "=", colour)
else:
    print("No solution")
