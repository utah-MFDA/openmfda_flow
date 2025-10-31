import numpy as np

# ----------------------------------------------------------
# Astar grid class


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
        self._grid = np.array(
            [[[1 for _ in range(row)]
                for _ in range(col)]
             for _ in range(layer)]
        )
        self.pt_mapping = [2, 1, 0]
        self.update_mapping()

    def update_mapping(self):
        # check mapping
        if self.pt_mapping[0] == self.pt_mapping[1] or \
                self.pt_mapping[0] == self.pt_mapping[2] or \
                self.pt_mapping[1] == self.pt_mapping[0] or \
                self.pt_mapping[1] == self.pt_mapping[2] or \
                self.pt_mapping[2] == self.pt_mapping[0] or \
                self.pt_mapping[2] == self.pt_mapping[1]:
            raise ValueError(
                f"Pt mapping cannot have repeating indexes, {self.pt_mapping}")
        self.xi = self.pt_mapping[0]
        self.yi = self.pt_mapping[1]
        self.zi = self.pt_mapping[2]

    def set_value(self, pt, value):
        self._grid[pt[2]][pt[1]][pt[0]] = value

    def get_value(self, pt):
        return self._grid[pt[2]][pt[1]][pt[0]]

    def add_line(self, segment, v=0, acc=0.0001):
        def set_line_true(sgmt, ddir):
            sx = sgmt[0][0]
            sy = sgmt[0][1]
            sz = sgmt[0][2]
            if isinstance(sx, float):
                raise ValueError(f"sx is float value: {sx}")
            elif isinstance(sy, float):
                raise ValueError(f"sy is float value: {sy}")
            elif isinstance(sgmt[1][0], float):
                raise ValueError(f"sx2 is float value: {sgmt[1][0]}")
            elif isinstance(sgmt[1][1], float):
                raise ValueError(f"sy2 is float value: {sgmt[1][1]}")

            if ddir == 'x':
                if sgmt[0][0] < sgmt[1][0]:
                    for i in range(sgmt[0][0], sgmt[1][0]+1):
                        self._grid[sz][sy][i] = v
                else:
                    for i in range(sgmt[1][0], sgmt[0][0]+1):
                        self._grid[sz][sy][i] = v

            if ddir == 'y':
                if sgmt[0][1] < sgmt[1][1]:
                    for i in range(sgmt[0][1], sgmt[1][1]+1):
                        self._grid[sz][i][sx] = v
                else:
                    for i in range(sgmt[1][1], sgmt[0][1]+1):
                        self._grid[sz][i][sx] = v
            if ddir == 'z':
                if sgmt[0][2] < sgmt[1][2]:
                    for i in range(sgmt[0][2], sgmt[1][2]+1):
                        self._grid[i][sy][sx] = v
                else:
                    for i in range(sgmt[1][2], sgmt[0][2]+1):
                        self._grid[i][sy][sx] = v

        def set_line_true_zfloat(sgmt, ind):
            if ind == 0:
                set_line_true([
                    [int(sgmt[0][0]), sgmt[0][1], sgmt[0][2]],
                    [int(sgmt[1][0]), sgmt[1][1], sgmt[1][2]],
                ], 'z')
                set_line_true([
                    [int(sgmt[0][0])+1, sgmt[0][1], sgmt[0][2]],
                    [int(sgmt[1][0])+1, sgmt[1][1], sgmt[1][2]],
                ], 'z')
            elif ind == 1:
                set_line_true([
                    [sgmt[0][0], int(sgmt[0][1]), sgmt[0][2]],
                    [sgmt[1][0], int(sgmt[1][1]), sgmt[1][2]],
                ], 'z')
                set_line_true([
                    [sgmt[0][0], int(sgmt[0][1])+1, sgmt[0][2]],
                    [sgmt[1][0], int(sgmt[1][1])+1, sgmt[1][2]],
                ], 'z')
            elif ind == 10:
                set_line_true([
                    [int(sgmt[0][0]), int(sgmt[0][1]), sgmt[0][2]],
                    [int(sgmt[1][0]), int(sgmt[1][1]), sgmt[1][2]],
                ], 'z')
                set_line_true([
                    [int(sgmt[0][0]), int(sgmt[0][1])+1, sgmt[0][2]],
                    [int(sgmt[1][0]), int(sgmt[1][1])+1, sgmt[1][2]],
                ], 'z')
                set_line_true([
                    [int(sgmt[0][0])+1, int(sgmt[0][1]), sgmt[0][2]],
                    [int(sgmt[1][0])+1, int(sgmt[1][1]), sgmt[1][2]],
                ], 'z')
                set_line_true([
                    [int(sgmt[0][0])+1, int(sgmt[0][1])+1, sgmt[0][2]],
                    [int(sgmt[1][0])+1, int(sgmt[1][1])+1, sgmt[1][2]],
                ], 'z')
            else:
                raise ValueError("invalid index number")

        def set_line_true_yfloat(sgmt):
            set_line_true([
                [sgmt[0][0], int(sgmt[0][1]), int(sgmt[0][2])],
                [sgmt[1][0], int(sgmt[1][1]), int(sgmt[1][2])]],
                'x')
            set_line_true([
                [sgmt[0][0], int(sgmt[0][1])+1, int(sgmt[0][2])],
                [sgmt[1][0], int(sgmt[1][1])+1, int(sgmt[1][2])]],
                'x')

        def set_line_true_xfloat(sgmt):
            set_line_true([
                [int(sgmt[0][0]), sgmt[0][1], int(sgmt[0][2])],
                [int(sgmt[1][0]), sgmt[1][1], int(sgmt[1][2])]],
                'y')
            set_line_true([
                [int(sgmt[0][0])+1, sgmt[0][1], int(sgmt[0][2])],
                [int(sgmt[1][0])+1, sgmt[1][1], int(sgmt[1][2])]],
                'y')

        def handle_float_grids(pt1, pt2, ind):
            if ind == 0 and isinstance(pt1[0], float) and isinstance(pt2[0], float):
                return [
                    [int(pt1[0]), pt1[1], pt1[2]],
                    [int(pt2[0])+1, pt2[1], pt2[2]]
                ]
            elif ind == 0 and isinstance(pt1[0], float):
                if pt1[0] > pt2[0]:
                    return [
                        [int(pt1[0])+1, pt1[1], pt1[2]],
                        [pt2[0], pt2[1], pt2[2]]
                    ]
                else:
                    return [
                        [int(pt1[0]), pt1[1], pt1[2]],
                        [pt2[0], pt2[1], pt2[2]]
                    ]
            elif ind == 0 and isinstance(pt2[0], float):
                if pt2[0] > pt1[0]:  # reversed from above
                    return [
                        [pt1[0], pt1[1], pt1[2]],
                        [int(pt2[0]), pt2[1], pt2[2]]
                    ]
                else:
                    return [
                        [pt1[0], pt1[1], pt1[2]],
                        [int(pt2[0]), pt2[1], pt2[2]]
                    ]
            # check in ind == 1
            elif ind == 1 and isinstance(pt1[1], float) and isinstance(pt2[1], float):
                return [
                    [pt1[0], int(pt1[1]), pt1[2]],
                    [pt2[0], int(pt2[1])+1, pt2[2]]
                ]
            elif ind == 1 and isinstance(pt1[1], float):
                if pt1[1] > pt2[1]:  # reversed from above
                    return [
                        [pt1[0], int(pt1[1]), pt1[2]],
                        [pt2[0], pt2[1], pt2[2]]
                    ]
                else:
                    return [
                        [pt1[0], int(pt1[1])+1, pt1[2]],
                        [pt2[0], pt2[1], pt2[2]]
                    ]
            elif ind == 1 and isinstance(pt2[1], float):
                if pt2[1] > pt1[1]:  # reversed from above
                    return [
                        [pt1[0], pt1[1], pt1[2]],
                        [pt2[0], int(pt2[1]), pt2[2]]
                    ]
                else:
                    return [
                        [pt1[0], pt1[1], pt1[2]],
                        [pt2[0], int(pt2[1])+1, pt2[2]]
                    ]
            else:
                return [pt1, pt2]

        # fmt:off
        if segment[0][0] != segment[1][0] and \
                segment[0][1] == segment[1][1] and \
                segment[0][2] == segment[1][2]:
            if isinstance(segment[0][1], float):
                set_line_true_yfloat(
                    handle_float_grids(
                        segment[0], segment[1], 0),
                    )
            else:
                set_line_true(
                    handle_float_grids(
                        segment[0], segment[1], 0),
                    'x')
        elif segment[0][0] == segment[1][0] and \
                segment[0][1] != segment[1][1] and \
                segment[0][2] == segment[1][2]:
            if isinstance(segment[0][0], float):
                set_line_true_xfloat(
                    handle_float_grids(
                        segment[0], segment[1], 1),
                    )
            else:
                set_line_true(
                    handle_float_grids(
                        segment[0], segment[1], 1),
                    'y')
        elif segment[0][0] == segment[1][0] and \
                segment[0][1] == segment[1][1] and \
                segment[0][2] != segment[1][2]:
            # implicitly seg1 is also not on the grid
            if isinstance(segment[0][0], float) and isinstance(segment[0][1], float):
                set_line_true_zfloat(segment, 10)
            elif isinstance(segment[0][0], float):
                set_line_true_zfloat(segment, 0)
            elif isinstance(segment[0][1], float):
                set_line_true_zfloat(segment, 1)
            else:
                set_line_true(segment, 'z')
        else:
            print(f"invalid segement: {segment}")

        # fmt:on

    def add_box(self, low_r, up_l, v=0):
        for i in range(low_r[2], up_l[2]+1):
            for j in range(low_r[1], up_l[1]+1):
                for k in range(low_r[0], up_l[0]+1):
                    self._grid[i][j][k] = v

    def get_grid(self):
        return self._grid

    def print_grid(self):
        print(self._grid.shape)
        print('[')
        for ilay, lay in enumerate(self._grid):
            for jcol, col in enumerate(lay):
                if jcol == 0:
                    print('     '+''.join([str(n % 10)
                          for n in range(0, len(col))]))
                if jcol < 10:
                    pr_line = f'{jcol}  - '
                elif jcol < 100:
                    pr_line = f'{jcol} - '
                else:
                    pr_line = f'{jcol}- '
                for k in col:
                    pr_line += f'{k}'
                print(pr_line)
            print(f'], - {ilay}')

    def export_as_lists(self):
        exp_list = []
        for ilay, lay in enumerate(self._grid):
            lay_l = []
            for jcol, col in enumerate(lay):
                # col_l
                for k in col:
                    pr_line += f'{k}'
                print(pr_line)
            print(f'], - {ilay}')


def convert_pt2grid(pt):
    return [pt[2], pt[1], pt[0]]


def convert_grid2pt(grid_pt):
    return [pt[0], pt[1], pt[2]]
