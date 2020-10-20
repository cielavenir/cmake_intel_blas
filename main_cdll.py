#!/usr/bin/env python
import sys
import ctypes
flag = ctypes.DEFAULT_MODE
if len(sys.argv)>1:
    # https://github.com/ContinuumIO/anaconda-issues/issues/698#issuecomment-329027239
    flag = ctypes.RTLD_GLOBAL

dll=ctypes.CDLL("libfunc.so",flag)
dll["func"]()
#print('=== check cblas_dgemm below ===')
#dll=ctypes.CDLL("libfunc_blas.so",flag)
#dll["func"]()
