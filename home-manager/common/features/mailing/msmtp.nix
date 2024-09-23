{ ... }: 
{
  accounts = {
    email.accounts."francesco@piva.online" = {
      msmtp = {
        enable = true;
        extraConfig = {
        };
      };
    };
  };

  programs.msmtp = {
    enable = false;
    extraConfigs = {};
    extraAccounts = {};
  };
}

