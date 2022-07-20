function /() {
  if [[ "$1" == "" || "$1" == "--help" ]]; then
    echo "Clones projects locally, then changes into that directory"
    echo "$0 <project-name>"
    return
  fi

  if ! command -v "roo-clone" &> /dev/null; then
      echo "roo-clone could not be found."
      echo "  brew install deliveroo/tools/roo-clone"
      return
  fi

  output=$(roo clone "$@")
  ret=$?
  echo $output
  [[ $ret != "0" ]] && return
  cd ${output##* }
  echo "Updating from remote…"

  git fetch origin main master > /dev/null 2>&1
  [[ -z "$(git status --porcelain)" ]] || return
}