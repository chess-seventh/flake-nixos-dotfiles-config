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
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      ubuntu_font_family
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Cantarell" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };


}
