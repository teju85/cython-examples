# Inspired from: http://docs.cython.org/en/latest/src/tutorial/numpy.html
import numpy as np

# Assuming that mat.shape[1] == vec.shape[0] !!!
def matvec(mat, vec):
    m = mat.shape[0]
    n = mat.shape[1]
    out = np.zeros([m], dtype=np.float)
    for x in range(m):
        sum = 0.0
        for y in range(n):
            sum += mat[x, y] * vec[y]
        out[x] = sum
    return out
