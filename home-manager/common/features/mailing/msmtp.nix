{ ... }: {
  programs.msmtp = {
    enable = false;
    extraConfigs = {};
    extraAccounts = {};
  };
}

