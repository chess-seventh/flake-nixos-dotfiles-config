{
  ...
}: {
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
    ./mcfly.nix
    ./pnpm.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

}
