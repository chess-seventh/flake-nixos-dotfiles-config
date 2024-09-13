{
inputs,
pkgs,
...
}: {
  services.hyprpaper = {
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    enable = true;
    settings = {
      preload = "/home/seventh/Pictures/wave.png";
      wallpaper = ",/home/seventh/Pictures/wave.png";

      ipc = true;
      splash = true;
    };
  };
}
