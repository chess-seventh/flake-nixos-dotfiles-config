{ ... }:
{
  programs.alot = {
    enable = false;
    binding = {
      bufferList = {};
      envelope = {};
      global = {};
      search = {};
      taglist = {};
      thread = {};
    };
    extraConfig = '' '';
    hooks = '' '';
    settings = {
      auto_remove_unread = true;
      handle_mouse = true;
      initial_command = "search tag:inbox AND NOT tag:killed";
      prefer_plaintext = true;
    };
    tags = {
      "name_of_tag".focus = "";
      "name_of_tag".normal = "'','', 'white','light red', 'white','#d66'";
      "name_of_tag".translated = "";
      "name_of_tag".translation = "";
    };
  };

  accounts = {
    email.accounts."francesco@piva.online" = {
      alot = {
        contactCompletion = {
          type = "shellcommand";
          command = "abook --mutt-query";
          regexp = "'^(?P<email>[^@]+@[^\t]+)\t+(?P<name>[^\t]+)'";
          ignorecase = "True";
        };
        extraConfig = {};
      };
    };
  };


}

