from libc.stdlib cimport atoi

def str2int(char* str):
    return atoi(str)
