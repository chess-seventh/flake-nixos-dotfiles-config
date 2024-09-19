{ ... }:
{
  programs.skim = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";

    fileWidgetOptions = [
      "--preview 'head {}'"
    ];

    historyWidgetOptions = [
      "--tac"
      "--exact"
    ];
  };
}

