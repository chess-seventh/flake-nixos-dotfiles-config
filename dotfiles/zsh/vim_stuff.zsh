
vim_commands=(nvim)

function helpme {
    curl cheat.sh/"$1" | less
}

# set -o vi

vf() {
    # open file with vim
    local files

    files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

    if [[ -n $files ]]
    then
        vim -- $files
        print -l $files[1]
    fi
}

