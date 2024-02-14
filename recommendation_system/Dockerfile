FROM gcc:latest

RUN apt-get update && apt-get install -y \
    build-essential autoconf libtool pkg-config \
    libgflags-dev libgtest-dev clang libc++-dev \
    git cmake

ENV MY_INSTALL_DIR=/usr/local

RUN mkdir -p $MY_INSTALL_DIR

ENV PATH="$MY_INSTALL_DIR/bin:$PATH"


RUN git clone --recurse-submodules -b v1.61.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc

RUN cd /grpc && \
    git submodule update --init && \
    mkdir -p cmake/build && \
    cd cmake/build && \
    cmake -DgRPC_INSTALL=ON \
          -DgRPC_BUILD_TESTS=OFF \
          -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR \
          ../.. && \
    make -j 16 && \
    make install 


WORKDIR /app/recommendation_system

COPY . /app/recommendation_system

RUN cd /grpc/cmake/build && \ 
    cmake ../.. -DgRPC_INSTALL=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DgRPC_ABSL_PROVIDER=package \
        -DgRPC_CARES_PROVIDER=package \                
        -DgRPC_PROTOBUF_PROVIDER=package \
        -DgRPC_RE2_PROVIDER=package \             
        -DgRPC_SSL_PROVIDER=package \            
        -DgRPC_ZLIB_PROVIDER=package \
        -DgRPC_BUILD_TESTS=OFF && \
    make -j 16 && \
    make install




RUN chmod +x /app/recommendation_system/entrypoint.sh
ENTRYPOINT ["/app/recommendation_system/entrypoint.sh"]

