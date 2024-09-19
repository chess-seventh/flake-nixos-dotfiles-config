{
pkgs,
...
}: {
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = pkgs.unstable.neovim-unwrapped;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-treesitter.withAllGrammars
      colorizer
      nvim-highlight-colors
    ];

    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [
        black
        flake8
      ]))
    ];

    extraPython3Packages = (ps: with ps; [
      jedi
    ]);

  };

  home.packages = with pkgs; [
    alejandra
    black
    cargo
    deadnix
    gcc
    gnumake
    # luajitPackages.luarocks-nix
    lua-language-server
    nodejs
    php
    phpPackages.composer
    pyright
    python3
    ruff
    ruff-lsp
    rust-analyzer
    rustc
    shellcheck
    shfmt
    statix
    stylua
    tflint
    unzip
    yaml-language-server
    marksman
  ];

  # xdg.configFile = {
  #   "nvim".source = inputs.neovim-config.outPath;
  # };
}
