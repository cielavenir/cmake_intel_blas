#!/usr/bin/env python
import sys
import ctypes
if len(sys.argv)>1:
    # https://github.com/ContinuumIO/anaconda-issues/issues/698#issuecomment-329027239
    sys.setdlopenflags(sys.getdlopenflags() | ctypes.RTLD_GLOBAL)

import libfunc as func
func.func()
#print('=== check cblas_dgemm below ===')
#import libfunc_blas
#libfunc_blas.func()
