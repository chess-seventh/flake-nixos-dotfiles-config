{
inputs,
lib,
pkgs,
config,
...
}: {
  home.packages = with pkgs; [
    bacon
    cmake
    devbox
    devenv
    diffsitter # Better diff
    distrobox
    docker
    docker-compose
    gcc
    gnumake
    jdk
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
    teller
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
    unstable.cargo-llvm-cov
    unstable.cargo-outdated
    unstable.cargo-spellcheck
    unstable.cargo-tarpaulin
    unstable.cargo-unused-features
    unstable.cargo-update
    unstable.cargo-watch
    unstable.clippy
    unstable.go
    unstable.newsraft
    unstable.rust-analyzer
    unstable.rustc
    uv
    yarn
    zig
  ];

}


