{
inputs,
pkgs,
...
}: {
  services.hyprpaper = {
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    enable = true;
    settings = {
      preload = "~/Pictures/wallpaper";
      wallpaper = ",~/Pictures/wallpaper";

      ipc = "off";
      splash = false;
    };
  };
}
