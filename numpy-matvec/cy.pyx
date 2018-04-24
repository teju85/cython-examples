# Inspired from: http://docs.cython.org/en/latest/src/tutorial/numpy.html
import numpy as np
cimport numpy as np
cimport cython

# Assuming that mat.shape[1] == vec.shape[0] !!!
@cython.boundscheck(False)
@cython.wraparound(False)
def matvec(np.ndarray[float,ndim=2] mat, np.ndarray[float, ndim=1] vec):
    cdef int m = mat.shape[0]
    cdef int n = mat.shape[1]
    cdef np.ndarray[float,ndim=1] out = np.zeros([m], dtype=np.float32)
    cdef float sum
    for x in range(m):
        sum = 0.0
        for y in range(n):
            sum += mat[x, y] * vec[y]
        out[x] = sum
    return out
