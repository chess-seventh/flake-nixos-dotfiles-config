# =========================
# SH FLOW
# =========================
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

alias p='pwd'
alias grep='grep --color=auto'

alias df='df -h'
alias snano='sudo nano'
alias grep='grep --color=auto'
alias dmesg='dmesg -T'
alias pist='pbpst -S -f '

alias cdh='cd $HOME'

alias meteog='curl wttr.in/geneva'
alias meteol='curl wttr.in/lausanne'

alias clippy='cargo clippy -- -W clippy::pedantic -A clippy::missing_errors_doc -A clippy::must_use_candidate -A clippy::module_name_repetitions -A clippy::doc_markdown -A clippy::missing_panics_doc'

# =========================
# FILE EDITING
# =========================

# alias muttrc='nvim ~/.config/mutt/muttrc'
# alias zshrc='nvim ~/.zshrc'
# alias vimrc='nvim ~/.vimrc'
# alias svim='sudo nvim'
#

alias bigdirs='du -h -a -d 1 ./ | sort -h -r | head -n 10'

alias sourcezsh='source ~/.zshrc'

alias gitquick='git add . && git commit -m "git quick auto-commit" && git push'

alias lzg=lazygit


# =========================
# AWS / KUBECTL ALIASES
# =========================

alias tf='terraform'
alias kb='kubectl'

## KUBECTL commands
#

alias kdev='kubectl config use-context dev.bestmile.io'
alias kprod='kubectl config use-context dev.bestmile.io'
alias kmgmt='kubectl config use-context dev.bestmile.io'

# GET CLASSIC NAMESPACES
#
alias kbgks='kubectl get pod -n kube-system'
alias kbgm='kubectl get pod -n monitoring'
alias kbgnode='kubectl get nodes --label-columns deployment.bestmile.io/uat,node-lifecycle'
alias kbgwide="kubectl get po -n $1 -o wide"
alias kbgp="kubectl get po -n $1"

alias kwn='watch -n 1 -d kubectl get nodes'
alias kdesc='kubectl describe'
alias klpod='kubectl logs -f'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kg='kubectl get'



# WATCH
#
alias kbwnode="watch -n 1 -d 'kubectl get nodes --label-columns deployment.bestmile.io/uat,node-lifecycle'"
alias kbwp="watch -n 1 -d 'kubectl get po -n $1' "


alias netshoot="kubectl run tmp-shell-host --rm -it --overrides='{\"spec\": {\"hostNetwork\": true}}' --image nicolaka/netshoot -- /bin/bash"


# =========================
# CONNECTIVITY
# =========================

# alias powerhub='sudo netctl-auto switch-to wlp61s0-PowerHub'
# alias powerhorse='sudo netctl-auto switch-to wlp61s0-PowerHorse'

# # =========================
# # PROTON / HOME VPN connections
# # =========================
# alias pvpn='sudo  protonvpn c --sc'
# alias pvpnr='sudo protonvpn c -r'
# alias pvpnf='sudo protonvpn c --f'
# alias pvpnd='sudo protonvpn d'
# alias pvpni='sudo protonvpn s'
#


# # JOURNALING
# # =========================
# # =========================
# alias jrnlw="jrnl work"
# alias jrnln="jrnl notes"
# alias twil="jrnl twil"
#
# alias backpwork='mount /mnt/usb_0/ && rsync -av --exlude .git* --progress $HOME/src /mnt/usb_0 && umount /mnt/usb_0/ '
# alias pw='genpw'
# alias fzp='fuzzy-pass'
#
# # =========================
# # TIMEWARRIOR
# # =========================
#
# alias tw=timew
# alias tws='timew summary'
# alias twsi='timew summary :ids'
# alias twsy='timew summary :yesterday'
# alias twsw='timew summary :week'
# alias twa='timew start'
# alias two='timew stop'
# alias twc='timew continue'
# alias twt='timew track'
# alias twl='timew lengthen'
# alias twsh='timew shorten'
#
# ## TASK WARRRIOR
# #
#
# alias tt='task list'
#
# alias twork='task add project:work'
#
# # =========================
# # WORKFLOW TMUX'ES & DIRS
# # =========================
#
# alias mtmux='tmuxp load -d  ~/.tmuxp/sweet_homey.yaml ; tmuxp load -d ~/.tmuxp/workey.yaml'
# alias tmuxpall='tmuxp load -d ~/.tmuxp/workey.yaml ; tmuxp load -d ~/.tmuxp/foss.yaml ; tmuxp load -d ~/.tmuxp/ricing.yaml ; tmuxp load -d ~/.tmuxp/swarm.yaml ; tmuxp load -d ~/.tmuxp/com.yaml'
# alias homey='tmuxp load -d ~/.tmuxp/sweet_homey.yaml'
# alias daemons='tmuxp load -d ~/.tmuxp/daemons.yaml'
# alias cdev='tmuxp load ~/.tmuxp/dev.yaml'
# alias workey='tmuxp load ~/.tmuxp/workey.yaml'
# alias vimwikey='tmuxp load ~/.tmuxp/vimwiki.yaml'
# alias runall='tmuxp load -d ~/.tmuxp/sweet_homey.yaml ~/.tmuxp/workey.yaml ~/.tmuxp/combine.yaml'
#
# alias vimwiki='nvim -c VimwikiIndex'
# alias workwiki="nvim -c 'VimwikiIndex 2'"
#
#
# # =========================
# # WORK
# # =========================
#
# alias swork='sh $HOME/.screenlayout/work.sh'
# alias wcon='sudo netctl stop-all && sudo netctl start wlp3s0-Bestmile'
# alias saws='source /usr/sbin/aws_zsh_completer.sh'
# alias chamber="aws-vault exec $AWS_PROFILE -- chamber"
#
# alias fixatlantis="sed -i 's/eu-west-1/.\/live\/eu-west-1/g' ../atlantis.yaml"
#
# # =========================
# # PIPENV
# # =========================
#
# alias pch='pipenv check'
# alias pcl='pipenv clean'
# alias pgr='pipenv graph'
# alias pi='pipenv install'
# alias pidev='pipenv install --dev'
# alias pl='pipenv lock'
# alias po='pipenv open'
# alias prun='pipenv run'
# alias psh='pipenv shell'
# alias psy='pipenv sync'
# alias pu='pipenv uninstall'
# alias pupd='pipenv update'
# alias pwh='pipenv --where'
# alias pvenv='pipenv --venv'
# alias ppy='pipenv --py'
#
