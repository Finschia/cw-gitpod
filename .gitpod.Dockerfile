FROM gitpod/workspace-full@sha256:bb84c4490170fbfdeb577535a6dec5aafd1eb8fdf433f9a344bd8f4a69af5707
ARG FNSA_VERSION=2.0.1

RUN rustup toolchain install 1.69.0
RUN rustup default 1.69.0
RUN rustup target add wasm32-unknown-unknown
RUN rustup default 1.74.1
RUN cargo install cosmwasm-check
RUN cargo install cargo-generate
RUN rustup default 1.69.0

USER root
RUN wget -O /usr/local/bin/fnsad https://github.com/Finschia/finschia/releases/download/v$FNSA_VERSION/fnsad-$FNSA_VERSION-linux-amd64
RUN chmod 755 /usr/local/bin/fnsad

USER gitpod
