def minimax(node, is_max):
    # a number means it's a leaf
    if isinstance(node, int):
        return node

    values = [minimax(child, not is_max) for child in node]
    return max(values) if is_max else min(values)

# root is MAX, with two MIN children
tree = [[3, 5], [2, 9]]
print(minimax(tree, True))
