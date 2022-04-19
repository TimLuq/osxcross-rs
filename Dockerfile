FROM rust:slim-buster
RUN apt-get update && apt-get install -y curl git clang lld libc6-dev
COPY --from=crazymax/osxcross:11.3-ubuntu /osxcross /osxcross
ENV PATH="/osxcross/bin:$PATH"
ENV LD_LIBRARY_PATH="/osxcross/lib:$LD_LIBRARY_PATH"
ENV CARGO_BUILD_TARGET="x86_64-apple-darwin"
RUN cargo
