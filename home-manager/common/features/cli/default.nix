{ ... }: 
{
  imports = [
    ./autojump.nix
    ./bash.nix
    ./bat.nix
    ./direnv.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./joshuto.nix
    ./jq.nix
    ./lorri.nix
    ./mcfly.nix
    ./pnpm.nix
    # ./skim.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";

    fileWidgetOptions = [
      "--preview 'head {}'"
    ];

    historyWidgetOptions = [
      "--tac"
      "--exact"
    ];
  };

}
