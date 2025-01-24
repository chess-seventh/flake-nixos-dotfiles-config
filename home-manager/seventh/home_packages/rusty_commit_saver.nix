{ pkgs, ... }:

let
rustyCommitSaver = pkgs.stdenv.mkDerivation {
  name = "rusty-commit-saver";
  src = pkgs.fetchgit {
    url = "https://git.sr.ht/~chess7th/rusty-commit-saver";
    rev = "db73ea304a7dd60f0c612acce50189071268d63e";
    sha256 = "0z6shi4b0474lzhpfzsanczrij3sbpq19k0wiqlfbrj9ccwsyvxs";
# Optional: Uncomment and replace with the commit hash if stability is needed
# rev = "<specific-commit-hash>";
# sha256 can be added here if desired for extra integrity checking
  };

  buildInputs = [ 
    pkgs.rustc
    pkgs.cargo
    pkgs.openssl
    pkgs.zlib
  ];

    installPhase = ''
      export CARGO_NET_GIT_FETCH_WITH_CLI=true
      export CARGO_HOME="${TMPDIR:-/tmp}/cargo"
      mkdir -p "$CARGO_HOME"

      # Run cargo install
      cargo install --path .
    '';

  sandbox = false; # Disable sandboxing for network access

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

