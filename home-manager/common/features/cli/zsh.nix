{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "eza -lgbma --icons=always";
      ll = "eza -lgbma --icons=always";
      ls = "eza -lgbm --icons=always";
      l = "eza -lgbm --icons=always";

      lad = "eza -lgbtmad --icons=always";
      laf = "eza -lgbtmaf --icons=always";

      hm = "home-manager";

      lzg = "lazygit";

      ga = "git add";

      tree2 = "eza --tree --level 2";
      tree3 = "eza --tree --level 3";

      cat = "bat";

      hmsi = "home-manager switch --impure --flake .#seventh@upsetter";
      hmup = "sudo nixos-rebuild switch --upgrade --impure --flake .#upsetter";

      clippy = "cargo clippy -- -W clippy::pedantic -A clippy::missing_errors_doc -A clippy::must_use_candidate -A clippy::module_name_repetitions -A clippy::doc_markdown -A clippy::missing_panics_doc";

      dotfiles = "cd ~/src/git.sr.ht/chess7th/flake-nixos-config/";

      bigdirs = "du -h -a -d 1 ./ | sort -h -r | head -n 10";

      feh = "feh --scale-down --auto-zoom";

      df = "df -h";

      emoji = "rofimoji --selector wofi --clipboarder wl-copy -a copy";
    };

    envExtra = ''
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/git.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/flow.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/kubectl.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/nav.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/pass.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/taskwarrior.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/tmux.zsh}
      ${lib.fileContents /home/seventh/src/git.sr.ht/chess7th/flake-nixos-config/dotfiles/zsh/alias.zsh}
    '';

    initExtra = ''
        eval "$(direnv hook zsh)"
        eval "$(starship init zsh)"
        eval "$(zoxide init --cmd cd zsh)"
        export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';

    history = {
      size = 10000000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "aws" "autojump" "direnv" "fzf" "history" "colored-man-pages" "fd" "kubectl" "kubectx" "poetry" "poetry-env" "systemd" "taskwarrior" "tmux" "zsh-interactive-cd" ];
      theme = "agnoster";
    };

  };
}

