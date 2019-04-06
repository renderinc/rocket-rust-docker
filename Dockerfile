FROM rustlang/rust:nightly

ARG ROCKET_VERSION
ENV ROCKET_VERSION=v0.4.0

RUN rustup default nightly && rustup update

RUN useradd --no-log-init --create-home --user-group --uid 1000 rocket

USER 1000:1000

ENV CARGO_TARGET_DIR=/home/rocket/.cargo/target

WORKDIR /home/rocket

RUN git clone https://github.com/SergioBenitez/Rocket \
    &&     cd Rocket && git checkout $ROCKET_VERSION \
    &&     cd core/lib && cargo build --all-features --release && cd ../.. \
    &&     cd core/codegen && cargo build --all-features --release && cd ../.. \
    &&     cd core/http && cargo build --all-features --release && cd ../.. \
    &&     cd contrib/lib && cargo build --all-features --release && cd ../.. \
    &&     cd contrib/codegen && cargo build --all-features --release && cd $HOME \
    &&     rm -rf Rocket