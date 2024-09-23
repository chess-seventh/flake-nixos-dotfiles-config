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

      alot = {
        contactCompletion = {
          type = "shellcommand";
          command = "abook --mutt-query";
          regexp = "'^(?P<email>[^@]+@[^\t]+)\t+(?P<name>[^\t]+)'";
          ignorecase = "True";
        };
        extraConfig = {};
      };

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

      msmtp = {
        enable = true;
        extraConfig = {
        };
      };

      neomutt = {
        enable = true;
        extraConfig = {};
        extraMailboxes = [];
        mailboxName = "=== francesco piva online ===";
        mailboxType = "maildir";
        sendMailCommand = ''
          if config.msmtp.enable then
            "msmtpq --read-envelope-from --read-recipients"
          else
            null
              '';
        showDefaultMailbox = true;
      };

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
