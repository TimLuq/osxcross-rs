FROM ubuntu:bionic
RUN apt-get update && apt-get install -y curl git libc6-dev build-essential
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="$HOME/.cargo/bin:$PATH"
RUN rustup target add x86_64-unknown-linux-gnu
ENV CARGO_BUILD_TARGET="x86_64-unknown-linux-gnu"
ENTRYPOINT ["cargo"]
