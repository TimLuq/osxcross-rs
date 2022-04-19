FROM rust:slim-buster
RUN apt-get update && apt-get install -y curl git libc6-dev build-essential
RUN rustup target add i686-pc-windows-gnu
COPY cross/docker/mingw.sh /tmp/
RUN bash /tmp/mingw.sh
ENV CARGO_BUILD_TARGET="i686-pc-windows-gnu"
ENV CC=i686-w64-mingw32-gcc
ENV CXX=i686-w64-mingw32-g++
ENTRYPOINT ["cargo"]
