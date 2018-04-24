
BUILD  := python setup.py build_ext --inplace
CLEAN  := rm -rf *.c *.dll *.so *.pyc *.pyo *.html build/

default:
	@echo "make what? Available targets are:"
	@echo " . helloworld      - simplest hello world program"
	@echo " . integrate       - integration code"
	@echo " . primes          - evaluating primes"
	@echo " . atoi            - showing how to use C library functions"
	@echo " . dynamic-linking - showing how to link to external C libs"
	@echo " . numpy-matvec    - working with numpy using an example of matvec product"

.PHONY: helloworld
helloworld:
	cd $@ && \
	$(BUILD) && \
	python -c 'import cy; cy.say_hello_to("world")' && \
	$(CLEAN)

.PHONY: integrate
integrate:
	cd $@ && \
	$(BUILD) && \
	python -m timeit 'import cy; cy.integrate_f(0.0, 1.0, 1000000)' && \
	python -m timeit 'import py; py.integrate_f(0.0, 1.0, 1000000)' && \
	$(CLEAN)

.PHONY: primes
primes:
	cd $@ && \
	$(BUILD) && \
	python -m timeit 'import cy; cy.primes(1000)' && \
	python -m timeit 'import py; py.primes(1000)' && \
	$(CLEAN)

.PHONY: atoi
atoi:
	cd $@ && \
	$(BUILD) && \
	python -m timeit 'import cy; cy.str2int("123456")' && \
	python -m timeit 'import py; py.str2int("123456")' && \
	$(CLEAN)

.PHONY: dynamic-linking
dynamic-linking:
	cd $@ && \
	$(BUILD) && \
	python -m timeit 'import cy; cy.mypow(3.1415, 1.45)' && \
	python -m timeit 'import py; py.mypow(3.1415, 1.45)' && \
	$(CLEAN)

.PHONY: numpy-matvec
numpy-matvec:
	cd $@ && \
	$(BUILD) && \
	python -m timeit 'import py; import numpy as np; a = np.random.rand(100, 20).astype(np.float32); b = np.random.rand(20).astype(np.float32); py.matvec(a, b)' && \
	python -m timeit 'import cy; import numpy as np; a = np.random.rand(100, 20).astype(np.float32); b = np.random.rand(20).astype(np.float32); cy.matvec(a, b)' && \
	$(CLEAN)
