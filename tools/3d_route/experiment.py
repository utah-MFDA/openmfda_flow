from pyscipopt import Model

def shell_distance(M, a, b, dist):
    for i, j in zip(a, b):
        M.addCons(i - j <= dist)
        M.addCons(i - j >= -dist)

def is_equal(M, a, b, shell):
    i = M.addVar(vtype="I", lb=0, ub=1)
    j = M.addVar(vtype="I", lb=0, ub=1)
    k = M.addVar(vtype="I", lb=0, ub=1)
    M.addCons(-shell*i + b*j + (b+1)*k <= a)
    M.addCons(a <= (b-1)*i + b*j + shell*k)
    M.addCons(j + i + k == 1)
    return j

def not_overlap(M, m, n, shell):
    x, y, z = m
    a, b, c = n
    i = is_equal(M, x, a, shell)
    j = is_equal(M, y, b, shell)
    k = is_equal(M, z, c, shell)
    M.addCons(i*j*k == 0)
    return i, j, k

def on_face(M, p, shell):
    x, y, z = p
    w, h, d = shell, shell, shell
    i = M.addVar(vtype="B")
    j = M.addVar(vtype="B")
    k = M.addVar(vtype="B")
    l = M.addVar(vtype="B")
    m = M.addVar(vtype="B")
    n = M.addVar(vtype="B")
    M.addCons(x <= w)
    M.addCons(x >= -w)
    M.addCons(y <= h)
    M.addCons(y >= -h)
    M.addCons(z <= d)
    M.addCons(z >= -d)
    M.addCons(i*(x - w) == 0)
    M.addCons(j*(x + w) == 0)
    M.addCons(k*(y - h) == 0)
    M.addCons(l*(y + h) == 0)
    M.addCons(m*(z - d) == 0)
    M.addCons(n*(z + d) == 0)
    M.addCons(i + j + k + l + m + n >= 1)
    return i, j, k, l, m, n

def point(M, n, shell):
    xa = M.addVar(f"x_{n}", vtype="I", lb=-shell, ub=shell)
    ya = M.addVar(f"y_{n}", vtype="I", lb=-shell, ub=shell)
    za = M.addVar(f"z_{n}", vtype="I", lb=-shell, ub=shell)
    a = (xa, ya, za)
    return a

################################################################
def test_it(offset, var, label):
    M = Model()
    shell = 3
    x = M.addVar(vtype="I", lb=-shell, ub=shell)
    y = M.addVar(vtype="I", lb=-shell, ub=shell)
    m = is_equal(M, x, y, shell)
    M.addCons(x == y + offset)
    M.addCons(m == var)

    M.optimize()
    if M.getNSols() >= 1:
        print("good", label, M.getVal(x), M.getVal(y), M.getVal(m), "bad")
    else:
        print("bad", label)
print("bad", "********************************")
test_it(0, 0, "==/0")
test_it(0, 1, "==/1")
test_it(1, 0, "!=/0")
test_it(1, 1, "!=/1")
################################################################
M = Model()
shell = 10
a = point(M, "a", shell)
xa, ya, za = a
b = point(M, "b", shell)
xb, yb, zb = b
fa = on_face(M, a, shell)
fb = on_face(M, b, shell)
ov = not_overlap(M, a, b, shell)
di = shell_distance(M, a, b, 2)
M.optimize()
assert(M.getNSols() >= 1)
print([M.getVal(i) for i in a],
      [M.getVal(i) for i in b],
      [M.getVal(i) for i in fa],
      [M.getVal(i) for i in fb],
      [M.getVal(i) for i in ov])
