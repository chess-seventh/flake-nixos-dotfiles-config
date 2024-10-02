{
inputs,
lib,
pkgs,
config,
...
}: {
  home.packages = with pkgs; [
    bacon
    unstable.cargo
    unstable.cargo-audit
    unstable.cargo-bloat
    unstable.cargo-cross
    unstable.cargo-deny
    unstable.cargo-edit
    unstable.cargo-lambda
    unstable.cargo-license
    unstable.cargo-modules
    unstable.cargo-nextest
    unstable.cargo-outdated
    unstable.cargo-spellcheck
    unstable.cargo-tarpaulin
    unstable.cargo-unused-features
    unstable.cargo-update
    unstable.cargo-watch
    unstable.clippy
    cmake
    devbox
    diffsitter # Better diff
    distrobox
    docker
    gcc
    gnumake
    unstable.go
    jdk
    jetbrains.pycharm-professional
    jetbrains-toolbox
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
    unstable.rust-analyzer
    teller
    unstable.rustc
    zig
  ];

}


