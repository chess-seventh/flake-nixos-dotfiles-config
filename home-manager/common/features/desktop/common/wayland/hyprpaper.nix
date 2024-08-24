{
inputs,
pkgs,
...
}: {
  services.hyprpaper = {
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    enable = true;
    settings = {
      preload = "~/Pictures/wave.png";
      wallpaper = ",~/Pictures/wave.png";

      ipc = "off";
      splash = false;
    };
  };
}
