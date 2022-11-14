FROM rust:slim-buster
RUN apt-get update && apt-get install -y curl git clang lld libc6-dev
RUN rustup target add aarch64-apple-darwin
COPY --from=crazymax/osxcross:11.3-ubuntu /osxcross /osxcross
ENV PATH="/osxcross/bin:$PATH"
ENV LD_LIBRARY_PATH="/osxcross/lib:$LD_LIBRARY_PATH"
ENV CARGO_BUILD_TARGET="aarch64-apple-darwin"
ENV CC=oa64-clang
ENV CXX=oa64-clang++
ENV LIBZ_SYS_STATIC=1
RUN /usr/local/cargo/bin/cargo install empty-library || true
RUN echo '[target.aarch64-apple-darwin]' >> /usr/local/cargo/config.toml && echo 'linker = "arm64-apple-darwin20.4-clang"'  >> /usr/local/cargo/config.toml && echo 'ar = "arm64-apple-darwin20.4-ar"' >> /usr/local/cargo/config.toml
ENTRYPOINT ["/root/.cargo/bin/cargo"]
