FROM ubuntu:bionic
RUN apt-get update && apt-get install -y curl git libc6-dev build-essential
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"
RUN /root/.cargo/bin/rustup target add x86_64-unknown-linux-gnu
ENV CARGO_BUILD_TARGET="x86_64-unknown-linux-gnu"
RUN /root/.cargo/bin/cargo install empty-library || true
ENTRYPOINT ["/root/.cargo/bin/cargo"]
