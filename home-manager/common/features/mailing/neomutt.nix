{ ... }: 
{
  accounts = {
    email.accounts."francesco@piva.online" = {
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
    };
  };

  programs.neomutt = {
    enable = false;
    binds = {
      # # Normally you'd have to hit Ctrl-T for completion.
      # # This rebinds it to Tab.
      # bind editor <Tab> complete-query
      "editor-complete-query".action = "complete-query";
      "editor-complete-query".key = "<Tab>";
      "editor-complete-query".map = "editor";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     

      # bind editor ^T complete
      "complete".action = "complete";
      "complete".key = "^T";
      "complete".map = "editor";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     

      # bind editor <space> noop
      "editor-noop".action = "noop";
      "editor-noop".key = "<space>";
      "editor-noop".map = "editor";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     

      # bind index g noop
      "index-noop-g".action = "noop";
      "index-noop-g".key = "g";
      "index-noop-g".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)     

      # # Pager Key Bindings
      # bind index gg first-entry
      "first-entry".action = "first-entry";
      "first-entry".key = "gg";
      "first-entry".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index G  last-entry
      "last-entry".action = "last-entry";
      "last-entry".key = "G";
      "last-entry".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager j next-line
      "next-line".action = "next-line";
      "next-line".key = "j";
      "next-line".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager k previous-line
      "previous-line".action = "previous-line";
      "previous-line".key = "k";
      "previous-line".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index,pager R   group-reply
      "group-reply".action = "group-reply";
      "group-reply".key = "R";
      "group-reply".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach <return> view-mailcap # View attachments properly.
      "view-mailcap".action = "view-mailcap";
      "view-mailcap".key = "<return>";
      "view-mailcap".map = "attach";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)
      
      # bind index l list-reply
      "list-reply".action = "list-reply";
      "list-reply".key = "l";
      "list-reply".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager \n noop
      "pager-noop".action = "noop";
      "pager-noop".key = "\n";
      "pager-noop".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager p noop # i don't have a printer. save the trees :p
      "printer-noop".action = "noop";
      "printer-noop".key = "p";
      "printer-noop".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager P noop # i don't have a printer. save the trees :p
      "printer-noop".action = "noop";
      "printer-noop".key = "P";
      "printer-noop".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CD next-page
      "attach-next-page".action = "next-page";
      "attach-next-page".key = "\CD";
      "attach-next-page".map = "attach";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CD next-page
      "index-next-page".action = "next-page";
      "index-next-page".key = "\CD";
      "index-next-page".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CD next-page
      "pager-next-page".action = "next-page";
      "pager-next-page".key = "\CD";
      "pager-next-page".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CU previous-page
      "attach-previous-page".action = "previous-page";
      "attach-previous-page".key = "\CU";
      "attach-previous-page".map = "attach";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CU previous-page
      "index-previous-page".action = "previous-page";
      "index-previous-page".key = "\CU";
      "index-previous-page".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind attach,index,pager \CU previous-page
      "pager-previous-page".action = "previous-page";
      "pager-previous-page".key = "\CU";
      "pager-previous-page".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # # Ctrl-P - Previous Mailbox
      # bind index,pager \CP sidebar-prev
      "index-sidebar-prev".action = "sidebar-prev";
      "index-sidebar-prev".key = "\CP";
      "index-sidebar-prev".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index,pager \CP sidebar-prev
      "pager-sidebar-prev".action = "sidebar-prev";
      "pager-sidebar-prev".key = "\CP";
      "pager-sidebar-prev".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # # Ctrl-N - Next Mailbox
      # bind index,pager \CN sidebar-next
      "index-sidebar-next".action = "sidebar-next";
      "index-sidebar-next".key = "\CN";
      "index-sidebar-next".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index,pager \CN sidebar-next
      "pager-sidebar-next".action = "sidebar-next";
      "pager-sidebar-next".key = "\CN";
      "pager-sidebar-next".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # # Ctrl-O - Open Highlighted Mailbox
      # bind index,pager \CO sidebar-open
      "index-sidebar-open".action = "sidebar-open";
      "index-sidebar-open".key = "\CO";
      "index-sidebar-open".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index,pager \CO sidebar-open
      "pager-sidebar-open".action = "sidebar-open";
      "pager-sidebar-open".key = "\CO";
      "pager-sidebar-open".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # # Use 'B' to switch the Sidebar on and off
      # bind index,pager B sidebar-toggle-visible
      "sidebar-toggle-visible".action = "sidebar-toggle-visible";
      "sidebar-toggle-visible".key = "B";
      "sidebar-toggle-visible".map = "index,pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager c imap-fetch-mail
      "imap-fetch-mail".action = "imap-fetch-mail";
      "imap-fetch-mail".key = "c";
      "imap-fetch-mail".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind index i noop
      "index-noop-i".action = "noop";
      "index-noop-i".key = "i";
      "index-noop-i".map = "index";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)

      # bind pager i noop
      "pager-noop-i".action = "noop";
      "pager-noop-i".key = "i";
      "pager-noop-i".map = "pager";  # Type: one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime” or list of (one of “alias”, “attach”, “browser”, “compose”, “editor”, “generic”, “index”, “mix”, “pager”, “pgp”, “postpone”, “query”, “smime”)
    };
    changeFolderWhenSourcingAccount = true;
    checkStatsInterval = 60;
    editor = "neovim";
    extraConfig = {};
    macros = {
      "macro_name".action = "macro";
      "macro_name".key = "macro";
      "macro_name".map = "index";

      # # URL SCANNER
      # macro index,pager \cl "<pipe-message> urlscan<Enter>" "call urlscan to extract URLs out of a message"
      # macro attach,compose \cl "<pipe-entry> urlscan<Enter>" "call urlscan to extract URLs out of a message"

      # # ATTACH FILES
      # macro compose A "<shell-escape>bash $HOME/.config/mutt/bin/filepicker<enter><enter-command>source $HOME/.config/mutt/tmp/tmpfile<enter><shell-escape>rm $HOME/.config/mutt/tmp/tmpfile<enter>" "Attach with Vifm"

      # # ADD SENDER ADDRESS
      # macro index,pager a "<pipe-message>mates add | xargs sh -c 'mates edit \"$@\" < /dev/tty || rm -v \"$@\"' mates<enter>" "add the sender address"

      # # GMAIL-STYLE KEYBOARD SHORTCUTS
      # macro index,pager y "<enter-command>unset trash\n <delete-message>" "Gmail archive message"
      "index-archive".action = "<enter-command>unset trash\n <delete-message>";
      "index-archive".key = "y";
      "index-archive".map = "index";

      "pager-archive".action = "<enter-command>unset trash\n <delete-message>";
      "pager-archive".key = "y";
      "pager-archive".map = "pager";

      # macro index M "T \n;WN^t \n" "Mark all messages read"
      "index-mark-all-read".action = "T \n;WN^t \n";
      "index-mark-all-read".key = "M";
      "index-mark-all-read".map = "index";

      # macro pager M "T \n;WN^t \n" "Mark all messages read"
      "pager-mark-all-read".action = "T \n;WN^t \n";
      "pager-mark-all-read".key = "M";
      "pager-mark-all-read".map = "pager";

      # # NEXT UNREAD MAILBOX
      # macro index,pager n '<next-unread-mailbox>'
      "index-next-unread-mailbox".action = "<next-unread-mailbox>";
      "index-next-unread-mailbox".key = "n";
      "index-next-unread-mailbox".map = "index";

      "pager-next-unread-mailbox".action = "<next-unread-mailbox>";
      "pager-next-unread-mailbox".key = "n";
      "pager-next-unread-mailbox".map = "pager";


      # # LOOKS UP A HAND MADE QUERY
      # macro index \\\\ "<vfolder-from-query>"
      "index-vfolder-from-query".action = "<vfolder-from-query>";
      "index-vfolder-from-query".key = "\\\\";
      "index-vfolder-from-query".map = "index";

      # # TAG AS ARCHIVED
      # macro index A "<modify-labels>+archive -unread -inbox -new"
      "index-tag-as-archived".action = "<modify-labels>+archive -unread -inbox -new";
      "index-tag-as-archived".key = "A";
      "index-tag-as-archived".map = "index";

      # # REMOVE FROM INBOX
      # macro index I "<modify-labels>-inbox -unread -new"
      "index-remove-from-inbox".action = "<modify-labels>-inbox -unread -new";
      "index-remove-from-inbox".key = "I";
      "index-remove-from-inbox".map = "index";

      # # TAG AS WORK
      # macro index W "<modify-labels>+bestmile -unread -inbox +work -new"
      "index-tag-as-work".action = "<modify-labels>+bestmile -unread -inbox +work -new";
      "index-tag-as-work".key = "W";
      "index-tag-as-work".map = "index";

      # # TAG AS VARIOUS
      # macro index V "<modify-labels>-inbox -unread +various -new"
      "index-tag-as-various".action = "<modify-labels>-inbox -unread +various -new";
      "index-tag-as-various".key = "V";
      "index-tag-as-various".map = "index";

      # # TAG AS JUNK MAIL
      # macro index S "<modify-labels-then-hide>-inbox -unread +junk -new"
      "index-tag-as-junk-mail".action = "<modify-labels-then-hide>-inbox -unread +junk -new";
      "index-tag-as-junk-mail".key = "S";
      "index-tag-as-junk-mail".map = "index";

      # # TAG AS MAILLING LIST
      # macro index L "<modify-labels-then-hide>-inbox -unread +mailing +code -new"
      "index-tag-as-mailing-list".action = "<modify-labels-then-hide>-inbox -unread +mailing +code -new";
      "index-tag-as-mailing-list".key = "L";
      "index-tag-as-mailing-list".map = "index";

      # # TAG AS STARRED
      # macro index + "<modify-labels>+*"
      "index-tag-as-starred".action = "<modify-labels>+*";
      "index-tag-as-starred".key = "+";
      "index-tag-as-starred".map = "index";

      # # TAG AS UNSTARRED
      # macro index - "<modify-labels>-*"
      "index-tag-as-unstarred".action = "<modify-labels>-*";
      "index-tag-as-unstarred".key = "-";
      "index-tag-as-unstarred".map = "index";

      # # CONVERT HTML ATTACHMENTS TO TEXT, PREPEND > CHARACTERS AND COPY INTO SYSTEM CLIPBOARD
      # macro attach \Cp "<pipe-entry>~/.config/mutt/bin/quote-html-message.sh<enter>" "convert msg to text, quote it and copy to clipboard"
      # macro pager \Cp "<view-attachments><pipe-entry>~/.config/mutt/bin/quote-html-message.sh<enter><q>" "convert msg to text, quote it and copy to clipboard"

    };
    settings = {
# alternative_order text/plain text/html *
# auto_view text/html
#
# set auto_tag              = yes
# set move                  = no
# set mark_old              = no
# set sort                  = 'threads'
# set sort_aux              = 'reverse-last-date-received'
# set virtual_spoolfile     = yes                          # enable virtual folders
# set nm_default_uri        = "notmuch://$HOME/.local/share/mail/"
# set sidebar_delim_chars   = "/"             # Delete everything up to the last / character
# set sidebar_indent_string = " "          # Indent with two spaces
# set status_chars          = " *%A"
# set index_format          = "%4C (%4c) %Z %?GI?%GI& ? %[%d/%m/%Y @ %R]  %-20.19F %?K?%15.14K& ? %?M?(%3M)& ? %?X?¤& ? %s %> %?g?%g?"
# set record                = "+sent"
# set mbox_type             = Maildir
# set header_cache          = "~/.config/mutt/cache/headers"
# set message_cachedir      = "~/.config/mutt/cache/bodies"
# set certificate_file      = "~/.config/mutt/certificates"
# set status_format         = "───[ Folder: %f ]───[%r%m messages%?n? (%n new)?%?d? (%d to delete)?%?t? (%t tagged)? ]───%>─%?p?( %p postponed )?───"
# set new_mail_command      = "notifymuch"
# set sidebar_visible       = yes
# set sidebar_width         = 25
# set timeout               = 30
# set sendmail              = "/usr/bin/msmtp"
# set alias_file            = "~/.config/mutt/aliases"
# set sort_alias            = "alias"
# set reverse_alias         = yes
# set query_command         = "mates mutt-query '%s'"
# set pager_index_lines     = 20  # Shows 10 lines of index when pager is active
# set pager_context         = 3
#
# set quit                  # don't ask, just do!!
# set sidebar_folder_indent # Indent folders whose names we've shortened
# set sidebar_short_path    # Shorten mailbox names
# unset help                # No help bar at the top of index
# set include
# set pager_stop
# set menu_scroll
# set tilde
#
# ignore *
#
# unignore date: from: to: cc: subject:
# hdr_order date: from: to: cc: subject:
#
      };
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
