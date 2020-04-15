set(BLA_VENDOR Intel10_64lp)
find_package(PythonLibs 2)
find_package(Boost COMPONENTS python)
find_package(BLAS)

add_library(func SHARED func.cpp)
include_directories(${PYTHON_INCLUDE_DIR})
target_link_libraries(func ${BLAS_LIBRARIES} ${Boost_PYTHON_LIBRARY} ${PYTHON_LIBRARY})
set_target_properties(func PROPERTIES NO_SONAME 1)
