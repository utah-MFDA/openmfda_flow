import math
import heapq

import numpy

# Define the Cell class


class BlockedPathException(Exception):
    pass


class Cell:
    def __init__(self):
        self.parent_i = 0  # Parent cell's row index
        self.parent_j = 0  # Parent cell's column index
        self.f = float('inf')  # Total cost of the cell (g + h)
        self.g = float('inf')  # Cost from start to this cell
        self.h = 0  # Heuristic cost from this cell to destination

    def pt(self):
        if hasattr(self, 'parent_k'):
            return [self.parent_i, self.parent_j, self.parent_k]
        else:
            return [self.parent_i, self.parent_j]


class AStr_grid:
    def __init__(self, row, col, layer):
        self.row = row
        self.col = col
        self.lay = layer
        self._grid = []
        cell_details = [[[Cell() for _ in range(LAY)]
                         for _ in range(COL)] for _ in range(ROW)]

    def print_grid(self):
        print('[')
        for i in self._grid:
            for j in i:
                for k in k:
                    pass


# Define the size of the grid
R = 9
C = 10

# Check if a cell is valid (within the grid)


def is_valid(row, col, lay=None):
    if lay is None:
        return (row >= 0) and (row < ROW) and (col >= 0) and (col < COL)
    else:
        return (row >= 0) and (row < ROW) and \
            (col >= 0) and (col < COL) and \
            (lay >= 0) and (lay < LAY)
        # return (row >= 0) and (row < ROW) and \
        # (col >= 0) and (col < COL) and \
        # (lay >= 0) and (lay < LAY)


# Check if a cell is unblocked
def is_unblocked(grid, row, col, lay=None):
    if lay is None:
        return grid[row][col] == 1
    else:
        return grid[row][col][lay] == 1

# Check if a cell is the destination


def is_destination(dest, row, col, lay=None):
    if lay is None:
        return row == dest[0] and col == dest[1]
    else:
        return row == dest[0] and col == dest[1] and lay == dest[2]

# Calculate the heuristic value of a cell (Euclidean distance to destination)


def calculate_h_value(dest, row, col, lay=None):
    if lay is None:
        return ((row - dest[0]) ** 2 + (col - dest[1]) ** 2) ** 0.5
    else:
        return ((row - dest[0]) ** 2 + (col - dest[1]) ** 2 + (lay - dest[2]) ** 2) ** 0.5

# Trace the path from source to destination


def trace_path(cell_details, dest):
    print("The Path is ")
    path = []
    if len(dest) == 2:
        row = dest[0]
        col = dest[1]

        # Trace the path from destination to source using parent cells
        while not (cell_details[row][col].parent_i == row and cell_details[row][col].parent_j == col):
            path.append((row, col))
            temp_row = cell_details[row][col].parent_i
            temp_col = cell_details[row][col].parent_j
            row = temp_row
            col = temp_col

        # Add the source cell to the path
        path.append((row, col))
    elif len(dest) == 3:
        row = dest[0]
        col = dest[1]
        lay = dest[2]

        # Trace the path from destination to source using parent cells
        #fmt: off
        while not (cell_details[row][col][lay].parent_i == row and \
                    cell_details[row][col][lay].parent_j == col and \
                    cell_details[row][col][lay].parent_k == lay):
        #fmt: on
            path.append((row, col, lay))
            temp_row = cell_details[row][col][lay].parent_i
            temp_col = cell_details[row][col][lay].parent_j
            temp_lay = cell_details[row][col][lay].parent_k
            row = temp_row
            col = temp_col
            lay = temp_lay
        # Add the source cell to the path
        path.append((row, col, lay))

    # Reverse the path to get the path from source to destination
    path.reverse()

    # Print the path
    for i in path:
        print("->", i, end=" ")
    print()
    return path

# Implement the A* search algorithm


