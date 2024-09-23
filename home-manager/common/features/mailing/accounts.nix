{ ... }: 
{
  accounts = {
    email.accounts."francesco@piva.online" = {
      name = "Francesco Piva";
      realName = "Francesco Piva";
      primary = true;
      address = "francesco@piva.online";
      aliases = [
        "francesco@piva.online"
        "piva.francesco@protonmail.com"
        "piva.francesco@pm.me"
      ];
      flavor = "plain";
      folders = {
        drafts = "Drafts";
        inbox = "Inbox";
        sent = "Sent";
        trash = "Trash";
        archive = "Archive";
      };
      imap = {
        hostname = "mail.piva.online";
        port = 993;
        ssl = "yes";
      };
      maildir = "~/Mail";

    };
  };
