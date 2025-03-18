{
  pkgs,
  config,
  inputs,
  ...
}: let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  # programs.browserpass.enable = true;
  programs.firefox = {
    enable = true;
    # package = pkgs.unstable.firefox;
  };

  home = {
    sessionVariables = {
      BROWSER = "firefox";
      TZ = "/etc/localtime";
    };
    # persistence = {
    #   "/persist/home/${config.home.username}".directories = [".mozilla/firefox"];
    # };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
