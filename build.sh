# git clone https://gitlab.com/ccp5/dl-poly.git
# git clone https://github.com/ccp5UK/dl-poly-data
# https://gitlab.com/ccp5/dl-poly/-/blob/devel/building.rst

cmake -S dl-poly -Bbuild-mpi-pure -DCMAKE_BUILD_TYPE=Release
cmake --build build-mpi-pure
sudo cmake --install build-mpi-pure
