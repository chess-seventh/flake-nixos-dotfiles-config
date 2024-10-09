pruneterragrunt() {
    find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
    find . -type f -name '.terraform.lock.hcl' -exec rm {} \;
}

atlantis() {
    terragrunt-atlantis-config generate --autoplan --parallel=false --workflow terragrunt --root ./ --output ./atlantis.yaml
}

kzoom () {
        set -e
        kill -9 $(pidof zoom)
}

fwmail() {
        notmuch search --format=json --output=summary tag:unread and tag:work  | jq -c '.[] |  [ .date_relative,  .subject, [ .authors ]  ] '  | sed 's/,/ | /g' | sed 's/"//g' | cut -c2- | rev | cut -c2- | rev | awk -F ',' '{ print }' | fzf --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
}

