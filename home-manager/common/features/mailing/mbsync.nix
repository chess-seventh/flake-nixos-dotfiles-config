{ ... }: 
{
  programs.mbsync = {
    enable = false;
    extraConfigs = {};
    groups = {};
  };

  accounts = {
    email.accounts."francesco@piva.online" = {
      mbsync = {
        enable = true;
        create = "maildir";
        expunge = "none";
        extraConfig = {
          account = {
            PipelineDepth = 10;
            Timeout = 60;
          };
          channel = {
            MaxMessages = 10000;
            MaxSize = "1m";
          };
          local = {};
          remote = {};
        };
        flatten = {};
        patterns = {};
        subFolders = {};
      };
    };
  };
}
