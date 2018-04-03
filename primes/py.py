# From: http://docs.cython.org/en/latest/src/tutorial/cython_tutorial.html
def primes(nb_primes):
    p = []
    n = 2
    while len(p) < nb_primes:
        for i in p:
            if n % i == 0:
                break
        else:
            p.append(n)
        n += 1
    return p
