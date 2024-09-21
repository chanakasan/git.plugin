_g_main () {
  local base=$nx_git_root
  if [[ -z "$1" ]]; then
    _g_prompt
  else
    _g_try $1
  fi
}

_g_prompt() {
  local args=""
  local n=1
  local command

  while true; do
    if [[ -z $args ]]; then
      read -e -p "g: " input
    else
      read -e -p "g: $args " input
    fi

    if [[ -z "$input" ]]; then
      break
    fi

    if [[ $n == 1 && $input == "s" ]]; then
      git status
      n=2
      break
    fi

    #<< append args
    if [[ "${input: -1}" == "/" ]]; then
      args="${args}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      args="${args}${input%+}"
    elif [[ $n == 1 && -z $args ]]; then
      args="${input}"
    else
      args="${args} ${input}"
    fi
    #>>
  done

  if [[ -n $args ]]; then
    command="git $args"
    echo
    $command
  fi
}

_g_try() {
  local fn=g-$1
  if [[ $(type -t $fn ) == function ]]; then
    $fn "${@:2}"
  else
    git "$@"
  fi
}
