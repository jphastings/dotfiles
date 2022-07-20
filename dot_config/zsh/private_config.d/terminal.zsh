export GPG_TTY=`tty`
export EDITOR="subl -w"

function csv {
  cat "$@" | sed 's/,/ ,/g' | column -t -s, | less -F -S -X -K
}
