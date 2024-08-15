{
  config,
  pkgs,
  ...
}: {
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      git_protocol = "https";
      prompt = "enabled";
    };
  };
  # home.persistence = {
  #   "/home/${config.home.username}".directories = [".config/gh"];
  # };
}
