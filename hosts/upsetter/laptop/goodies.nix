{ pkgs, ... }:
{

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      jetbrains-mono
      nerd-font-patcher
      cantarell-fonts
      font-awesome
      (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" "DroidSansMono" ]; })
      # pkgs.nerd-fonts.FantasqueSansMono
      # pkgs.nerd-fonts.FiraCode
      # pkgs.nerd-fonts.DroidSansMono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      ubuntu_font_family
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Cantarell" ];
        monospace = [
          # "Ubuntu Mono"
          # "DejaVu Sans Mono"
          # "DroidSansM Nerd Font Mono"
          # "FantasqueSansM Nerd Font Mono"
          # "Fira Mono"
          # "FreeMono"
          # "JetBrains Mono"
          # "Liberation Mono"
          # "Noto Sans Mono"
          # "FiraCode Nerd Font Mono"
        ];
      };
    };
  };

}
