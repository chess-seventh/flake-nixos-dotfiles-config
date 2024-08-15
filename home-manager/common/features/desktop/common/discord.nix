{
  config,
  pkgs,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  home.packages = with pkgs; [unstable.discord unstable.discocss];

  # home.persistence = {
  #   "/home/${config.home.username}".directories = [".config/discord"];
  # };
}
