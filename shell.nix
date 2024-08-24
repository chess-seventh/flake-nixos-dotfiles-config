{pkgs ? (import ./nixpkgs.nix) {}}: 

pkgs.mkShell {
  buildInputs = [

    # keep this line if you use bash
    pkgs.zshInteractive
    pkgs.nix
    pkgs.home-manager
    pkgs.git
    pkgs.ssh-to-age
    pkgs.gnupg
    pkgs.age
    pkgs.nil
  ];
}
