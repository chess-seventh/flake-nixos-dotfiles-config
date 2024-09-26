{
inputs,
lib,
pkgs,
config,
...
}: {
  home.packages = with pkgs; [
    bacon
    cargo
    cargo-audit
    cargo-bloat
    cargo-cross
    cargo-deny
    cargo-edit
    cargo-lambda
    cargo-license
    cargo-modules
    cargo-nextest
    cargo-outdated
    cargo-spellcheck
    cargo-tarpaulin
    cargo-unused-features
    cargo-update
    cargo-watch
    clippy
    cmake
    devbox
    diffsitter # Better diff
    distrobox
    docker
    gcc
    gnumake
    go
    jdk
    jetbrains.pycharm-professional
    julia
    lua
    luarocks
    niv
    nodejs
    php
    pipenv
    podman
    podman-tui
    poetry
    python3
    qemu
    rust-analyzer
    rustc
    teller
    zig
  ];
}


