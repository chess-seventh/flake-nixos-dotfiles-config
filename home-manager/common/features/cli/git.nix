{ ... }:

{
  programs.git = {
    enable = true;

    userEmail = "chess7th@pm.me";
    userName = "Chess Seventh";
    signing = {
      key = "DBC4A6C7DF1A29A18558D2B3A7D05D40C1C0C0F4";
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };

    aliases = {
# current working tree status using the short format
      s  = "status";
      st = "status --short";

      brd = "!git branch | fzf -m --print0 | tr -d ' ' | xargs -0 git branch -D";

# # delete merged branches
      dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d";

# ctags     = "!.git/hooks/ctags";

# # PULLS
# # nice git pull
      up        = "!git remote update -p; git merge --ff-only @{u}";
      ploh      = "!git pull origin `git rev-parse --abbrev-ref HEAD` --ff-only";

# # COMMITS
      com       = "commit -S";
      ca        = "commit -S -a --amend";
      wip       = "commit -S -a --message=WIP";
      cm        = "commit -S -m";
      cam       = "commit -S -am";
      cane      = "commit -S --amend --no-edit";

# # Retrieves last modified files
# fixup      = !"git status --short | grep '^.[MARCD]' |  sed 's/^.. //' | fzf | xargs -o git add $@  && git log -n 20 --pretty=format:'%h %s' --no-merges | fzf | cut -c -7 | xargs -o git commit --fixup && git rebase -i --autosquash origin/master";
      ap         = "add -p";
# autosquash = "!git rebase -i --autosquash origin/master";

# # COMPARE DIFFS LOGS GRAPHS
      d1        = "diff HEAD~1";
      graph     = "log --graph --date=format:'%e %b %Y' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit";
      co        = "checkout";
      cob       = "checkout -b";
# conflicts = "!git diff --name-only | uniq | xargs nvim";
      recent    = "for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'";
      dfr       = "!git diff origin `git rev-parse --abbrev-ref HEAD`";

      histline   = "log --pretty=oneline";
      histdiff   = "log --stat";

# preparemr = !"git log --pretty=format:'-%C(yellow)%d%Creset %s -- %C(cyan)(%ci)%Creset %C(bold blue)@%al%Creset' $(git rev-parse --abbrev-ref HEAD) --not $(git for-each-ref --format='%(refname)' refs/heads/ | grep -v $(git rev-parse --abbrev-ref HEAD) | grep -v Merge ) | sed 's/([^)]*) //' ";

# # CHECKOUT
      out = "checkout -- .";

      chom  = "checkout master";
      choma = "checkout main";
      chexp = "checkout release/experimental";
      exp   = "checkout release/experimental";
      chdev = "checkout release/dev";
      dev   = "checkout release/dev";
      chstg = "checkout release/stg";
      stg   = "checkout release/stg";
      chprd = "checkout release/prd";
      prd   = "checkout release/prd";

      recentbranch = "branch --sort=-committerdate";

# # show a nice log commit tree
      l         = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -p";
      lo        = "log --pretty=oneline -n 40 --graph --abbrev-commit";
      lg        = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' -n 20 --abbrev-commit";
      weeklylog = "!git log --since='`$(date -d \"last week\" +%Y-%m-%d)`' --no-merges --pretty=format:'%C(green)%cI%Creset %C(blue)%h%Creset %C(yellow)[%cl]%Creset %n%B'";


# # diff between the latest commit and the current state
# #d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat --color=always" | less -r
      d = "diff";

# # ERRORS
      undo      = "reset HEAD~1 --mixed";
      savepoint = "!git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard";

# # PUSHES
      po        = "push origin";
      poh       = "!git push origin `git rev-parse --abbrev-ref HEAD`";
      pof       = "!git push origin `git rev-parse --abbrev-ref HEAD` --force";

## Github pushes
      gpoh       = "!git push origin-gh `git rev-parse --abbrev-ref HEAD`";
      gpof       = "!git push origin-gh `git rev-parse --abbrev-ref HEAD` --force";

# # REBASE
      rba        = "rebase --abort";
      rbc        = "rebase --continue";

      rom       = "rebase -i origin/master";
      roma      = "rebase -i origin/main";

## Github rebases
      grom       = "rebase -i origin-gh/master";
      groma      = "rebase -i origin-gh/main";

# # WORK REBASES
      romexp = "rebase -i origin/release/experimental";
      romdev = "rebase -i origin/release/dev";
      romstg = "rebase -i origin/release/stg";
      romprd = "rebase -i origin/release/prd";

      prom  = "pull --rebase origin master";
      proma = "pull --rebase origin main";

      pom   = "pull origin master";
      poma  = "pull origin main";

## Github pulls
      gprom  = "pull --rebase origin master";
      gproma = "pull --rebase origin main";

      gpom   = "pull origin master";
      gpoma  = "pull origin main";

# # WORK PULL REBASES
      prexp  = "pull --rebase origin release/experimental";
      prodev = "pull --rebase origin release/dev";
      prostg = "pull --rebase origin release/stg";
      proprd = "pull --rebase origin release/prd";

# # FETCH
      fo = "fetch origin";
      r1 = "reset HEAD~1";

# # RIBBON
      ribbon  = "tag --force _ribbon origin/master";
      catchup = "log --patch --reverse --topo-order _ribbon..origin/master";

# # STASH
# sl  = "!git stash list | awk -F':' '{print $1}' | fzf --preview 'git -c color.ui=always stash show -p {}'";
# sp  = "!git stash pop `git stash list | awk -F':' '{print $1}' | fzf --preview 'git -c color.ui=always stash show -p {}'`";
# sd  = "!git stash drop `git stash list | awk -F':' '{print $1}' | fzf --preview 'git -c color.ui=always stash show -p {}'`";

# # TOP COMMITTERS
# topcommiters = !"git log | grep Author | grep -v Authored | sort | uniq -c | sort -n -r";

      identity = "! git config user.name \"$(git config user.$1.name)\"; git config user.email \"$(git config user.$1.email)\"; git config user.signingkey \"$(git config user.$1.signingkey)\"; :";

      url    = "config --show-origin remote.origin.url";
      user   = "!git config user.email && git config user.name";
      whoami = "!git config user.email && git config user.name";
    };
  };
}
