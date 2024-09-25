# Sources:
# https://github.com/LazyVim/LazyVim/discussions/1972
# https://github.com/jla2000/lazyvim-nix/tree/main

{ lib, pkgs, config, ... }:
{
  home.sessionVariables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = pkgs.unstable.neovim-unwrapped;

    extraPackages = with pkgs; [
      alejandra
      black
      cargo
      clang-tools
      cmake-language-server
      deadnix
      gcc
      gnumake
      golangci-lint-langserver
      gopls
      haskell-language-server
      lua-language-server
      markdownlint-cli
      markdownlint-cli2
      marksman
      nil
      nodejs
      nodePackages.bash-language-server
      php
      phpPackages.composer
      pyright
      python3
      ripgrep
      ruff
      ruff-lsp
      rust-analyzer
      rustc
      shellcheck
      shfmt
      statix
      stylua
      terraform-ls
      texlab
      tflint
      unzip
      vscode-langservers-extracted
      yaml-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig =
      let
      plugins = with pkgs.vimPlugins; [
        LazyVim

        bufferline-nvim
        cmp-buffer
        cmp_luasnip
        cmp-nvim-lsp
        cmp-path
        conform-nvim
        dashboard-nvim
        dressing-nvim
        flash-nvim
        friendly-snippets
        gitsigns-nvim
        indent-blankline-nvim
        lualine-nvim
        neoconf-nvim
        neodev-nvim
        neo-tree-nvim
        noice-nvim
        nui-nvim
        nvim-cmp
        nvim-lint
        nvim-lspconfig
        nvim-notify
        nvim-spectre
        nvim-treesitter
        nvim-treesitter-context
        nvim-treesitter-textobjects
        nvim-ts-autotag
        nvim-ts-context-commentstring
        nvim-web-devicons
        persistence-nvim
        plenary-nvim
        telescope-fzf-native-nvim
        telescope-nvim
        todo-comments-nvim
        tokyonight-nvim
        trouble-nvim
        vim-illuminate
        vim-startuptime
        which-key-nvim

        { name = "LuaSnip"; path = luasnip; }
    { name = "catppuccin"; path = catppuccin-nvim; }
    { name = "mini.ai"; path = mini-nvim; }
    { name = "mini.bufremove"; path = mini-nvim; }
    { name = "mini.comment"; path = mini-nvim; }
    { name = "mini.indentscope"; path = mini-nvim; }
    { name = "mini.pairs"; path = mini-nvim; }
    { name = "mini.surround"; path = mini-nvim; }
    { name = "mini.animate"; path = mini-nvim; }

# MY STUFF
    colorizer
      nvim-highlight-colors
      ];
    mkEntryFromDrv = drv:
      if lib.isDerivation drv then
      { name = "${lib.getName drv}"; path = drv; }
      else
        drv;
    lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
    in
      ''
      require("lazy").setup({
          defaults = {
          lazy = true,
          },
          dev = {
          -- reuse files from pkgs.vimPlugins.*
          path = "${lazyPath}",
          patterns = { "." },
          -- fallback to download
          fallback = true,
          },
          spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },

          -- TODO { import = "lazyvim.plugins.extras.editor.fzf" },
          -- TODO { import = "lazyvim.plugins.extras.editor.inc-rename" },
          -- TODO { import = "lazyvim.plugins.extras.editor.overseer" },
          -- TODO { import = "lazyvim.plugins.extras.lang.angular" },
          -- TODO { import = "lazyvim.plugins.extras.lang.astro" },
          -- TODO { import = "lazyvim.plugins.extras.lang.git" },
          -- TODO { import = "lazyvim.plugins.extras.lang.nix" },
          -- TODO { import = "lazyvim.plugins.extras.lang.toml" },
          -- TODO { import = "lazyvim.plugins.extras.util.octo" },

          -- ERROR here
          -- TODO { import = "lazyvim.plugins.extras.coding.yanky" },

          { import = "lazyvim.plugins.extras.coding.copilot" },
          { import = "lazyvim.plugins.extras.coding.mini-comment" },
          { import = "lazyvim.plugins.extras.coding.mini-surround" },
          { import = "lazyvim.plugins.extras.editor.dial" },
          { import = "lazyvim.plugins.extras.editor.mini-diff" },
          { import = "lazyvim.plugins.extras.editor.mini-files" },
          { import = "lazyvim.plugins.extras.editor.mini-move" },
          { import = "lazyvim.plugins.extras.ui.edgy" },
          { import = "lazyvim.plugins.extras.editor.outline" },
          { import = "lazyvim.plugins.extras.editor.refactoring" },
          { import = "lazyvim.plugins.extras.formatting.black" },
          { import = "lazyvim.plugins.extras.formatting.prettier" },
          { import = "lazyvim.plugins.extras.lang.ansible" },
          { import = "lazyvim.plugins.extras.lang.docker" },
          { import = "lazyvim.plugins.extras.lang.go" },
          { import = "lazyvim.plugins.extras.lang.haskell" },
          { import = "lazyvim.plugins.extras.lang.helm" },
          { import = "lazyvim.plugins.extras.lang.json" },
          { import = "lazyvim.plugins.extras.lang.markdown" },
          { import = "lazyvim.plugins.extras.lang.python" },
          { import = "lazyvim.plugins.extras.lang.rust" },
          { import = "lazyvim.plugins.extras.lang.terraform" },
          { import = "lazyvim.plugins.extras.lang.tex" },
          { import = "lazyvim.plugins.extras.lang.typescript" },
          { import = "lazyvim.plugins.extras.lang.yaml" },
          { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
          { import = "lazyvim.plugins.extras.ui.treesitter-context" },
          { import = "lazyvim.plugins.extras.util.dot" },
          { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

          -- The following configs are needed for fixing lazyvim on nix
            -- force enable telescope-fzf-native.nvim
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
          -- disable mason.nvim, use programs.neovim.extraPackages
          { "williamboman/mason-lspconfig.nvim", enabled = false },
          { "williamboman/mason.nvim", enabled = false },
          -- import/override with your plugins

          { import = "plugins" },
          -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
          { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
          },
      })
    '';
  };

# https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
  xdg.configFile."nvim/parser".source =
    let
    parsers = pkgs.symlinkJoin {
      name = "treesitter-parsers";
      paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
            bash
            bibtex
            c
            cmake
            diff
            gitattributes
            gitcommit
            git_config
            gitignore
            git_rebase
            go
            haskell
            hcl
            html
            htmldjango
            http
            ini
            java
            javascript
            jq
            json
            just
            latex
            lua
            make
            muttrc
            nix
            php
            puppet
            python
            regex
            ruby
            rust
            scala
            scss
            sql
            ssh_config
            terraform
            tmux
            toml
            typescript
            vim
            vimdoc
            xml
            yaml
            ])).dependencies;
    };
  in
    "${parsers}/parser";

# Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  xdg.configFile."nvim/lua".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/home-manager/common/features/nvim/nvim-lua/";
# ".config/nvim/lua".source = "${config.home.homeDirectory}/src/git.sr.ht/chess7th/flake-nixos-config/home-manager/common/features/nvim/nvim-lua/";
}


# {
# pkgs,
# ...
# }: {
#   home.sessionVariables.EDITOR = "nvim";
#
#   programs.neovim = {
#     enable = true;
#     vimAlias = true;
#     vimdiffAlias = true;
#     package = pkgs.unstable.neovim-unwrapped;
#     plugins = with pkgs.vimPlugins; [
#       nvim-treesitter
#       nvim-treesitter.withAllGrammars
#       colorizer
#       nvim-highlight-colors
#     ];
#
#     extraPackages = with pkgs; [
#       (python3.withPackages (ps: with ps; [
#         black
#         flake8
#       ]))
#       lua-language-server
#       ruff-lsp
#       yaml-language-server
#       texlab
#       ansible-language-server
#       terraform-ls
#       marksman
#       shellcheck
#     ];
#
#     extraPython3Packages = (ps: with ps; [
#       jedi
#     ]);
#
#   };
#
#   home.packages = with pkgs; [
#     alejandra
#     black
#     cargo
#     deadnix
#     gcc
#     gnumake
#     # luajitPackages.luarocks-nix
#     # lua-language-server
#     nodejs
#     php
#     phpPackages.composer
#     pyright
#     python3
#     ruff
#     ruff-lsp
#     rust-analyzer
#     rustc
#     shellcheck
#     shfmt
#     statix
#     stylua
#     texlab
#     tflint
#     unzip
#     yaml-language-server
#     marksman
#   ];
#
#   # xdg.configFile = {
#   #   "nvim".source = inputs.neovim-config.outPath;
#   # };
# }
