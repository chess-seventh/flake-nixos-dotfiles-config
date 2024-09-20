{ ... }: {
  programs.neomutt = {
    enable = false;
    binds = {
      "bind_action".action = "<enter-command>toggle sidebar_visible<enter><refresh>";
      "bind_action".key = "<enter-command>toggle sidebar_visible<enter><refresh>";
      "bind_action".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     
    };
    changeFolderWhenSourcingAccount = true;
    checkStatsInterval = 60;
    editor = "neovim";
    extraConfig = {};
    macros = {
      "macro_name".action = "macro";
      "macro_name".key = "macro";
      "macro_name".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     
    };
    settings = {};
    sidebar = {
      enable = true;
      format = "%D%?F? [%F]?%* %?N?%N/?%S";
      shortPath = true;
      width = 22;
    };
    sort = "threads"; # Type: one of “date”, “date-received”, “from”, “mailbox-order”, “score”, “size”, “spam”, “subject”, “threads”, “to”, “reverse-date”, “reverse-date-received”, “reverse-from”, “reverse-mailbox-order”, “reverse-score”, “reverse-size”, “reverse-spam”, “reverse-subject”, “reverse-threads”, “reverse-to”
    sourcePrimaryAccount = true;
    vimKeys = true;
    unmailboxes = true;
  };
}
