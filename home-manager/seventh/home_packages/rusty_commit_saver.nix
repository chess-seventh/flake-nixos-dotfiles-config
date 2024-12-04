{ pkgs, ... }:

let
  rustyCommitSaver = pkgs.stdenv.mkDerivation {
    name = "rusty-commit-saver";
    src = pkgs.fetchgit {
      url = "https://git.sr.ht/~chess7th/rusty-commit-saver";
      rev = "HEAD";
      # Optional: Uncomment and replace with the commit hash if stability is needed
      # rev = "<specific-commit-hash>";
      # sha256 can be added here if desired for extra integrity checking
    };

    buildInputs = [ pkgs.rustc pkgs.cargo ];

    installPhase = ''
      cargo install --path . --root $out
    '';

    meta = {
      description = "Rusty Commit Saver - A tool to save your commits efficiently";
      homepage = "https://git.sr.ht/~chess7th/rusty-commit-saver";
      license = "MIT"; # Update with the correct license if needed
    };
  };
in
{
  home.packages = [
    rustyCommitSaver
  ];
}

