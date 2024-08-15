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
    plugins = with pkgs; [
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  home.packages = with pkgs; [
    alejandra
    cargo
    deadnix
    gcc
    gnumake
    # luajitPackages.luarocks-nix
    nodejs
    php
    phpPackages.composer
    python3
    rustc
    statix
    stylua
    unzip
  ];

  # xdg.configFile = {
  #   "nvim".source = inputs.neovim-config.outPath;
  # };
}
