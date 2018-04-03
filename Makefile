
BUILD  := python setup.py build_ext --inplace
CLEAN  := rm -rf *.c *.dll *.so *.pyc *.pyo *.html build/

default:
	@echo "make what? Available targets are:"
	@echo " . helloworld - simplest hello world program"
	@echo " . integrate  - integration code"
	@echo " . primes     - evaluating primes"

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
