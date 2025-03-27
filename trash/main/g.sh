set -e

source $nx_git_root/main/lib.sh
source $nx_git_root/main/sub.sh

main() {
  local fn=g-$1
  if [[ -z $1 ]]; then
    git status
  elif [[ $(type -t $fn ) == function ]]; then
    $fn "${@:2}"
  else
    git "$@"
  fi
}

main "$@"
