from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
    # for -lm, ideally not required, just for demo purposes
    Extension("cy",
              sources=["cy.pyx"],
              libraries=["m"])
]

setup(
    ext_modules=cythonize(ext_modules)
)
