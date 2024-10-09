# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
    _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
    )
}


genpw() {
    LEN=$1
    RANDOM_SEP=$(</dev/urandom tr -dc '!"#$%&'\''()*+,-./:;<=>?@[\]^_{|}~' | head -c 5  ; echo)
    PW=$(xkcdpass -n 5 -d \""$RANDOM_SEP"\" -C alternating | sed 's/E/3/g' | sed 's/I/1/g' | sed 's/O/0/g' | sed 's/A/4/g' )
    if [[ $LEN ]]; then
        echo $PW | cut -c-$LEN
    else
        echo $PW
    fi
}


function fuzzy-pass() {
  DIR=$(pwd)
  cd "${PASSWORD_STORE_DIR:-${HOME}/.password-store}"
  PASSFILE=$(tree -Ffi | grep '.gpg' | sed 's/.gpg$//g' | sed 's/^..//' | fzf)

  [ -z "$PASSFILE" ] && return 0

  PASSDATA="$(pass ${PASSFILE})"
  PASS="$(echo "${PASSDATA}" | head -n 1)"
  LOGIN="$(echo "${PASSDATA}" | egrep -i "login:|username:|user:" | head -n 1 | cut -d' ' -f2-)"
  if [ -z "${LOGIN}" ] && [ -n "${PASS}" ]; then
    LOGIN=${PASSFILE##*/}
  fi
  EMAIL="$(echo "${PASSDATA}" | egrep -i "email:" | head -n 1 | cut -d' ' -f2-)"
  URL="$(echo "${PASSDATA}" | egrep -i "url:" | cut -d' ' -f2-)"
  if [ -z "${URL}" ]; then
    URL="$(basename $(dirname "${PASSFILE}"))"
    URL="$(echo "${URL}" | grep "\.")"
  fi

  cd ${DIR}

  ACTIONS="Edit\nFile"

  if [ -n "${URL}" ]; then
    ACTIONS="Url\n${ACTIONS}"
  fi
  if [ -n "${EMAIL}" ]; then
    ACTIONS="Email\n${ACTIONS}"
  fi
  if [ -n "${PASS}" ]; then
    ACTIONS="Password\n${ACTIONS}"
  fi
  if [ -n "${LOGIN}" ]; then
    ACTIONS="Login\n${ACTIONS}"
  fi

  CONTINUE=true

  while ${CONTINUE}; do
    ACTION=$(echo "${ACTIONS}" \
      | fzf --height 10 --border --header "Pass file ${PASSFILE}")
    case ${ACTION} in
      Login)
        echo "${LOGIN}" | clipcopy
        echo "Copied Login '${LOGIN}' to clipboard"
        ;;
      Password)
        pass --clip "${PASSFILE}" 1>/dev/null
        echo "Copied Password to clipboard (clear in 45 seconds)"
        ;;
      Url)
        echo "${URL}" | clipcopy
        echo "Copied Url '${URL}' to clipboard"
        ;;
      File)
        pass "${PASSFILE}"
        ;;
      Email)
        echo "${EMAIL}" | clipcopy
        echo "Copied Email '${EMAIL}' to clipboard"
        ;;
      Edit)
        pass edit "${PASSFILE}"
        ;;
      *)
        CONTINUE=false
        ;;
    esac
  done

}


