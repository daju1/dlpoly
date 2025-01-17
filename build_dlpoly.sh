# Build dlpoly
# https://gitlab.com/ccp5/dl-poly/-/blob/devel/building.rst

git clone https://gitlab.com/ccp5/dl-poly.git
cmake -S dl-poly -Bbuild-mpi-pure -DCMAKE_BUILD_TYPE=Release
cmake --build build-mpi-pure
cmake --install build-mpi-pure