def a_star_search(grid, src, dest):

    # get grid size
    if 'ROW' in globals():
        global ROW
    if 'COL' in globals():
        global COL

    if isinstance(grid, numpy.ndarray):
        if len(grid.shape) == 2:
            ROW, COL = grid.shape
            DIMM = 2
        elif len(grid.shape) == 3:
            if 'LAY' in globals():
                global LAY
            ROW, COL, LAY = grid.shape
            DIMM = 3
    else:
        ROW = R
        COL = C
        DIMM = 2

    if len(src) != len(dest):
        print("Srouce and destination are different size")
        return

    # Check if the source and destination are valid
    if DIMM == 2 and not is_valid(src[0], src[1]) or not is_valid(dest[0], dest[1]):
        print("Source or destination is invalid, 2D")
        return
    elif DIMM == 3 and not is_valid(src[0], src[1], src[2]) or not is_valid(dest[0], dest[1], src[2]):
        print("Source or destination is invalid, 3D")
        print(f"SRC:{src}, DST:{dest}, {ROW}, {COL}, {LAY}.")
        return

    # Check if the source and destination are unblocked
    if DIMM == 2 and (not is_unblocked(grid, src[0], src[1]) or not is_unblocked(grid, dest[0], dest[1])):
        print("Source or the destination is blocked, 2D")
        return
    if DIMM == 3 and (not is_unblocked(grid, src[0], src[1], src[2]) or not is_unblocked(grid, dest[0], dest[1], dest[2])):
        print("Source or the destination is blocked, 3D")
        print(
            f"src:{(not is_unblocked(grid, src[0], src[1], src[2]))};{src}, dest:{(not is_unblocked(grid, dest[0], dest[1], dest[2]))};{dest}")
        return

    # Check if we are already at the destination
    if DIMM == 2 and is_destination(dest, src[0], src[1]):
        print("We are already at the destination")
        return
    elif DIMM == 3 and is_destination(dest, src[0], src[1], src[2]):
        print("We are already at the destination")
        return

    if DIMM == 2:
        # Initialize the closed list (visited cells)
        closed_list = [[False for _ in range(COL)] for _ in range(ROW)]
        # Initialize the details of each cell
        cell_details = [[Cell() for _ in range(COL)] for _ in range(ROW)]

        # Initialize the start cell details
        i = src[0]
        j = src[1]
        cell_details[i][j].f = 0
        cell_details[i][j].g = 0
        cell_details[i][j].h = 0
        cell_details[i][j].parent_i = i
        cell_details[i][j].parent_j = j

        # Initialize the open list (cells to be visited) with the start cell
        open_list = []
        heapq.heappush(open_list, (0.0, i, j))

    if DIMM == 3:
        # Initialize the closed list (visited cells)
        closed_list = [
            [[False for _ in range(LAY)] for _ in range(COL)] for _ in range(ROW)]
        # Initialize the details of each cell
        cell_details = [[[Cell() for _ in range(LAY)]
                         for _ in range(COL)] for _ in range(ROW)]

        cell_details = numpy.array(cell_details)

        # Initialize the start cell details
        i = src[0]
        j = src[1]
        k = src[2]
        cell_details[i][j][k].f = 0
        cell_details[i][j][k].g = 0
        cell_details[i][j][k].h = 0
        cell_details[i][j][k].parent_i = i
        cell_details[i][j][k].parent_j = j
        cell_details[i][j][k].parent_k = k

        # Initialize the open list (cells to be visited) with the start cell
        open_list = []
        if DIMM == 2:
            heapq.heappush(open_list, (0.0, i, j))
        elif DIMM == 3:
            heapq.heappush(open_list, (0.0, i, j, k))

    # Initialize the flag for whether destination is found
    found_dest = False

    # Main loop of A* search algorithm
    while len(open_list) > 0:
        # Pop the cell with the smallest f value from the open list
        p = heapq.heappop(open_list)

        # Mark the cell as visited
        if DIMM == 2:
            i = p[1]
            j = p[2]
            closed_list[i][j] = True
        elif DIMM == 3:
            i = p[1]
            j = p[2]
            k = p[3]
            closed_list[i][j][k] = True

        # For each direction, check the successors
        # directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]

        # Only Manhatten distance can be found
        if DIMM == 2:
            directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        elif DIMM == 3:
            directions = [
                (0, 0, 1), (0, 0, -1),
                (0, 1, 0), (0, -1, 0),
                (1, 0, 0), (-1, 0, 0),
            ]

        for dir in directions:
            new_i = i + dir[0]
            new_j = j + dir[1]
            if DIMM == 3:
                new_k = k + dir[2]

            # If the successor is valid, unblocked, and not visited
            if DIMM == 2 and (is_valid(new_i, new_j) and is_unblocked(grid, new_i, new_j) and not closed_list[new_i][new_j]):
                # If the successor is the destination
                if DIMM == 2 and is_destination(dest, new_i, new_j):
                    # Set the parent of the destination cell
                    cell_details[new_i][new_j].parent_i = i
                    cell_details[new_i][new_j].parent_j = j
                    print("The destination cell is found")
                    # Trace and print the path from source to destination
                    path = trace_path(cell_details, dest)
                    found_dest = True
                    return path
                else:
                    # Calculate the new f, g, and h values
                    g_new = cell_details[i][j].g + 1.0
                    h_new = calculate_h_value(dest, new_i, new_j)
                    f_new = g_new + h_new

                    # If the cell is not in the open list or the new f value is smaller
                    if cell_details[new_i][new_j].f == float('inf') or cell_details[new_i][new_j].f > f_new:
                        # Add the cell to the open list
                        heapq.heappush(open_list, (f_new, new_i, new_j))
                        # Update the cell details
                        cell_details[new_i][new_j].f = f_new
                        cell_details[new_i][new_j].g = g_new
                        cell_details[new_i][new_j].h = h_new
                        cell_details[new_i][new_j].parent_i = i
                        cell_details[new_i][new_j].parent_j = j

            elif DIMM == 3 and \
                    (is_valid(new_i, new_j, new_k) and is_unblocked(grid, new_i, new_j, new_k) and not closed_list[new_i][new_j][new_k]):
                # If the successor is the destination
                if is_destination(dest, new_i, new_j, new_k):
                    # Set the parent of the destination cell
                    cell_details[new_i][new_j][new_k].parent_i = i
                    cell_details[new_i][new_j][new_k].parent_j = j
                    cell_details[new_i][new_j][new_k].parent_k = k
                    print("The destination cell is found")
                    # Trace and print the path from source to destination
                    path = trace_path(cell_details, dest)
                    found_dest = True
                    return path
                else:
                    # Calculate the new f, g, and h values
                    g_new = cell_details[i][j][k].g + 1.0
                    h_new = calculate_h_value(dest, new_i, new_j, new_k)
                    f_new = g_new + h_new

                    # If the cell is not in the open list or the new f value is smaller
                    if cell_details[new_i][new_j][new_k].f == float('inf') or \
                            cell_details[new_i][new_j][new_k].f > f_new:
                        # Add the cell to the open list
                        heapq.heappush(open_list, (f_new, new_i, new_j, new_k))
                        # Update the cell details
                        cell_details[new_i][new_j][new_k].f = f_new
                        cell_details[new_i][new_j][new_k].g = g_new
                        cell_details[new_i][new_j][new_k].h = h_new
                        cell_details[new_i][new_j][new_k].parent_i = i
                        cell_details[new_i][new_j][new_k].parent_j = j
                        cell_details[new_i][new_j][new_k].parent_k = k

    # If the destination is not found after visiting all cells
    if not found_dest:
        # print("Failed to find the destination cell")
        raise BlockedPathException("Failed to find the destination cell")
