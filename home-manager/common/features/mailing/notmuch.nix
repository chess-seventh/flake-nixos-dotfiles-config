{ ... }: {
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
