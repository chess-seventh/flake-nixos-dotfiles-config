{
  config,
  lib,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      extraOptions = "--insecure-registry https://192.168.49.2:5000";
    };
  };

  # Ensure group exists
  users.groups.docker = {};
}
