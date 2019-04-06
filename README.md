# Rocket Rust Docker Images

Source code for [Rocket](https://rocket.rs) Docker images.

The images are available at https://hub.docker.com/r/renderco/rocket-rust.

These images use a preconfigured build target by setting the [`CARGO_TARGET_DIR`](https://doc.rust-lang.org/cargo/reference/environment-variables.html#environment-variables-cargo-reads) environment variable.

Built artifacts are written to a workspace-independent location, avoiding a full build for Rocket in Dockerfiles that use these images as base.
