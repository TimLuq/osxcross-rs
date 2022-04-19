FROM rust:slim-buster
RUN apt-get update && apt-get install -y curl git libc6-dev
RUN rustup target add gcc-mingw-w64-i686
COPY --from=rustembedded/cross:i686-pc-windows-gnu /mingw.sh /mingw.sh
RUN bash mingw.sh
ENV CARGO_BUILD_TARGET="gcc-mingw-w64-i686"
ENV CC=i686-w64-mingw32-gcc
ENV CXX=i686-w64-mingw32-g++
ENTRYPOINT ["cargo"]
