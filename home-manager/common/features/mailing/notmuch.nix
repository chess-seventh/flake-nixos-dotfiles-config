{ ... }: 
{
  accounts = {
    email.accounts."francesco@piva.online" = {
      notmuch = {
        enable = true;
        neomutt = {
          enable = true;
          virtualMailboxes = [
          {
            name = "inbox";
            query = "tag:inbox AND NOT tag:killed";
            type = "messages";
          }
          ];
        };
      };
    };
  };

  programs.notmuch = {
    enable = false;
    extraConfig = {};
    hooks.postInsert = "";
    hooks.postNew = "";
    hooks.preInsert = "";
    maildir.synchronizeFlags = true;
    new = {
      ignore = [];
      tags = [
        "unread"
        "inbox"
      ];
    };
    search = {
      excludeTags = [
        "deleted"
        "spam"
        "trash"
      ];
    };

  };
}
